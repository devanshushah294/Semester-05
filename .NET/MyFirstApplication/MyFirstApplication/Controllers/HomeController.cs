using Microsoft.AspNetCore.Mvc;
using MyFirstApplication.Models;
using System.Diagnostics;

namespace MyFirstApplication.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            List<string> list1 = new List<string>();
            list1.Add("Privacy Page");
            list1.Add("From DotNet Core");
            list1.Add("in Darshan University");
            list1.Add("Semester-05");
            ViewBag.list1 = list1;
            ViewData["list1"] = list1;
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}