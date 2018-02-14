using System;
using System.Security.Cryptography;
using System.Text;

namespace Carpool.Models
{
    public static class Encrypt
    {
        /// <summary>
        /// Returns a crypted string from the uncrypted input
        /// </summary>
        /// <param name="password">Value to crypt</param>
        /// <returns>Crypted value</returns>
        public static String EncryptValue(String password)
        {
            if (password != "" && password != null)
            {
                SHA256 sha = SHA256.Create();

                byte[] data = sha.ComputeHash(Encoding.Default.GetBytes(password));

                StringBuilder sb = new StringBuilder();

                for (int i = 0; i < data.Length; i++)
                    sb.Append(data[i].ToString("x2"));

                return sb.ToString();
            }
            else
                return "";
        }
    }
}