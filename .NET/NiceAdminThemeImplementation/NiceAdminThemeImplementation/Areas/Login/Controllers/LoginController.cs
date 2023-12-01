using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using Newtonsoft.Json;
using NiceAdminThemeImplementation.Areas.Login.Models;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
namespace NiceAdminThemeImplementation.Areas.Login.Controllers
{
    [Area("Login")]
    public class LoginController : Controller
    {
        private readonly IConfiguration _config;
        public LoginController(IConfiguration configuration)
        {
            this._config = configuration;
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Login(LoginModel model)
        {
            DataTable dt = new DataTable();
            if (ModelState.IsValid)
            {
                string connStr = this._config.GetConnectionString("myConnectionString");
                SqlConnection connection = new SqlConnection(connStr);
                connection.Open();
                SqlCommand cmd = connection.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PR_MST_Student_Login";
                cmd.Parameters.AddWithValue("@UserName", model.UserName);
                cmd.Parameters.AddWithValue("@PassWord", model.PassWord);
                SqlDataReader reader = cmd.ExecuteReader();
                dt.Load(reader);
                connection.Close();
            }
            if (dt.Rows.Count > 0)
            {
                HttpContext.Session.SetString("StudentName", dt.Rows[0]["StudentName"].ToString());
                HttpContext.Session.SetString("MobileNoFather", dt.Rows[0]["StudentName"].ToString());
                HttpContext.Session.SetString("MobileNoStudent", dt.Rows[0]["StudentName"].ToString());
                HttpContext.Session.SetString("Address", dt.Rows[0]["Address"].ToString());
                HttpContext.Session.SetString("StudentName", dt.Rows[0]["StudentName"].ToString());
                HttpContext.Session.SetString("MobileNoFather", dt.Rows[0]["StudentName"].ToString());
                HttpContext.Session.SetString("MobileNoStudent", dt.Rows[0]["StudentName"].ToString());
                HttpContext.Session.SetString("Address", dt.Rows[0]["Address"].ToString());
                // HttpContext.Session.SetObject("UserDetails", dt.Rows[0]);
                return View("/Views/Home/Index.cshtml");
            }
            else { return RedirectToAction("Index", model); }

        }
    }
}
