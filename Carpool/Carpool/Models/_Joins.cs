using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Carpool.Models
{
    public partial class Joins
    {
        public Joins() { }

        public Joins(int pUserId, int pTripId)
        {
            Date = DateTime.Now;
            UserId = pUserId;
            TripId = pTripId;
        }
    }
}