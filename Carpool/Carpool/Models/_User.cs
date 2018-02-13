using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Carpool.Models
{
    [MetadataType(typeof(UserMetadata))]
    public partial class User
    {
        private class UserMetadata
        {
            [Display(Name = "User name")]
            [Required(ErrorMessage = "Please enter a user name")]
            public string UserName { get; set; }

            [Required(ErrorMessage = "Please enter a password")]
            public string Password { get; set; }

            [Display(Name = "First name")]
            [Required(ErrorMessage = "Please enter your first name")]
            public string FirstName { get; set; }

            [Display(Name = "Last name")]
            [Required(ErrorMessage = "Please enter your last name")]
            public string LastName { get; set; }

            [Required]
            public string Email { get; set; }

            [Display(Name = "Phone number")]
            [Required(ErrorMessage = "Please enter your phone number")]
            public string PhoneNumber { get; set; }
        }
    }
}