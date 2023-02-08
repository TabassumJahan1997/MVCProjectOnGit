using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace trial_03.ViewModels
{
    public class AircraftEntryInputModel
    {
        [Display(Name ="Entry ID")]
        public int AircraftEntryId { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name ="Model")]
        public string ModelNo { get; set; }

        public string ImagePath { get; set; }

        [Display(Name ="Image")]
        public HttpPostedFileBase Image { get; set; }

        [Required]
        [Display(Name = "Number of Engine")]
        public int NoOfEngine { get; set; }

        [Required]
        [DataType(DataType.Date)]
        [Display(Name ="Production Date")]
        [DisplayFormat(DataFormatString ="{0:yyyy-MM-dd}",ApplyFormatInEditMode =true)]
        public System.DateTime ProductionDate { get; set; }

        public List<AircraftViewModel> Aircrafts { get; set; } = new List<AircraftViewModel>();
    }
}