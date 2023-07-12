using Assignment1Lonely.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using static System.Collections.Specialized.BitVector32;
using System.Runtime.Intrinsics.X86;

namespace Assignment1Lonely.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult About() { 
            return View();
        }
        public IActionResult Resume()
        {
            return View();
        }
        public IActionResult Services()
        {
            return View();
        }
        public IActionResult Portfolio()
        {
            return View();
        }
        public IActionResult Contact()
        {
            return View();
        }
    }
}