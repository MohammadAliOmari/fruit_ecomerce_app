class ShippingEntity {
  String name;
  String address;
  String phone;
  String city;
  String email;
  String addressDetails;
  bool isDefault = false;

  ShippingEntity({
    required this.name,
    required this.address,
    required this.addressDetails,
    required this.city,
    required this.email,
    required this.isDefault,
    required this.phone,
  });
}
