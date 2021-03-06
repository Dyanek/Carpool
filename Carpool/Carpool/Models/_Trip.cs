﻿using System;
using System.ComponentModel.DataAnnotations;

namespace Carpool.Models
{
    [MetadataType(typeof(TripMetadata))]
    public partial class Trip
    {
        public Trip(DateTime beginningDate, DateTime closingDate)
        {
            Beginning = beginningDate;
            Closing = closingDate;
        }

        private class TripMetadata
        {
            [Display(Name = "Number of places")]
            [Required(ErrorMessage = "You need to enter a valid number")]
            [Range(1, 10, ErrorMessage = "The number of places must be between 1 and 10")]         
            public int NumberOfPlaces { get; set; }

            [Required(ErrorMessage = "You need to enter a valid price")]
            [Range(0.1, 10000, ErrorMessage = "The price must be between £0.10 and £10000")]
            public decimal Price { get; set; }

            [Required(ErrorMessage = "You must enter a duration")]
            [Range(1, 1440, ErrorMessage = "The duration must be between 1 and 1440 minutes")]          
            public DateTime Duration { get; set; }

            [Display(Name = "Beginning date")]
            [DataType(DataType.Date)]
            [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
            public DateTime Beginning { get; set; }

            [Display(Name = "Closing date")]
            [DataType(DataType.Date)]
            [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
            public DateTime Closing { get; set; }


        }
    }
}