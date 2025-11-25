import 'package:fruite_app/core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity product;
  int quantity;

  CartItemEntity({required this.product, this.quantity = 0});

  double calculateTotalPrice() {
    return product.price * quantity;
  }

  String calculateTotaluniWeight() {
    return quantity.toString();
  }

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 0) {
      quantity--;
    }
  }
}
