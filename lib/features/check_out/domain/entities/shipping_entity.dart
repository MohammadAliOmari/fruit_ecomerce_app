class ShippingEntity {
  String? name;
  String? address;
  String? phone;
  String? city;
  String? email;
  String? addressDetails;
  bool isDefault;

  ShippingEntity({
    this.name,
    this.address,
    this.addressDetails,
    this.city,
    this.email,
    this.phone,
    this.isDefault = false,
  });
}
