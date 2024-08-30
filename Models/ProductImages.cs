using Microsoft.AspNetCore.Mvc;
using PetShop.Data;
using System.ComponentModel.DataAnnotations;

namespace PetShop.Models
{
    public class ProductImages
    {
        [Key]
        public int ImageId { get; set; }
        public int ProductId { get; set; }
        public string ImageUrl { get; set; }
        public virtual Product Product { get; set; }
    }
}