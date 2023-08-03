using Microsoft.AspNetCore.Mvc;

namespace MyFirstApplication.Areas.Validation.Controllers
{
    [Area("Validation")]
    public class ValidationController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
