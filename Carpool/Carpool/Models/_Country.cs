using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Carpool.Models
{
    [MetadataType(typeof(CountryMetadata))]
    public partial class Country
    {
        private class CountryMetadata
        {
            [Display(Name = "Country name")]
            [Required(ErrorMessage = "Please enter your country's name")]
            public string Name { get; set; }
        }
    }
}