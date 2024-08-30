using AdminPetshop.Data;

namespace AdminPetshop.Models
{
    public class OrdersViewModel
    {
        public IEnumerable<Order> Orders { get; set; }
        public decimal TotalShipped { get; set; }
        public decimal TotalDelivered { get; set; }
    }
}
