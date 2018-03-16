using Carpool.Models;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
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

        [HttpGet]
        public ActionResult UserProfile()
        {
            if (!UserIsConnected())
                return RedirectToAction("Index", "Home");

            ViewBag.CountriesList = new SelectList(DbContext.Countries.Where(x => x.Name != null).ToList(), "Id", "Name");

            return View(ConnectedUser);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UserProfile(User pUser)
        {
            if (!UserIsConnected())
                return RedirectToAction("Index", "Home");

            List<string> errorsList = new List<string>();

            if (pUser.UserName == null || pUser.Password == null || pUser.FirstName == null || pUser.LastName == null || pUser.Email == null || pUser.PhoneNumber == null || pUser.Address.Line1 == null || pUser.Address.PostalCode == null || pUser.Address.City.Name == null)
                errorsList.Add("One compulsory field or more are empty.");

            ConnectedUser.FirstName = pUser.FirstName;
            ConnectedUser.LastName = pUser.LastName;
            ConnectedUser.PhoneNumber = pUser.PhoneNumber;

            if (DbContext.Users.Any(x => x.UserName == pUser.UserName && x.Id != ConnectedUser.Id))
                errorsList.Add("This user name is already used");

            ConnectedUser.UserName = pUser.UserName;

            if (DbContext.Users.Any(x => x.Email == pUser.Email && x.Id != ConnectedUser.Id))
                errorsList.Add("This email address is already used");

            ConnectedUser.Email = pUser.Email;

            if (errorsList.Any())
            {
                TempData["Error"] = ConcatenateErrors(errorsList);

                ViewBag.CountriesList = new SelectList(DbContext.Countries.Where(x => x.Name != null).ToList(), "Id", "Name");

                return View();
            }
            else
            {
                pUser.Address.City = CheckCity(pUser.Address.City.Name, pUser.Address.City.Country.Id);

                if (ConnectedUser.Address.City.Name != pUser.Address.City.Name || ConnectedUser.Address.City.CountryId != pUser.Address.City.CountryId || ConnectedUser.Address.Line1 != pUser.Address.Line1 ||
                    ConnectedUser.Address.Line2 != pUser.Address.Line2 || ConnectedUser.Address.PostalCode != pUser.Address.PostalCode)
                    ConnectedUser.Address = CheckAddress(pUser.Address);

                DbContext.Entry(ConnectedUser).State = EntityState.Modified;
                DbContext.SaveChanges();

                TempData["Success"] = "Your information were successfully modified";

                ViewBag.CountriesList = new SelectList(DbContext.Countries.Where(x => x.Name != null).ToList(), "Id", "Name");

                return View(pUser);
            }
        }

        [HttpGet]
        public ActionResult ChangePassword()
        {
            if (!UserIsConnected())
                return RedirectToAction("Index", "Home");

            return View();
        }

        [HttpPost]
        public ActionResult ChangePassword(string pCurrentPassword, string pNewPassword, string pNewPassword2)
        {
            if (!UserIsConnected())
                return RedirectToAction("Index", "Home");

            List<string> errorsList = new List<string>();

            if (ConnectedUser.Password != Encrypt.EncryptValue(pCurrentPassword))
                errorsList.Add("The current password entered does not match with your current password");

            if (pNewPassword != pNewPassword2)
                errorsList.Add("The two new passwords are different");

            if (errorsList.Any())
            {
                TempData["Error"] = ConcatenateErrors(errorsList);

                ViewBag.CountriesList = new SelectList(DbContext.Countries.Where(x => x.Name != null).ToList(), "Id", "Name");

                return View();
            }
            else
            {
                ConnectedUser.Password = Encrypt.EncryptValue(pNewPassword);

                DbContext.Entry(ConnectedUser).State = EntityState.Modified;
                DbContext.SaveChanges();

                TempData["Success"] = "Your password was successfully changed";

                ViewBag.CountriesList = new SelectList(DbContext.Countries.Where(x => x.Name != null).ToList(), "Id", "Name");

                return RedirectToAction("UserProfile");
            } 
        }

        public ActionResult ManageFriends()
        {
            if (!UserIsConnected())
                return RedirectToAction("Index", "Home");

            return View(ConnectedUser);
        }

        public ActionResult FindFriend()
        {
            if (!UserIsConnected())
                return RedirectToAction("Index", "Home");

            return View(ConnectedUser);
        }
    }
}