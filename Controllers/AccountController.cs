using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PetShop.Data;
using PetShop.Models;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

public class AccountController : Controller
{
    private readonly EcommerceDbContext _context;

    public AccountController(EcommerceDbContext context)
    {
        _context = context;
    }

    [HttpPost]
    public async Task<IActionResult> Login(string username, string password)
    {
        var user = _context.Users
            .FirstOrDefault(u => u.Username == username && u.Password == password);

        if (user != null)
        {
            var claims = new List<Claim>
        {
            new Claim(ClaimTypes.NameIdentifier, user.UserId.ToString()),
            new Claim(ClaimTypes.Name, user.Username)
        };

            var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));

            var principal = (ClaimsPrincipal)HttpContext.User;
            var userIdClaim = principal.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            System.Diagnostics.Debug.WriteLine($"Logged in User ID: {userIdClaim}");

            return RedirectToAction("Index", "Home");
        }

        ViewBag.Error = "Invalid login attempt.";
        return View();
    }

    [HttpGet]
    public IActionResult Register()
    {
        return View();
    }

    [HttpPost]
    public IActionResult SignUp(string username, string fullName, string email, string phoneNumber, string password, string repeatPassword)
    {
        if (password != repeatPassword)
        {
            ViewBag.Error = "Passwords do not match.";
            return View();
        }

        var existingUser = _context.Users
            .FirstOrDefault(u => u.Username == username);

        if (existingUser != null)
        {
            ViewBag.Error = "Username already exists.";
            return View();
        }

        var newUser = new User
        {
            Username = username,
            FullName = fullName,
            Email = email,
            PhoneNumber = phoneNumber,
            Password = password 
        };

        _context.Users.Add(newUser);
        _context.SaveChanges();

        return RedirectToAction("Index", "Home");
    }

    public async Task<IActionResult> Logout()
    {
        await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
        return RedirectToAction("Index", "Home");
    }
}
