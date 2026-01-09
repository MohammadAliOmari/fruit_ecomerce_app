import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/features/cart/domain/entites/cart_item_entity.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  void updateCartItem(CartItemEntity cartItem) {
    emit(CartItemUpdated(cartItem: cartItem));
  }

  void removeFromCart(CartItemEntity item) {
    emit(CartItemUpdated(cartItem: item));
  }
}
