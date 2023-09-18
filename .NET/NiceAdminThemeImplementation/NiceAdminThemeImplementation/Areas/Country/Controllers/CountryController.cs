using System.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Globalization;

using System.Data.SqlClient;
using NiceAdminThemeImplementation.Areas.Country.Models;

namespace NiceAdminThemeImplementation.Areas.Country.Controllers
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
            try
            {
                string connectionStr = this._configuration.GetConnectionString("myConnectionString");
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(connectionStr);
                conn.Open();
                SqlCommand objCmd = conn.CreateCommand();
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.CommandText = "PR_LOC_Country_SelectAll";
                SqlDataReader objDataReader = objCmd.ExecuteReader();
                dt.Load(objDataReader);
                return View(dt);
            }
            catch (Exception ex)
            {
                return View();
            }
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
        public IActionResult CountryAdd(int? id)
        {
            if (id != null)
            {
                String connectionStr = this._configuration.GetConnectionString("myConnectionString");
                DataTable dt = new DataTable();
                SqlConnection conn = new SqlConnection(connectionStr);
                conn.Open();
                SqlCommand objCmd = conn.CreateCommand();
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.CommandText = "PR_LOC_Country_SelectByCountryID";
                objCmd.Parameters.AddWithValue("@CountryID", id);
                SqlDataReader objDataReader = objCmd.ExecuteReader();
                dt.Load(objDataReader);
                conn.Close();
                CountryModel cm = new CountryModel();
                cm.Id = id;
                cm.CountryName = (string)dt.Rows[0]["CountryName"];
                cm.CountryCode = (string)dt.Rows[0]["CountryCode"];
                try
                {
                    cm.Created = (DateTime)dt.Rows[0]["Created"];
                    cm.Modified = (DateTime)dt.Rows[0]["Modified"];
                }
                catch { }
                return View(cm);
            }
            else
            {
                return View();
            }

        }
        public IActionResult AddCountry(CountryModel cm)
        {
            try
            {
                if (cm.Id == null)
                {
                    String connectionStr = this._configuration.GetConnectionString("myConnectionString");
                    SqlConnection conn = new SqlConnection(connectionStr);
                    conn.Open();
                    SqlCommand objCmd = conn.CreateCommand();
                    objCmd.CommandType = CommandType.StoredProcedure;
                    objCmd.CommandText = "PR_LOC_Country_Insert";
                    objCmd.Parameters.AddWithValue("@CountryName", cm.CountryName);
                    objCmd.Parameters.AddWithValue("@CountryCode", cm.CountryCode);
                    if (cm.Created != null) { objCmd.Parameters.AddWithValue("@Created", cm.Created); }
                    if (cm.Modified != null) { objCmd.Parameters.AddWithValue("@Modified", cm.Modified); }
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
                else
                {
                    String connectionStr = this._configuration.GetConnectionString("myConnectionString");
                    SqlConnection conn = new SqlConnection(connectionStr);
                    conn.Open();
                    SqlCommand objCmd = conn.CreateCommand();
                    objCmd.CommandType = CommandType.StoredProcedure;
                    objCmd.CommandText = "PR_LOC_Country_Update";
                    objCmd.Parameters.AddWithValue("@CountryID", cm.Id);
                    objCmd.Parameters.AddWithValue("@CountryName", cm.CountryName);
                    objCmd.Parameters.AddWithValue("@CountryCode", cm.CountryCode);
                    if (cm.Created != null) { objCmd.Parameters.AddWithValue("@Created", cm.Created); }
                    if (cm.Modified != null) { objCmd.Parameters.AddWithValue("@Modified", cm.Modified); }
                    int rowsAffected = objCmd.ExecuteNonQuery();
                    conn.Close();

                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                // You can log the exception, show an error message, or redirect to an error page
                return RedirectToAction("CountryView"); // Redirect back to the list view
            }
            return RedirectToAction("CountryView");
        }
    }
}
