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
        public ActionResult ManageTrips()
        {
            return View(ConnectedUser);
        }

        public ActionResult CreateTrip()
        {
            return View(ConnectedUser);
        }

        public ActionResult FindTrips()
        {
            return View(ConnectedUser);
        }
    }
}