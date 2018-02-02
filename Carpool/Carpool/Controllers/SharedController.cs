using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Carpool.Controllers
{
    public class SharedController : BaseController
    {
        // GET: Layout
        [ActionName("_Login")]
        public ActionResult LogIn()
        {
            return PartialView("_Login", ConnectedUser);
        }
    }
}