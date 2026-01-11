import 'package:fruite_app/features/cart/domain/entites/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String imageUrl;
  final String code;
  final int quantity;
  final double price;
  OrderProductModel({
    required this.name,
    required this.imageUrl,
    required this.code,
    required this.quantity,
    required this.price,
  });
  factory OrderProductModel.fromEntity(CartItemEntity entity) {
    return OrderProductModel(
      name: entity.product.name,
      imageUrl: entity.product.imagePath!,
      code: entity.product.code,
      quantity: entity.quantity,
      price: entity.product.price,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'code': code,
      'quantity': quantity,
      'price': price,
    };
  }
}
