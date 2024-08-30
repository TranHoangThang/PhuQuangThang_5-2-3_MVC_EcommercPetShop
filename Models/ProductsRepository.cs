using Microsoft.EntityFrameworkCore;
using PetShop.Data;
using PetShop.Models;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.SqlServer;

namespace PetShop.Models
{
    public class ProductsRepository
    {
        private readonly EcommerceDbContext _context;

        public ProductsRepository(EcommerceDbContext context)
        {
            _context = context;
        }

        public List<Products> GetAllItems()
        {
            return _context.Products.Select(p => new Products
            {
                ImageUrl = p.ProductImages.FirstOrDefault() != null ? p.ProductImages.FirstOrDefault().ImageUrl : null,
                Id = p.ProductId,
                Name = p.Name,
                Description = p.Description,
                Price = p.Price,
            }).ToList();
        }

        public int GetTotalProductsCount()
        {
            return _context.Products.Count();
        }

        public DbSet<Wishlist> Wishlists => _context.Wishlists;
        public DbSet<ShoppingCart> ShoppingCarts => _context.ShoppingCarts;
        public void SaveChanges() => _context.SaveChanges();
    }
}
