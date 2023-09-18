﻿using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using TemplateDemo.Areas.City.Models;
using NuGet.Protocol;
using System.Drawing.Imaging;
using System.Security.Cryptography.X509Certificates;

namespace TemplateDemo.Areas.City.Controllers
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
            return RedirectToAction("CityView");
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
            if (CityID != null)
            {
                city.CityID = CityID;
                conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "PR_LOC_City_Select_By_PrimaryKey";
                command.Parameters.AddWithValue("@CityID", CityID);
                SqlDataReader reader = command.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                city.CityID = CityID;
                city.CityName = (string)dt.Rows[0]["CityName"];
                city.selectedStateID = (int)dt.Rows[0]["StateID"];
                city.selectedCountryID = (int)dt.Rows[0]["CountryID"];
                city.Citycode = (string)dt.Rows[0]["Citycode"];
                conn.Close();

            }
            return View(city);
        }
        //[HttpPost]
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
        public IActionResult Save(CityModel cm)
        {
            string connStr = this._configuration.GetConnectionString("myConnectionString");
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            if (cm.CityID == null)
            {
                cmd.CommandText = "PR_LOC_City_Insert";
            }
            else
            {
                cmd.CommandText = "PR_LOC_City_Update";
                cmd.Parameters.AddWithValue("@CityID", cm.CityID);
            }
            cmd.Parameters.AddWithValue("@CityName", cm.CityName);
            cmd.Parameters.AddWithValue("@CityCode", cm.Citycode);
            cmd.Parameters.AddWithValue("@StateID", cm.selectedStateID);
            cmd.Parameters.AddWithValue("@CountryID", cm.selectedCountryID);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            return RedirectToAction("CityView");
        }
        public IActionResult Filter(string countryName, string stateName, string cityName, string cityCode)
        {
            string str = this._configuration.GetConnectionString("myConnectionString");
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_LOC_CITY_Filter_CountryName_StateName_CityName_CityCode";
            cmd.Parameters.AddWithValue("@CityName", cityName);
            cmd.Parameters.AddWithValue("@StateName", stateName);
            cmd.Parameters.AddWithValue("@CityCode", cityCode);
            cmd.Parameters.AddWithValue("@CountryName", countryName);

            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dataTable = new DataTable();
            dataTable.Load(dr);
            conn.Close();
            return View("CityView", dataTable);
        }

    }
}
