import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/entities/product_entity.dart';
import 'package:fruite_app/features/cart/domain/entites/cart_entity.dart';
import 'package:fruite_app/features/cart/domain/entites/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cartList: []);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressDetailsController =
      TextEditingController();
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
    log('we remove a widget here ${item.product.name}');
    cartEntity.removeCarItem(item);
    emit(RemoveFromCart(item: item));
  }
}
