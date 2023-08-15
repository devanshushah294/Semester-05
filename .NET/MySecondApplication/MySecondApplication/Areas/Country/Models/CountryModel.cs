using System.ComponentModel.DataAnnotations;

namespace MySecondApplication.Areas.Country.Models
{
    public class CountryModel
    {
        public int? Id { get; set; }
        [Required]
        public string CountryName { get; set; }
        [Required]
        public string CountryCode { get; set; }
        public DateTime? Created { get; set; }
        public DateTime? Modified { get; set; }
    }
}
