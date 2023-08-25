using System.ComponentModel.DataAnnotations;

namespace MySecondApplication.Areas.City.Models
{
    public class CityModel
    {
        [Required]
        public int CityID { get; set; }

        [Required]
        public string CityName { get; set; } = string.Empty;

        [Required]
        public string Citycode { get; set; } = string.Empty;

        [Required]
        public int StateID { get; set; }
        public string StateName { get; set; }
        public int selectedStateID { get; set; }
        public int selectedCountryID { get; set; }
        public List<StateModel> stateList { get; set; }
        public List<CountryModel> countryList { get; set; }
        public string CountryName { get; set; } = string.Empty;
    }
}
