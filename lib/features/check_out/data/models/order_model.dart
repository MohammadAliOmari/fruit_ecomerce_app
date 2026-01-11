import 'package:fruite_app/features/check_out/data/models/order_product_model.dart';
import 'package:fruite_app/features/check_out/data/models/shipping_address_model.dart';
import 'package:fruite_app/features/check_out/domain/entities/order_entity.dart';

class OrderModel {
  final String uId;
  final double totalPrice;
  final ShippingAddressModel shippingAddressModel;
  List<OrderProductModel> orderProductModel;
  final String paymentMethod;
  OrderModel({
    required this.uId,
    required this.totalPrice,
    required this.shippingAddressModel,
    required this.orderProductModel,
    required this.paymentMethod,
  });
  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      uId: entity.uId,
      totalPrice: entity.cartEntity.calculateTotalPrice(),
      shippingAddressModel: ShippingAddressModel.fromEntity(entity.shipping),
      orderProductModel: List<OrderProductModel>.from(entity.cartEntity.cartList
          .map((x) => OrderProductModel.fromEntity(x))),
      paymentMethod: entity.payWithCash! ? 'Cash' : 'Card',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'totalPrice': totalPrice,
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProductModel': orderProductModel.map((x) => x.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
