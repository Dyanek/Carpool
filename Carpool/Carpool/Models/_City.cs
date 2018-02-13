using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Carpool.Models
{
    [MetadataType(typeof(CityMetadata))]
    public partial class City
    {
        private class CityMetadata
        {
            [Display(Name = "City name")]
            [Required(ErrorMessage = "Please enter your city's name")]
            public string Name { get; set; }
        }
    }
}