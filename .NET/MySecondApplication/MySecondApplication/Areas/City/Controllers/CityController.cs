using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using MySecondApplication.Areas.City.Models;
using NuGet.Protocol;

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
        public IActionResult CityAddEdit(int? CityID)
        {
            string connStr = this._configuration.GetConnectionString("myConnectionString");
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand countryCommand = conn.CreateCommand();
            countryCommand.CommandType = CommandType.Text;
            countryCommand.CommandText = "Select CountryID,CountryName from LOC_Country";
            List<CountryModel> list1 = new List<CountryModel>();
            using (SqlDataReader countryReader = countryCommand.ExecuteReader())
            {
                while (countryReader.Read())
                {
                    CountryModel country = new CountryModel();
                    {
                        country.CountryID = Convert.ToInt32(countryReader["CountryID"]);
                        country.CountryName = (string)countryReader["CountryName"];
                    };
                    list1.Add(country);
                }
            }
            
            conn.Close();
            CityModel city = new CityModel();
            city.countryList = list1;
            return View(city);
        }
        public IActionResult GetStatesByCountryID(int CountryID)
        {
            string connectionString = this._configuration.GetConnectionString("myConnectionString");

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (SqlCommand stateCommand = conn.CreateCommand())
                {
                    stateCommand.CommandType = CommandType.Text;
                    stateCommand.CommandText = "SELECT StateID, StateName, CountryID FROM LOC_State WHERE CountryID = @CountryID";
                    stateCommand.Parameters.AddWithValue("@CountryID", CountryID);

                    List<StateModel> list2 = new List<StateModel>();
                    using (SqlDataReader stateReader = stateCommand.ExecuteReader())
                    {
                        while (stateReader.Read())
                        {
                            StateModel state = new StateModel();
                            {
                                state.StateID = Convert.ToInt32(stateReader["StateID"]);
                                state.StateName = (string)stateReader["StateName"];
                                state.CountryID = Convert.ToInt32(stateReader["CountryID"]);
                            };
                            list2.Add(state);
                        }
                    }

                    return Json(list2);
                }
            }
        }

    }
}
