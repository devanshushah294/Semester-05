using Microsoft.AspNetCore.Mvc;

namespace MyFirstApplication.Areas.Branch.Controllers
{
    [Area("Branch")]
    public class BranchController : Controller
    {
        public IActionResult BranchDisplay()
        {
            return View();
        }
    }
}
