import 'package:fruite_app/features/cart/domain/entites/cart_entity.dart';
import 'package:fruite_app/features/check_out/domain/entities/shipping_entity.dart';

class OrderEntity {
  final String uId;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingEntity shipping;
  OrderEntity({
    required this.uId,
    required this.cartEntity,
    this.payWithCash,
    required this.shipping,
  });
}
