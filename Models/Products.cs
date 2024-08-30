using PetShop.Data;
using System.ComponentModel.DataAnnotations;

namespace PetShop.Models
{
    public class Products
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public string ImageUrl { get; set; }
        public virtual Product Product { get; set; } = null!;

        public ICollection<ProductImage> ProductImages { get; set; }
        public virtual ICollection<Wishlist> Wishlists { get; set; } = new List<Wishlist>();
    }
}