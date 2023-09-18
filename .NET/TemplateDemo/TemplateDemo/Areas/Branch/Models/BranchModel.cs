﻿using System.ComponentModel.DataAnnotations;

namespace TemplateDemo.Areas.Branch.Models
{
    public class BranchModel
    {
        public int? Id { get; set; }
        [Required]
        public string BranchName { get; set; } = string.Empty;
        [Required]
        public string BranchCode { get; set; } = string.Empty;
        public DateTime? Created { get; set; }
        public DateTime? Modified { get; set; }
    }
}
