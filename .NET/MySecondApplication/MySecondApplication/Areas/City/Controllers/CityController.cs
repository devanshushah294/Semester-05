using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
namespace MySecondApplication.Areas.City.Controllers
{
    [Area("City")]
    public class CityController : Controller
    {
        public readonly IConfiguration _configuration;
        public CityController(IConfiguration configuration)
        {
            this._configuration = configuration;
        }
        public IActionResult CityView()
        {
            string connStr = this._configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_LOC_City_SelectAll";
            SqlDataReader reader = cmd.ExecuteReader();
            dt.Load(reader);
            conn.Close();
            return View(dt);
        }
        public IActionResult DeleteCity(int CityID)
        {
            string connStr = this._configuration.GetConnectionString("myConnectionString");
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_LOC_City_DeleteByCityID";
            cmd.Parameters.AddWithValue("@CityID", CityID);
            cmd.ExecuteNonQuery();
            conn.Close();
            return RedirectToAction("CountryView");
        }
        public IActionResult CityAddEdit(int? CityID) { return View(); }
    }
}
