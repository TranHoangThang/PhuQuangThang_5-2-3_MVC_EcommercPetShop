using System;
using System.Collections.Generic;

namespace PetShop.Data
{
    public partial class ShoppingCart
    {
        public int CartId { get; set; }

        public int UserId { get; set; }

        public int ProductId { get; set; }

        public int Quantity { get; set; }

        public int? OrderId { get; set; }

        public virtual Order? Order { get; set; }

        public virtual Product Product { get; set; } = null!;

        public virtual User? User { get; set; }
    }
}
