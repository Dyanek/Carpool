//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Carpool.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Trip
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Trip()
        {
            this.Joins = new HashSet<Joins>();
        }
    
        public int Id { get; set; }
        public int NumberOfPlaces { get; set; }
        public decimal Price { get; set; }
        public Nullable<bool> IsRoutine { get; set; }
        public decimal Period { get; set; }
        public System.DateTime Beginning { get; set; }
        public System.DateTime Closing { get; set; }
        public int Duration { get; set; }
        public int AddressId { get; set; }
    
        public virtual Address Address { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Joins> Joins { get; set; }
    }
}
