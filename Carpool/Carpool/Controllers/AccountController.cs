using Carpool.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Carpool.Controllers
{
    public class AccountController : BaseController
    {
        [HttpGet]
        public ActionResult LogIn()
        {
            if (TempData["Error"] != null)
                Session["Error"] = TempData["Error"];
            else
                Session["Error"] = null;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogIn(string Email, string Password)
        {
            Session["Id"] = 1;

            return RedirectToAction("Index", "Home");
        }

        public ActionResult LogOut()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public ActionResult CreateAccount()
        {
            List<SelectListItem> items = new List<SelectListItem>();

            foreach (Country country in DbContext.Countries)
                items.Add(new SelectListItem { Text = country.Name, Value = country.Id.ToString() });

            ViewBag.CountriesList = GetCountriesList();

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateAccount(User pUser)
        {
            List<string> errorsList = new List<string>();

            //if(test compulsory fields empty)

            if (errorsList.Any())
            {
                Session["Error"] = ConcatenateErrors(errorsList);

                ViewBag.CountriesList = GetCountriesList();

                return View();
            }
            else
            {
                Session["Success"] = "You have succesfully created an account";
                return RedirectToAction("Index", "Home");
            }
        }

        public ActionResult Profile()
        {
            return View(ConnectedUser);
        }

        public ActionResult ManageFriends()
        {
            return View(ConnectedUser);
        }

        public ActionResult FindFriend()
        {
            return View(ConnectedUser);
        }
    }
}