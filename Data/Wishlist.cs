using System;

namespace PetShop.Data
{
    public partial class Wishlist
    {
        public int WishlistId { get; set; }

        public int UserId { get; set; }

        public int ProductId { get; set; }

        public DateTime DateAdded { get; set; }

        public virtual User User { get; set; } = null!;

        public virtual Product Product { get; set; } = null!;
        public ICollection<ProductImage>? ProductImages { get; set; } = new List<ProductImage>();
    }
}
