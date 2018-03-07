using Carpool.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Carpool.Controllers
{
    public class TripController : BaseController
    {
        public ActionResult ManageTrips()
        {
            if (!UserIsConnected())
                return RedirectToAction("Index", "Home");

            return View();
        }

        [HttpGet]
        public ActionResult CreateTrip()
        {
            Trip trip = new Trip(DateTime.Now.AddHours(2), DateTime.Now.AddHours(1));

            if (!UserIsConnected())
                return RedirectToAction("Index", "Home");

            ViewBag.CountriesList = new SelectList(DbContext.Countries.Where(x => x.Name != null).ToList(), "Id", "Name");

            return View(trip);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateTrip(Trip pTrip, string price, string pBeginningDate, string pBeginningHour, string pClosingDate, string pClosingHour)
        {
            if (!UserIsConnected())
                return RedirectToAction("Index", "Home");

            List<string> errorsList = new List<string>();

            if (pBeginningDate == null || pBeginningHour == null || pClosingDate == null || pClosingHour == null || pTrip.Address.Line1 == null || pTrip.Address.PostalCode == null || pTrip.Address.City.Name == null)
                errorsList.Add("One compulsory field or more are empty.");

            if (pTrip.NumberOfPlaces <= 0 || pTrip.NumberOfPlaces > 10)
                errorsList.Add("The number of places must be between 1 and 10");

            pTrip.Price = Convert.ToDecimal(price.Replace('.', ','));

            if (pTrip.Price <= 0)
                errorsList.Add("The price must be positive, the decimals must be separated with a coma");

            if (pTrip.Duration <= 0)
                errorsList.Add("The duration must be positive");

            if (!string.IsNullOrEmpty(pBeginningDate) && !string.IsNullOrEmpty(pBeginningHour))
                pTrip.Beginning = Convert.ToDateTime(pBeginningDate + "-" + pBeginningHour).ToUniversalTime();

            if (!string.IsNullOrEmpty(pClosingDate) && !string.IsNullOrEmpty(pClosingHour))
                pTrip.Closing = Convert.ToDateTime(pClosingDate + "-" + pClosingHour).ToUniversalTime();

            if (pTrip.Beginning <= DateTime.Now || pTrip.Closing <= DateTime.Now)
                errorsList.Add("The beginning and closing dates must be over " + DateTime.Now);

            if (pTrip.Beginning < pTrip.Closing)
                errorsList.Add("The closing date must be before the beginning date");

            if (errorsList.Any())
            {
                TempData["Error"] = ConcatenateErrors(errorsList);

                ViewBag.CountriesList = new SelectList(DbContext.Countries.Where(x => x.Name != null).ToList(), "Id", "Name");

                return View(pTrip);
            }
            else
            {
                pTrip.IsRoutine = false;

                pTrip.Address.City = CheckCity(pTrip.Address.City.Name, pTrip.Address.City.Country.Id);

                pTrip.Address = CheckAddress(pTrip.Address);

                try
                {
                    DbContext.Trips.Add(pTrip);
                    DbContext.SaveChanges();
                }
                catch (Exception e)
                {
                    throw new Exception(e.Message);
                }

                Joins join = new Joins()
                {
                    Date = DateTime.Now,
                    UserId = ConnectedUser.Id,
                    TripId = DbContext.Trips.OrderByDescending(x => x.Id).FirstOrDefault().Id
                };

                DbContext.Joins.Add(join);
                DbContext.SaveChanges();

                TempData["Success"] = "You have succesfully created the trip";
                return RedirectToAction("ManageTrips");
            }
        }

        public ActionResult FindTrips()
        {
            return View();
        }
    }
}