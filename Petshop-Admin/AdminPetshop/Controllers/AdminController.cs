using Microsoft.AspNetCore.Mvc;

namespace AdminPetshop.Controllers
{
    public class AdminController : Controller
    {
        public IActionResult Dashboard()
        {
            return View();
        }
    }
}
