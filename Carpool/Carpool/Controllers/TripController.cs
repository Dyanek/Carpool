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

            List<Trip> tripsList = new List<Trip>();

            foreach (Trip trip in DbContext.Trips.Where(x => x.Beginning > DateTime.Now))
            {
                if (DbContext.Joins.Any(x => x.UserId == ConnectedUser.Id && x.TripId == trip.Id))
                    tripsList.Add(trip);
            }

            return View(tripsList);
        }

        public ActionResult DeleteTrip(int pTripId)
        {
            DbContext.Joins.RemoveRange(DbContext.Joins.Where(x => x.TripId == pTripId));
            DbContext.Trips.Remove(DbContext.Trips.FirstOrDefault(x => x.Id == pTripId));
            DbContext.SaveChanges();

            return RedirectToAction("ManageTrips");
        }

        public ActionResult LeaveTrip(int pTripId)
        {
            DbContext.Joins.Remove(DbContext.Joins.First(x => x.UserId == ConnectedUser.Id && x.TripId == pTripId));
            DbContext.SaveChanges();

            return RedirectToAction("ManageTrips");
        }

        [HttpGet]
        public ActionResult CreateTrip()
        {
            if (!UserIsConnected())
                return RedirectToAction("Index", "Home");

            Trip trip = new Trip(DateTime.Now.AddHours(2), DateTime.Now.AddHours(1));

            ViewBag.CountriesList = new SelectList(DbContext.Countries.Where(x => x.Name != null).ToList(), "Id", "Name");

            return View(trip);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateTrip(Trip pTrip, string price, string pBeginningDate, string pBeginningHour, string pClosingDate, string pClosingHour)
        {
            if (!UserIsConnected())
                return RedirectToAction("Index", "Home");

            pTrip.UserId = ConnectedUser.Id;

            List<string> errorsList = new List<string>();

            if (pBeginningDate == null || pBeginningHour == null || pClosingDate == null || pClosingHour == null || pTrip.Address.Line1 == null
                || pTrip.Address.PostalCode == null || pTrip.Address.City.Name == null)
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

                Joins join = new Joins(ConnectedUser.Id, DbContext.Trips.OrderByDescending(x => x.Id).FirstOrDefault().Id);

                DbContext.Joins.Add(join);
                DbContext.SaveChanges();

                TempData["Success"] = "You have succesfully created the trip";
                return RedirectToAction("ManageTrips");
            }
        }

        [HttpGet]
        public ActionResult FindTrips()
        {
            Trip trip = new Trip(DateTime.Now.AddHours(2), DateTime.Now.AddHours(1));

            ViewBag.CountriesList = new SelectList(DbContext.Countries.Where(x => x.Name != null).ToList(), "Id", "Name");

            return View(trip);
        }

        [HttpPost]
        public ActionResult FindTrips(string pLowerBoundary, string pUpperBoundary, string pNumberOfPlaces, string pBeginningDate, string pBeginningHour,
            string pClosingDate, string pClosingHour, string pDuration, string pLine1, string pLine2, string pPostalCode, string pCityName, string pCountryId)
        {
            //Traitement de recherche

            string query = "SELECT * FROM trip_tri WHERE ";

            if (pLowerBoundary != "")
                query += "tri_price >= " + pLowerBoundary + " ";

            if (pUpperBoundary != "")
                query += "tri_price <= " + pUpperBoundary + " ";

            if (pNumberOfPlaces != "")
                query += "tri_number_of_places = " + pNumberOfPlaces + " ";

            DateTime beginning = DateTime.Now;

            if (!string.IsNullOrEmpty(pBeginningDate) && !string.IsNullOrEmpty(pBeginningHour))
                beginning = Convert.ToDateTime(pBeginningDate + "-" + pBeginningHour).ToUniversalTime();

            beginning = beginning.AddHours(-1);

            if (beginning != null)
                query += "tri_beginning >= '" + beginning.Year + "-" + beginning.Month + "-" + beginning.Day + " " + beginning.Hour + ":" + beginning.Minute + "' ";

            DateTime closing = DateTime.Now;

            if (!string.IsNullOrEmpty(pClosingDate) && !string.IsNullOrEmpty(pClosingHour))
                closing = Convert.ToDateTime(pClosingDate + "-" + pClosingHour).ToUniversalTime();

            if (closing != null)
                query += "tri_closing >= '" + closing.Year + "-" + closing.Month + "-" + closing.Day + " " + closing.Hour + ":" + closing.Minute + "' ";

            if (pDuration != "")
                query += "tri_duration = " + pDuration + " ";

            //DbContext.Database.SqlQuery(type, query, null);

            IQueryable<Trip> trips;

            if (ConnectedUser == null)
                trips = DbContext.Trips.Where(x => x.Closing > DateTime.Now).OrderBy(x => x.Beginning);
            else
                trips = DbContext.Trips.Where(x => x.Closing > DateTime.Now && x.UserId != ConnectedUser.Id).OrderBy(x => x.Beginning);

            return View("FoundTrips", trips);
        }

        public ActionResult JoinTrip(int pTripId)
        {
            Joins joins = new Joins(ConnectedUser.Id, pTripId);

            DbContext.Joins.Add(joins);
            DbContext.SaveChanges();

            return RedirectToAction("ManageTrips");
        }
    }
}