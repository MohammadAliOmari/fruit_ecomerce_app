import 'package:fruite_app/features/check_out/domain/entities/shipping_entity.dart';

class ShippingAddressModel {
  String? name;
  String? address;
  String? phone;
  String? city;
  String? email;
  String? addressDetails;
  bool isDefault;

  ShippingAddressModel({
    this.name,
    this.address,
    this.addressDetails,
    this.city,
    this.email,
    this.phone,
    this.isDefault = false,
  });
  factory ShippingAddressModel.fromEntity(ShippingEntity entity) {
    return ShippingAddressModel(
      name: entity.name,
      address: entity.address,
      addressDetails: entity.addressDetails,
      city: entity.city,
      email: entity.email,
      phone: entity.phone,
      isDefault: entity.isDefault,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'addressDetails': addressDetails,
      'city': city,
      'email': email,
      'phone': phone,
      'isDefault': isDefault,
    };
  }
}
