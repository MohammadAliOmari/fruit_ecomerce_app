import 'package:fruite_app/core/entities/product_entity.dart';
import 'package:fruite_app/features/cart/domain/entites/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartList;

  CartEntity({required this.cartList});

  addCartItem(CartItemEntity cartItemEntity) {
    cartList.add(cartItemEntity);
  }

  removeCarItem(CartItemEntity carItem) {
    cartList.remove(carItem);
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var cartItem in cartList) {
      totalPrice += cartItem.calculateTotalPrice();
    }
    return totalPrice;
  }

  bool ifExist(ProductEntity product) {
    for (var cartItem in cartList) {
      if (cartItem.product.code == product.code) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity product) {
    for (var cartItem in cartList) {
      if (cartItem.product.code == product.code) {
        return cartItem;
      }
    }
    return CartItemEntity(product: product, quantity: 1);
  }
}
