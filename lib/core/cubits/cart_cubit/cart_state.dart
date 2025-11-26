part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class AddToCart extends CartState {}

final class RemoveFromCart extends CartState {}
