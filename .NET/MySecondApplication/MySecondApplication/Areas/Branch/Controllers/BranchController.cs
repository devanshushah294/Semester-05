using Microsoft.AspNetCore.Mvc;
using MySecondApplication.Areas.Branch.Models;
using MySecondApplication.Areas.Country.Models;
using MySecondApplication.Models;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Metrics;
using System.Numerics;

namespace MySecondApplication.Areas.Branch.Controllers
{
    [Area("Branch")]
    public class BranchController : Controller
    {
        private readonly IConfiguration _configuration;
        public BranchController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public IActionResult BranchView()
        {
            try
            {
                string connectionStr = this._configuration.GetConnectionString("myConnectionString");

                using (SqlConnection conn = new SqlConnection(connectionStr))
                {
                    conn.Open();

                    using (SqlCommand objCmd = new SqlCommand())
                    {
                        objCmd.Connection = conn;
                        objCmd.CommandType = CommandType.StoredProcedure;
                        objCmd.CommandText = "PR_MST_Branch_SelectAll";

                        using (SqlDataReader objDataReader = objCmd.ExecuteReader())
                        {
                            DataTable dt = new DataTable();
                            dt.Load(objDataReader);

                            return View(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions here (log, display, etc.)
                // For example:
                // ViewBag.ErrorMessage = "An error occurred: " + ex.Message;
                return View();
            }
        }
        public IActionResult DeleteBranch(int id)
        {
            string connectionString = this._configuration.GetConnectionString("myConnectionString");
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand sqlCommand = conn.CreateCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "PR_MST_Branch_DeleteByBranchID";
            sqlCommand.Parameters.AddWithValue("@BranchID", id);
            int rowsAffected = sqlCommand.ExecuteNonQuery();
            conn.Close();
            return RedirectToAction("BranchView");
        }
        public IActionResult BranchAddEdit(int? id)
        {
            if (id == null)
            {
                return View();

            }
            else
            {
                string connectionString = this._configuration.GetConnectionString("myConnectionString");
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PR_MST_Branch_SelectByBranchID";
                cmd.Parameters.AddWithValue("@branchID", id);
                SqlDataReader reader = cmd.ExecuteReader();
                DataTable dataTable = new DataTable();
                dataTable.Load(reader);
                BranchModel model = new BranchModel();
                model.Id = id;
                model.BranchName = (string)dataTable.Rows[0]["BranchName"];
                model.BranchCode = (string)dataTable.Rows[0]["BranchCode"];
                model.Created = (DateTime)dataTable.Rows[0]["Created"];
                model.Modified = (DateTime)dataTable.Rows[0]["Modified"];
                return View(model);
            }

        }
        public IActionResult AddEditBranch(BranchModel bm){
            try
            {
                string connectionString = this._configuration.GetConnectionString("myConnectionString");

                using (SqlConnection conn = new SqlConnection(connectionString)){
                    conn.Open();

                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        if (bm.Id == null)
                        {
                            cmd.CommandText = "PR_MST_Branch_Insert";
                        }
                        else
                        {
                            cmd.CommandText = "PR_MST_Branch_UpdateByBranchID";
                            cmd.Parameters.AddWithValue("@BranchID", bm.Id);
                        }

                        cmd.Parameters.AddWithValue("@BranchName", bm.BranchName);
                        cmd.Parameters.AddWithValue("@BranchCode", bm.BranchCode);

                        if (bm.Created != null) { cmd.Parameters.AddWithValue("@Created", bm.Created); }
                        if (bm.Modified != null) { cmd.Parameters.AddWithValue("@Modified", bm.Modified); }

                        int rowsAffected = cmd.ExecuteNonQuery();
                    }
                    conn.Close();
                }

                return RedirectToAction("BranchView");
            }
            catch (Exception ex)
            {
                // Handle the exception, log it, and return an appropriate response.
                // For example:
                // Log.Error("An error occurred: " + ex.Message);
                // Return a view with an error message.
                return RedirectToAction("BranchView");
            }
        }






    }
}
