using System;
using System.Collections.Generic;

namespace PetShop.Data;

public partial class PaymentMethod
{
    public int PaymentId { get; set; }

    public int? UserId { get; set; }

    public string PaymentType { get; set; } = null!;

    public string Provider { get; set; } = null!;

    public string? AccountNumber { get; set; }

    public DateOnly? ExpiryDate { get; set; }

    public virtual User? User { get; set; }
}
