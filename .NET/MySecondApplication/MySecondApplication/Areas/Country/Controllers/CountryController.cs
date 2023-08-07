using System.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System.Data.SqlClient;

namespace MySecondApplication.Areas.Country.Controllers
{
    [Area("Country")]
    public class CountryController : Controller
    {
        private readonly IConfiguration _configuration;
        public CountryController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public IActionResult CountryView()
        {
            String connectionStr = this._configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlCommand command = connectionStr.CreateCommand();
            return View();
        }
    }
}
