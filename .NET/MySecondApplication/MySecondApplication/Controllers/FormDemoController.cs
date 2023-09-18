using Microsoft.AspNetCore.Mvc;

namespace MySecondApplication.Controllers
{
    public class FormDemoController : Controller
    {
        public IActionResult FormDemoView()
        {
            return View();
        }
    }
}
