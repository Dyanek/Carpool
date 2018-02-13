﻿using Carpool.Models;
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
            ViewBag.Address = new SelectList(DbContext.Addresses.ToList(), "Id", "Line1");

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateAccount([Bind(Include ="UserName,Password,FirstName,LastName,Email,PhoneNumber")] User pUser)
        {
            return RedirectToAction("LogIn");
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