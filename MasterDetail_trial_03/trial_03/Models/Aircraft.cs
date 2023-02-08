//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace trial_03.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Aircraft
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Aircraft()
        {
            this.EntryAircrafts = new HashSet<EntryAircraft>();
        }
    
        public int AircraftId { get; set; }
        public string AircraftName { get; set; }
        public decimal Price { get; set; }
        public bool Available { get; set; }
        public int AircraftTypeId { get; set; }
    
        public virtual AircraftType AircraftType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EntryAircraft> EntryAircrafts { get; set; }
    }
}