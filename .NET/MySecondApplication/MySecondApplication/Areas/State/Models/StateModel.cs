using System.ComponentModel.DataAnnotations;

namespace MySecondApplication.Areas.State.Models
{
    public class StateModel
    {
        public int? StateId { get; set; }

        [Required]
        public string StateName { get; set; }

        [Required]
        public string StateCode { get; set; }

        [Required(ErrorMessage = "Select the country")]
        public int SelectedCountryId { get; set; }
        public List<CountryModel> Countries { get; set; }
    }

    
}
