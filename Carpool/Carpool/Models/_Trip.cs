using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Carpool.Models
{
    [MetadataType(typeof(TripMetadata))]
    public partial class Trip
    {
        private class TripMetadata
        {
            [Display(Name = "Number of places")]
            [Required(ErrorMessage = "You need to enter a valid number")]
            public int NumberOfPlaces { get; set; }

            [Display(Name = "Beginning date")]
            [Required(ErrorMessage = "You must enter a valid date, the format is MM/dd/yyyy hh:mm")]
            [RegularExpression(@"^[0-1]\d\/[0-3]\d\/[2][0]\d{2}\s[0-2]\d:[0-5]\d$", ErrorMessage = "Date must be in format MM/dd/yyyy hh:mm")]
            public DateTime Beginning { get; set; }

            [Display(Name = "Closing date")]
            [Required(ErrorMessage = "You must enter a valid date, the format is MM/dd/yyyy hh:mm")]
            [RegularExpression(@"^[0-1]\d\/[0-3]\d\/[2][0]\d{2}\s[0-2]\d:[0-5]\d$", ErrorMessage = "Date must be in format MM/dd/yyyy hh:mm")]
            public DateTime Closing { get; set; }
        }
    }
}