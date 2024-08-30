using System;
using System.Collections.Generic;

namespace PetShop.Data;

public partial class ShippingDetail
{
    public int ShippingId { get; set; }

    public int? OrderId { get; set; }

    public string ShippingAddress { get; set; } = null!;

    public string? City { get; set; }

    public string? State { get; set; }

    public string? PostalCode { get; set; }

    public string? Country { get; set; }

    public DateTime? ShippingDate { get; set; }

    public DateTime? DeliveryDate { get; set; }

    public virtual Order? Order { get; set; }
}
