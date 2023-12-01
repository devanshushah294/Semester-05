using System.ComponentModel.DataAnnotations;

namespace NiceAdminThemeImplementation.Areas.Login.Models
{
    public class LoginModel
    {
        [Required]
        public String UserName { get; set; }

        [Required]
        public String PassWord { get; set; }
    }
}
