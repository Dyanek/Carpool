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
            if (!UserIsConnected())
                return RedirectToAction("Index", "Home");

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateTrip(Trip pTrip)
        {
            pTrip.IsRoutine = false;

            return RedirectToAction("ManageTrips");
        }

        public ActionResult FindTrips()
        {
            return View();
        }
    }
}