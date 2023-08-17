using Microsoft.AspNetCore.Mvc;
using MySecondApplication.Areas.State.Models;
using MySecondApplication.Areas.Student.Models;
using System.Data;
using System.Data.SqlClient;

namespace MySecondApplication.Areas.Student.Controllers
{
    [Area("Student")]
    public class StudentController : Controller
    {
        private readonly IConfiguration _configuration;
        public StudentController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public IActionResult StudentView()
        {
            string connectionString = this._configuration.GetConnectionString("myConnectionString");
            SqlConnection conn = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_MST_Student_SelectAll";
            SqlDataReader objDataReader = cmd.ExecuteReader();
            dt.Load(objDataReader);
            return View(dt);
        }
        public IActionResult DeleteStudent(int id)
        {
            string connectionString = this._configuration.GetConnectionString("myConnectionString");
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType=CommandType.StoredProcedure;
            cmd.CommandText = "PR_MST_Student_DeleteByStudentID";
            cmd.Parameters.AddWithValue("@StudentID", id);
            int rowsAffected = cmd.ExecuteNonQuery();

            return RedirectToAction("StudentView");
        }
        
        //public IActionResult StudentAddEdit(int? id)
        //{
        //    string connectionString = this._configuration.GetConnectionString("myConnectionString");
        //    SqlConnection conn = new SqlConnection(connectionString);
        //    DataTable dt = new DataTable();
        //    conn.Open();
        //    SqlCommand cmd = conn.CreateCommand();
        //    cmd.CommandType = CommandType.Text;
        //    cmd.CommandText = "Select CityID,CityName from LOC_City";
        //    List<City> list = new List<City>();
        //    using (SqlDataReader reader = cmd.ExecuteReader())
        //    {
        //        while (reader.Read())
        //        {
        //            City city = new City();
        //            {
        //                city.CityId = Convert.ToInt32(reader["CityID"]);
        //                city.CityName = reader["CityName"].ToString();
        //            };
        //            list.Add(city);
        //        }
        //    }
        //    conn.Close();
        //    var model = new StudentModel
        //    {
        //        Cities = list
        //    };
        //    return View(model);

        //}
    }
}
