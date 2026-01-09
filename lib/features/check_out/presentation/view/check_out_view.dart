import 'package:flutter/material.dart';
import 'package:fruite_app/core/widgets/custom_app_bar.dart';
import 'package:fruite_app/features/cart/domain/entites/cart_entity.dart';
import 'package:fruite_app/features/check_out/domain/entities/order_entity.dart';
import 'package:fruite_app/features/check_out/domain/entities/shipping_entity.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/check_out_view_body.dart';
import 'package:provider/provider.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key, required this.cartEntity});
  static const String routeName = '/check-out-view';
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context, title: 'الشحن', showNotification: false),
      body: SafeArea(
          child: Provider.value(
              value: OrderEntity(
                cartEntity: cartEntity,
                shipping: ShippingEntity(
                  name: '',
                  address: '',
                  addressDetails: '',
                  city: '',
                  email: '',
                  isDefault: false,
                  phone: '',
                ),
              ),
              child: CheckOutViewBody())),
    );
  }
}
