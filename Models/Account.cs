﻿using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E_project.Models
{
    [Table("Accounts")]
    public class Account
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int AccountId { get; set; }

        [DisplayName("Full Name")]
        [StringLength(250, MinimumLength = 3, ErrorMessage = "Full Name must be between 3 and 250 characters.")]
        [Required]
        public string AccountName { get; set; } = null!;

        [DisplayName("Email")]
        [DataType(DataType.EmailAddress)]
        [StringLength(250, ErrorMessage = "Email cannot exceed 250 characters.")]
        [Required]
        public string? Email { get; set; }

        [DisplayName("Password")]
        [MinLength(6, ErrorMessage = "Password must be at least 6 characters.")]
        [DataType(DataType.Password)]
        [Required]
        public string? Password { get; set; }
        [StringLength(300, ErrorMessage = "Picture URL cannot exceed 300 characters.")]
        [DisplayName("Avatar")]
        public string? Image { get; set; }
        public double Balance { get; set; } = 0;
        [DisplayName("Renewal Date")]
        public DateTime? RenewalDate { get; set; }
        [DisplayName("Creation Date")]
        public DateTime? CreationDate { get; set; } = DateTime.Now;
        public string? Role { get; set; }
        public ICollection<Transaction> Transactions { get; set; } = new List<Transaction>();
        public ICollection<Feedback> Feedbacks { get; set; } = new List<Feedback>();
    }
}
