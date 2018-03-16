using System.Web.Mvc;

namespace Carpool.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
                return View(ConnectedUser);
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