using Microsoft.AspNetCore.Mvc;
using MySecondApplication.Areas.State.Models;
using System.Data;
using System.Data.SqlClient;

namespace MySecondApplication.Areas.State.Controllers
{
    [Area("State")]
    public class StateController : Controller
    {
        public readonly IConfiguration _configuration;
        public StateController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public IActionResult StateView()
        {
            string connectionString = this._configuration.GetConnectionString("myConnectionString");
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_LOC_State_SelectAll";
            SqlDataReader reader = cmd.ExecuteReader();
            DataTable dataTable = new DataTable();
            dataTable.Load(reader);
            conn.Close();
            return View(dataTable);
        }
        public IActionResult DeleteState(int StateID)
        {
            string connectionString = this._configuration.GetConnectionString("myConnectionString");
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_LOC_State_Delete";
            cmd.Parameters.AddWithValue("@StateID", StateID);
            cmd.ExecuteNonQuery();
            conn.Close();
            return RedirectToAction("StateView");
        }
        public IActionResult StateAddEdit(int? StateID)
        {
            string connectionString = this._configuration.GetConnectionString("myConnectionString");
            StateModel model = new StateModel();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select CountryID,CountryName from LOC_Country";
            List<CountryModel> list = new List<CountryModel>();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    CountryModel country = new CountryModel();
                    {
                        country.CountryId = Convert.ToInt32(reader["CountryID"]);
                        country.CountryName = (string)reader["CountryName"];
                    };
                    list.Add(country);
                }
            }
            model.Countries = list;
            conn.Close();
            if (StateID != null)
            {
                conn.Open();
                using (SqlCommand cmd2 = conn.CreateCommand())
                {
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.CommandText = "PR_LOC_State_SelectByStateID";
                    cmd2.Parameters.AddWithValue("@StateID", StateID);

                    using (SqlDataReader sqlDataReader = cmd2.ExecuteReader())
                    {
                        DataTable dataTable = new DataTable();
                        dataTable.Load(sqlDataReader);
                        model.StateId = StateID;
                        model.StateCode = (string)dataTable.Rows[0]["StateCode"];
                        model.StateName = (string)dataTable.Rows[0]["StateName"];
                        model.StateId = (int)dataTable.Rows[0]["StateID"];
                        model.SelectedCountryId = (int)dataTable.Rows[0]["CountryID"];
                    }
                }
                conn.Close();

            }
            conn.Close();
            return View(model);
        }
        public IActionResult AddEditState(StateModel state)
        {
            string str = this._configuration.GetConnectionString("myConnectionString");
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            if (state.StateId == null)
            {
                cmd.CommandText = "PR_LOC_State_Insert";
            }
            else
            {
                cmd.CommandText = "PR_LOC_State_Update";
                cmd.Parameters.AddWithValue ("@StateID", state.StateId);
            }
            cmd.Parameters.AddWithValue("@StateName", state.StateName);
            cmd.Parameters.AddWithValue("@countryID", state.SelectedCountryId);
            cmd.Parameters.AddWithValue("@StateCode", state.StateCode);
            cmd.ExecuteNonQuery();
            conn.Close();
            return RedirectToAction("StateView");
        }
    }
}
