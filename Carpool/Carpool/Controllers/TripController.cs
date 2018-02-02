using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Carpool.Controllers
{
    public class TripController : BaseController
    {
        // GET: Trip
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CreateTrip()
        {
            return View();
        }

        public ActionResult FindTrips()
        {
            return View();
        }
    }
}