using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Carpool.Models
{
    [MetadataType(typeof(AddressMetadata))]
    public partial class Address
    {
        private class AddressMetadata
        {
            [Display(Name = "Line 1")]
            [Required(ErrorMessage = "Please enter your address")]
            public string Line1 { get; set; }

            [Display(Name = "Line 2")]
            public string Line2 { get; set; }

            [Display(Name = "Postal code")]
            [Required(ErrorMessage = "Please enter your postal code")]
            public string PostalCode { get; set; }
        }
    }
}