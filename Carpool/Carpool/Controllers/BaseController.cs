using Carpool.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Carpool.Controllers
{
    public abstract class BaseController : Controller, IDisposable
    {
        private User _connectedUser = null;

        /// <summary>Gets the data context connected to the database.</summary>
        public carpoolEntities DbContext { get; private set; }


        /// <summary>Obtient ou définit l'identifiant de l'utilisateur connecté.</summary>
        public User ConnectedUser
        {
            get
            {
                if (_connectedUser == null)
                {
                    if (Session["Id"] != null)
                        _connectedUser = DbContext.Users.Find((int)Session["Id"]);
                }

                return _connectedUser;
            }
        }

        public BaseController()
        {
            if (DbContext == null)
                DbContext = new carpoolEntities();
        }

        /// <summary>
        /// Closes and destroys the connection to the database
        /// </summary>
        void IDisposable.Dispose()
        {
            if (DbContext != null)
                DbContext = null;
        }

        public bool UserIsConnected()
        {
            if (ConnectedUser == null)
            {
                TempData["Error"] = "You need to be connected to have access to this page";
                return false;
            }
            else
                return true;
        }

        public string ConcatenateErrors(List<string> errorsList)
        {
            string str = "";

            foreach (string error in errorsList)
                str += error + " | ";

            return str.Substring(0, str.Length - 3);
        }

        public City CheckCity(string cityName, int countryId)
        {
            if (!DbContext.Cities.Any(x => x.Name == cityName && x.CountryId == countryId))
            {
                City newCity = new City
                {
                    Name = cityName,
                    CountryId = countryId
                };

                DbContext.Cities.Add(newCity);
                DbContext.SaveChanges();
            }

            return DbContext.Cities.FirstOrDefault(x => x.Name == cityName && x.CountryId == countryId);
        }

        public Address CheckAddress(Address address)
        {
            Address newAddress = new Address
            {
                Line1 = address.Line1,
                Line2 = address.Line2,
                PostalCode = address.PostalCode,
                CityId = address.City.Id
            };

            DbContext.Addresses.Add(newAddress);
            DbContext.SaveChanges();

            return DbContext.Addresses.FirstOrDefault(x => x.Line1 == address.Line1 && x.Line2 == address.Line2 && x.PostalCode == address.PostalCode && x.CityId == address.City.Id);
        }
    }
}