using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace trial_03.ViewModels
{
    public class AircraftViewModel
    {
        [Display(Name ="Aircraft")]
        public int AircraftId { get; set; }
        public decimal Price { get; set; }
    }
}