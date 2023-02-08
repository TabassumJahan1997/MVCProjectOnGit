using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using trial_03.Models;
using trial_03.ViewModels;

namespace trial_03.Controllers
{
    public class AircraftEntryController : Controller
    {
        MasterDetail_AircraftDbContext db = new MasterDetail_AircraftDbContext();
        // GET: AircraftEntry
        public ActionResult Index()
        {
            return View(db.AircraftEntries.ToList());
        }

        public ActionResult Create()
        {
            ViewBag.aircrafts = db.Aircraft.ToList();
            var data = new AircraftEntryInputModel();
            data.Aircrafts.Add(new AircraftViewModel());
            return View(data);
        }

        [HttpPost]
        public ActionResult Create(AircraftEntryInputModel model,int[] aircraftId)
        {
            if (ModelState.IsValid)
            {
                var et = new AircraftEntry
                {
                    ModelNo = model.ModelNo,
                    ImagePath = model.ImagePath,
                    NoOfEngine = model.NoOfEngine,
                    ProductionDate = model.ProductionDate
                };
                foreach (var item in aircraftId)
                {
                    et.EntryAircrafts.Add(new EntryAircraft { AircraftId=item});
                }
                if (model.Image.ContentLength > 0)
                {
                    string ext = Path.GetExtension(model.Image.FileName);
                    string fileName = Guid.NewGuid() + ext;
                    model.Image.SaveAs(Path.Combine(Server.MapPath("~/Images"),fileName));
                    et.ImagePath = fileName;
                }
                db.AircraftEntries.Add(et);
                db.SaveChanges();
                return PartialView("_success");
            }
            ViewBag.aircrafts = db.Aircraft.ToList();
            return PartialView("_error");
        }

        public JsonResult GetPrice(int id)
        {
            var a = db.Aircraft.FirstOrDefault(x => x.AircraftId == id);
            return Json(a==null?0:a.Price);
        }

        public ActionResult CreateNewField(AircraftEntryInputModel data)
        {
            ViewBag.aircrafts = db.Aircraft.ToList();
            data.Aircrafts.Add(new AircraftViewModel());
            return PartialView(data);
        }

        public PartialViewResult CreateAircraftEntry()
        {
            ViewBag.aircrafts = db.Aircraft.ToList();
            return PartialView("_AircraftEntry");
        }
    }
}