using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Carpool.Controllers
{
    public class AccountController : Controller
    {
        public ActionResult LogOut()
        {
            return RedirectToAction("Index", "Home");
        }

        public ActionResult Profile()
        {
            return View();
        }

        public ActionResult ManageFriends()
        {
            return View();
        }

        public ActionResult FindFriend()
        {
            return View();
        }
    }
}