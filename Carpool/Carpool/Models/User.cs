using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Carpool.Models
{
    public partial class User
    {

        private string _lastName;
        private string _firstName;
        private string _email;
        private string _password;
        public string LastName { get => _lastName; set => _lastName = value; }
        public string FirstName { get => _firstName; set => _firstName = value; }
        public string Email { get => _email; set => _email = value; }
        public string Password { get => _password; set => _password = value; }

        public User(string lastName, string firstName)
        {
            LastName = lastName;
            FirstName = firstName;
        }
    }
}