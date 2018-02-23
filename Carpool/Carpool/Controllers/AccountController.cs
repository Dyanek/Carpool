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
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogIn(User pUser, bool? encryptedPassword)
        {
            string password;

            if (encryptedPassword == true)
                password = pUser.Password;
            else
                password = Encrypt.EncryptValue(pUser.Password);

            User user = DbContext.Users.FirstOrDefault(x => x.UserName == pUser.UserName && x.Password == password);

            if (user != null)
            {
                Session["Id"] = user.Id;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                TempData["Error"] = "No user found with this User name / Password combination";
                return View();
            }
        }

        public ActionResult LogOut()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public ActionResult CreateAccount()
        {
            ViewBag.CountriesList = new SelectList(DbContext.Countries.Where(x => x.Name != null).ToList(), "Id", "Name");

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateAccount(User pUser)
        {
            List<string> errorsList = new List<string>();

            if (pUser.UserName == null || pUser.Password == null || pUser.FirstName == null || pUser.LastName == null || pUser.Email == null || pUser.PhoneNumber == null || pUser.Address.Line1 == null || pUser.Address.PostalCode == null || pUser.Address.City.Name == null)
                errorsList.Add("One compulsory field or more are empty.");

            if (DbContext.Users.Any(x => x.UserName == pUser.UserName))
                errorsList.Add("This user name is already used");

            if (DbContext.Users.Any(x => x.Email == pUser.Email))
                errorsList.Add("This email address is already used");

            if (errorsList.Any())
            {
                TempData["Error"] = ConcatenateErrors(errorsList);

                ViewBag.CountriesList = new SelectList(DbContext.Countries.Where(x => x.Name != null).ToList(), "Id", "Name");

                return View();
            }
            else
            {
                pUser.Address.City = CheckCity(pUser.Address.City.Name, pUser.Address.City.Country.Id);

                pUser.Address = CheckAddress(pUser.Address);

                pUser.Password = Encrypt.EncryptValue(pUser.Password);

                DbContext.Users.Add(pUser);
                DbContext.SaveChanges();


                TempData["Success"] = "You have succesfully created an account";
                return LogIn(pUser, true);
            }
        }

        public ActionResult UserProfile()
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