using PetShop.Data;
using System.ComponentModel.DataAnnotations;

namespace PetShop.Models
{
    public class Wishlists
    {
        [Key]
        public int WishlistId { get; set; }

        public int UserId { get; set; }
        public int ProductId { get; set; }

        public DateTime? DateAdded { get; set; }
        public virtual User User { get; set; }
        public Product Product { get; set; }
        public ICollection<ProductImage> ProductImages { get; set; } = new List<ProductImage>();
    }
}
