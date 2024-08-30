using PetShop.Data;

namespace PetShop.Models
{
    public class ShoppingCarts
    {
        public Products Product { get; set; }
        public int CartId { get; set; }
        public int UserId { get; set; }
        public int ProductId { get; set; }
        public int? OrderId { get; set; }
        public int Quantity { get; set; }
        public string ImageUrl => Product?.ImageUrl;
        public ICollection<ProductImage> ProductImages { get; set; }
    }
}
