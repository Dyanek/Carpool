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
            [Required(ErrorMessage = "The date must be at the format dd/MM/yyyy hh:mm")]
            [DataType(DataType.DateTime)]
            [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy hh:mm}")]
            public DateTime Beginning { get; set; }
        }
    }
}