using System.ComponentModel.DataAnnotations;

namespace Carpool.Models
{
    [MetadataType(typeof(CountryMetadata))]
    public partial class Country
    {
        private class CountryMetadata
        {
            [Display(Name = "Country")]
            [Required(ErrorMessage = "Please enter your country's name")]
            public string Name { get; set; }
        }
    }
}