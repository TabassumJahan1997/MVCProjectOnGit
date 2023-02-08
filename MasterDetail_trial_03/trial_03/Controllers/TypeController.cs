using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using trial_03.Models;
using trial_03.ViewModels;

namespace trial_03.Controllers
{
    public class TypeController : Controller
    {
        MasterDetail_AircraftDbContext db = new MasterDetail_AircraftDbContext();
        // GET: Type
        public ActionResult Index()
        {
            return View(db.AircraftTypes.ToList());
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(AircraftType type)
        {
            if (ModelState.IsValid)
            {
                db.AircraftTypes.Add(type);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View();
        }

        public ActionResult Edit(int id)
        {
            return View(db.AircraftTypes.First(t => t.AircraftTypeId == id));
        }

        [HttpPost]
        public ActionResult Edit(AircraftType type)
        {
            if (ModelState.IsValid)
            {
                db.Entry(type).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(type);
        }

        public ActionResult Delete(int id)
        {
            return View(db.AircraftTypes.First(t=>t.AircraftTypeId==id));
        }

        [HttpPost]
        [ActionName("Delete")]
        public ActionResult ExecuteDelete(int id)
        {
            var typeToDelete = new AircraftType { AircraftTypeId = id };
            db.Entry(typeToDelete).State = System.Data.Entity.EntityState.Deleted;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}