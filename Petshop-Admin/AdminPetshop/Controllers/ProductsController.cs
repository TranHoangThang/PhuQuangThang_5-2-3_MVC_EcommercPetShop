using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using AdminPetshop.Data;

namespace AdminPetshop.Controllers
{
    public class ProductsController : Controller
    {
        private readonly EcommerceDbContext _context;

        public ProductsController(EcommerceDbContext context)
        {
            _context = context;
        }
        [HttpGet]
        public async Task<IActionResult> SearchProducts(string query)
        {
            if (string.IsNullOrEmpty(query))
            {
                return Json(new List<Product>());
            }

            var products = await _context.Products
                .Where(p => p.Name.Contains(query) || p.Category.CategoryName.Contains(query) ||
                            p.StockQuantity.ToString().Contains(query) || p.Price.ToString().Contains(query))
                .Select(p => new
                {
                    p.ProductId,
                    p.Name,
                    p.Price,
                    p.StockQuantity,
                    p.Category.CategoryName,
                    p.ProductImages.FirstOrDefault().ImageUrl
                })
                .ToListAsync();

            return Json(products);
        }
        // GET: Products
        public async Task<IActionResult> Index()
        {
            var products = await _context.Products
            .Include(p => p.Category)
            .Include(p => p.ProductImages) // Include ProductImages
            .ToListAsync();
            return View(products);
        }

        // GET: Products/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.Category)
                .Include(p => p.ProductImages) // Include ProductImages
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // GET: Products/Create
        public IActionResult Create()
        {
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryName");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Product product, List<string> imageUrls)
        {
            if (ModelState.IsValid)
            {
                // Thêm sản phẩm
                product.CreatedAt = DateTime.Now;
                product.UpdatedAt = DateTime.Now;
                _context.Add(product);
                await _context.SaveChangesAsync();

                // Thêm hình ảnh sản phẩm
                foreach (var url in imageUrls)
                {
                    if (!string.IsNullOrEmpty(url))
                    {
                        var productImage = new ProductImage
                        {
                            ProductId = product.ProductId,
                            ImageUrl = url
                        };
                        _context.ProductImages.Add(productImage);
                    }
                }

                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            ViewData["CategoryName"] = new SelectList(_context.Categories, "CategoryId", "CategoryName", product.CategoryId);
            return View(product);
        }

        // GET: Products/Edit/5
        public async Task<IActionResult> Edit(int? id, List<string> imageUrls)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products
            .Include(p => p.ProductImages) // Bao gồm các hình ảnh liên quan đến sản phẩm
            .FirstOrDefaultAsync(p => p.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }
            ViewData["CategoryName"] = new SelectList(_context.Categories, "CategoryId", "CategoryName", product.CategoryId);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProductId,Name,Description,Price,StockQuantity,CategoryId,CreatedAt,UpdatedAt")] Product product, List<string> imageUrls)
        {
            if (id != product.ProductId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    // Cập nhật sản phẩm
                    product.UpdatedAt = DateTime.Now;
                    _context.Update(product);

                    // Cập nhật hình ảnh sản phẩm
                    var existingImages = await _context.ProductImages.Where(pi => pi.ProductId == id).ToListAsync();
                    _context.ProductImages.RemoveRange(existingImages); // Xóa các hình ảnh cũ

                    foreach (var url in imageUrls)
                    {
                        if (!string.IsNullOrEmpty(url))
                        {
                            var productImage = new ProductImage
                            {
                                ProductId = product.ProductId,
                                ImageUrl = url
                            };
                            _context.ProductImages.Add(productImage);
                        }
                    }

                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.ProductId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryName", product.CategoryId);
            return View(product);
        }

        // GET: Products/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.Category)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var product = _context.Products
                          .Include(p => p.ProductImages) // Bao gồm các ảnh liên quan
                          .FirstOrDefault(p => p.ProductId == id);

            if (product != null)
            {
                // Xóa các ảnh liên quan
                _context.ProductImages.RemoveRange(product.ProductImages);

                // Xóa sản phẩm
                _context.Products.Remove(product);

                // Lưu thay đổi
                await _context.SaveChangesAsync();
            }

            return RedirectToAction(nameof(Index));
        }

        private bool ProductExists(int id)
        {
            return _context.Products.Any(e => e.ProductId == id);
        }
    }
}
