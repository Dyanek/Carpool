using Carpool.Models;
using System;
using System.Linq;
using System.Web.Mvc;

namespace Carpool.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
            IQueryable<Trip> trips = DbContext.Trips.Where(x => x.Closing > DateTime.Now && x.NumberOfPlaces > DbContext.Joins.Where(j => j.TripId == x.Id).Count()
                && x.UserId != ConnectedUser.Id && !DbContext.Joins.Any(j => j.TripId == x.Id && j.UserId == ConnectedUser.Id)).OrderBy(x => x.Beginning);

            return View(trips);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}