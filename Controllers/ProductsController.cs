using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using PetShop.Data;
using PetShop.Models;
using System.Security.Claims;

namespace PetShop.Controllers
{
    public class ProductsController : Controller
    {
        private readonly ProductsRepository _productRepository;
        private static List<ShoppingCart> _cart = new List<ShoppingCart>();

        public ProductsController(EcommerceDbContext context)
        {
            _productRepository = new ProductsRepository(context);
        }

        public IActionResult Index(int page = 1)
        {
            const int pageSize = 4;
            var products = _productRepository.GetAllItems();
            var totalProducts = _productRepository.GetTotalProductsCount();
            ViewBag.TotalProducts = totalProducts;

            var pageProducts = products
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            ViewData["CurrentPage"] = page;
            ViewData["TotalPages"] = (int)Math.Ceiling(totalProducts / (double)pageSize);

            return View(pageProducts);
        }

        [HttpGet]
        public JsonResult Search(string query)
        {
            if (string.IsNullOrEmpty(query))
            {
                return Json(new List<object>());
            }

            var results = _productRepository.GetAllItems()
                .Where(p => p.Name != null && p.Name.IndexOf(query, StringComparison.OrdinalIgnoreCase) >= 0)
                .Select(p => new
                {
                    p.Id,
                    p.Name,
                    p.Description,
                    p.Price,
                    p.ImageUrl
                })
                .ToList();

            return Json(results);
        }

        [HttpPost]
        public async Task<IActionResult> AddToCart(int id, int quantity)
        {
            var userId = GetCurrentUserId();

            if (userId <= 0)
            {
                return BadRequest("Invalid User ID.");
            }

            var product = _productRepository.GetAllItems().FirstOrDefault(p => p.Id == id);
            if (product == null)
            {
                return NoContent();
            }

            var existingCartItem = _productRepository.ShoppingCarts
                .FirstOrDefault(c => c.UserId == userId && c.ProductId == id);

            if (existingCartItem != null)
            {
                existingCartItem.Quantity += quantity;
                _productRepository.ShoppingCarts.Update(existingCartItem);
            }
            else
            {
                var newCartItem = new ShoppingCart
                {
                    UserId = userId,
                    ProductId = id,
                    Quantity = quantity
                };
                _productRepository.ShoppingCarts.Add(newCartItem);
            }

            _productRepository.SaveChanges();

            return NoContent();
        }

        public IActionResult CartView(int page = 1)
        {
            var userId = GetCurrentUserId();

            var shoppingCartItems = _productRepository.ShoppingCarts
                .Where(w => w.UserId == userId)
                .Include(w => w.Product)
                .ThenInclude(p => p.ProductImages)
                .ToList()
                .Select(w => new PetShop.Models.ShoppingCarts
                {
                    CartId = w.CartId,
                    UserId = w.UserId,
                    ProductId = w.ProductId,
                    OrderId = w.OrderId,
                    Quantity = w.Quantity,
                    ProductImages = w.Product?.ProductImages ?? new List<ProductImage>(),
                    Product = new PetShop.Models.Products
                    {
                        Id = w.Product.ProductId,
                        Name = w.Product.Name,
                        Price = w.Product.Price,
                        ImageUrl = w.Product.ProductImages.FirstOrDefault().ImageUrl
                    }
                }).ToList();

            var pageSize = 2;

            var pageItems = shoppingCartItems
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            ViewData["CurrentPage"] = page;
            ViewData["TotalPages"] = (int)Math.Ceiling(shoppingCartItems.Count / (double)pageSize);
            ViewBag.TotalAmount = shoppingCartItems.Sum(item => item.Product.Price * item.Quantity);

            return View(pageItems);
        }

        [HttpPost]
        public IActionResult ClearCart()
        {
            var userId = GetCurrentUserId();

            var cartItems = _productRepository.ShoppingCarts
                .Where(w => w.UserId == userId)
                .ToList();

            foreach (var item in cartItems)
            {
                _productRepository.ShoppingCarts.Remove(item);
            }

            _productRepository.SaveChanges();

            return RedirectToAction("CartView");
        }

        public IActionResult AddressInfo()
        {
            var userId = GetCurrentUserId();

            var totalAmount = _productRepository.ShoppingCarts
                .Where(item => item.UserId == userId)
                .Include(item => item.Product)
                .Sum(item => item.Product.Price * item.Quantity);

            ViewBag.TotalAmount = totalAmount.ToString("F2");

            return View();
        }

        public IActionResult Checkout(string paymentMethod, string cardNumber, string expiryDate, string cvv,
                               string visaNumber, string visaExpiryDate, string visaCvv,
                               string paypalEmail, string checkingAccountNumber, string checkingRoutingNumber)
        {
            if (string.IsNullOrEmpty(paymentMethod))
            {
                ModelState.AddModelError("", "Please select a payment method.");
                return View();
            }
            try
            {
                switch (paymentMethod)
                {
                    case "CreditCard":
                        if (string.IsNullOrEmpty(cardNumber) || string.IsNullOrEmpty(expiryDate) || string.IsNullOrEmpty(cvv))
                        {
                            ModelState.AddModelError("", "Please provide all credit card details.");
                            return View();
                        }
                        break;

                    case "Visa":
                        if (string.IsNullOrEmpty(visaNumber) || string.IsNullOrEmpty(visaExpiryDate) || string.IsNullOrEmpty(visaCvv))
                        {
                            ModelState.AddModelError("", "Please provide all Visa card details.");
                            return View();
                        }
                        break;

                    case "PayPal":
                        if (string.IsNullOrEmpty(paypalEmail))
                        {
                            ModelState.AddModelError("", "Please provide your PayPal email.");
                            return View();
                        }
                        break;

                    case "Checking":
                        if (string.IsNullOrEmpty(checkingAccountNumber) || string.IsNullOrEmpty(checkingRoutingNumber))
                        {
                            ModelState.AddModelError("", "Please provide all checking account details.");
                            return View();
                        }
                        break;

                    default:
                        ModelState.AddModelError("", "Invalid payment method selected.");
                        return View();
                }

                _cart.Clear();
                return RedirectToAction("Confirmation");
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "An error occurred while processing your payment. Please try again.");
                return View();
            }
        }

        public IActionResult Confirmation()
        {
            ClearCart();
            return View();
        }

        [HttpPost]
        [Authorize]
        public IActionResult AddToWishlist(int id)
        {
            var userId = GetCurrentUserId();

            if (userId <= 0)
            {
                return BadRequest("Invalid User ID.");
            }

            var existingItem = _productRepository.Wishlists
                                    .FirstOrDefault(w => w.ProductId == id && w.UserId == userId);

            if (existingItem != null)
            {
                return NoContent();
            }

            var wishlistItem = new Wishlist
            {
                UserId = userId,
                ProductId = id,
                DateAdded = DateTime.Now
            };

            _productRepository.Wishlists.Add(wishlistItem);
            _productRepository.SaveChanges();

            return NoContent();
        }

        [HttpPost]
        public IActionResult RemoveFromWishlist(int id)
        {
            var userId = GetCurrentUserId();

            var wishlistItem = _productRepository.Wishlists
                                        .FirstOrDefault(w => w.ProductId == id && w.UserId == userId);

            if (wishlistItem != null)
            {
                _productRepository.Wishlists.Remove(wishlistItem);
                _productRepository.SaveChanges();
            }

            return RedirectToAction("Wishlist");
        }

        public IActionResult Wishlist()
        {
            var userId = GetCurrentUserId();

            var totalItems = _productRepository.Wishlists
                             .Count(w => w.UserId == userId);

            var wishlists = _productRepository.Wishlists
                            .Where(w => w.UserId == userId)
                            .Include(w => w.Product)
                            .ThenInclude(p => p.ProductImages)
                            .ToList()
                            .Select(w => new PetShop.Models.Wishlists
                            {
                                WishlistId = w.WishlistId,
                                UserId = w.UserId,
                                ProductId = w.ProductId,
                                DateAdded = w.DateAdded,
                                Product = w.Product,
                                ProductImages = w.Product.ProductImages
                            }).ToList();

            ViewBag.TotalProducts = totalItems;

            return View(wishlists);
        }

        private int GetCurrentUserId()
        {
            var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;

            System.Diagnostics.Debug.WriteLine($"User ID Claim: {userIdClaim}");

            if (string.IsNullOrEmpty(userIdClaim))
            {
                System.Diagnostics.Debug.WriteLine("User ID Claim is null or empty.");
                return 0;
            }

            if (int.TryParse(userIdClaim, out int userId))
            {
                return userId;
            }

            System.Diagnostics.Debug.WriteLine($"Failed to parse User ID Claim: {userIdClaim}");
            return 0;
        }
    }
}