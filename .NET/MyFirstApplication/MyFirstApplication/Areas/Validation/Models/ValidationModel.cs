using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MyFirstApplication.Areas.Validation.Models
{
    public class ValidationModel
    {
        [Required]
        public string Name { get; set; } = string.Empty;

        [Required]
        [EmailAddress]
        public string EmailAddress { get; set; } = string.Empty;
        
        [Required]
        [PasswordPropertyText]
        public string Password { get; set; } = string.Empty;
        
        [Required]
        public string PhoneNumber { get; set; } = string.Empty;
    }
}
