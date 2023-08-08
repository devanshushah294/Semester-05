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
            SqlConnection conn = new SqlConnection(connectionStr);
            conn.Open();
            SqlCommand objCmd = conn.CreateCommand();
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandText = "PR_LOC_Country_SelectAll";
            SqlDataReader objDataReader = objCmd.ExecuteReader();
            dt.Load(objDataReader);
            conn.Close();
            return View("CountryView", dt);
        }
        
        public IActionResult DeleteCountry(int id)
        {
            try
            {
                String connectionStr = this._configuration.GetConnectionString("myConnectionString");
                SqlConnection conn = new SqlConnection(connectionStr);
                conn.Open();
                SqlCommand objCmd = conn.CreateCommand();
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.CommandText = "PR_LOC_Country_Delete"; // Assuming you have a stored procedure for deleting a country
                objCmd.Parameters.AddWithValue("@CountryID", id);
                int rowsAffected = objCmd.ExecuteNonQuery();
                conn.Close();

                if (rowsAffected > 0)
                {
                    // Successful deletion
                    return RedirectToAction("CountryView");
                }
                else
                {
                    // Deletion failed
                    // You can handle this scenario according to your application's requirements
                    return RedirectToAction("CountryView"); // Redirect back to the list view
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                // You can log the exception, show an error message, or redirect to an error page
                return RedirectToAction("CountryView"); // Redirect back to the list view
            }
        }
}
