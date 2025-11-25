import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/entities/product_entity.dart';
import 'package:fruite_app/features/home/domain/entites/cart_entity.dart';
import 'package:fruite_app/features/home/domain/entites/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cartList: []);

  void addToCart(ProductEntity product) {
    var cartItem = cartEntity.getCartItem(product);
    if (cartEntity.ifExist(product)) {
      cartItem.incrementQuantity();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    emit(AddToCart());
  }

  void removeFromCart(CartItemEntity item) {
    cartEntity.removeCarItem(item);
    emit(RemoveFromCart());
  }
}
