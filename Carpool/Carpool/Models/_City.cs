using System.ComponentModel.DataAnnotations;

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