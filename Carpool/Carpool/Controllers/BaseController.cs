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
                    {
                        _connectedUser = DbContext.Users.Find((int)Session["Id"]);
                        _connectedUser = new User();
                    }
                }

                return _connectedUser;
            }
        }

        public BaseController()
        {
            if (Session != null)
            {
                Session["Success"] = null;
                Session["Error"] = null;
            }

            if (DbContext == null)
            {
                DbContext = new carpoolEntities();
            }
        }

        /// <summary>
        /// Closes and destroys the connection to the database
        /// </summary>
        void IDisposable.Dispose()
        {
            if (DbContext != null)
                DbContext = null;
        }
    }
}