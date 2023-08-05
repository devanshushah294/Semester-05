using Microsoft.AspNetCore.Mvc;
using MyFirstApplication.Areas.Validation.Models;

namespace MyFirstApplication.Areas.Validation.Controllers
{
    [Area("Validation")]
    public class ValidationController : Controller
    {
        public IActionResult Index()
        {
            if(!ModelState.IsValid)
            {
                return View("Index1");
            }
            return View();
        }
    }
}
