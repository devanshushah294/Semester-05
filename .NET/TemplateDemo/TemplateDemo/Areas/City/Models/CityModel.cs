using System.ComponentModel.DataAnnotations;

namespace TemplateDemo.Areas.City.Models
{
    public class CityModel
    {
        public int? CityID { get; set; } = null;

        [Required]
        public string CityName { get; set; } = string.Empty;

        [Required]
        public string Citycode { get; set; } = string.Empty;

        public string StateName { get; set; } = string.Empty;
        public string CountryName { get; set; } = string.Empty;
        public int selectedStateID { get; set; }
        public int selectedCountryID { get; set; }
        public List<StateModel> stateList { get; set; }
        public List<CountryModel> countryList { get; set; }

    }
}
