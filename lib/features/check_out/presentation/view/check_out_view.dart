import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/helper/functions/get_user.dart';
import 'package:fruite_app/core/repos/order_repo/order_repo.dart';
import 'package:fruite_app/core/services/get_it_service.dart';
import 'package:fruite_app/core/widgets/custom_app_bar.dart';
import 'package:fruite_app/features/cart/domain/entites/cart_entity.dart';
import 'package:fruite_app/features/check_out/domain/entities/order_entity.dart';
import 'package:fruite_app/features/check_out/domain/entities/shipping_entity.dart';
import 'package:fruite_app/features/check_out/presentation/manager/order_cubit/add_order_cubit.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/add_order_bloc_builder.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/check_out_view_body.dart';
import 'package:provider/provider.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key, required this.cartEntity});
  static const String routeName = '/check-out-view';
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(orderRepo: getIt<OrderRepo>()),
      child: Scaffold(
        appBar: customAppBar(
            context: context, title: 'الشحن', showNotification: false),
        body: SafeArea(
            child: Provider.value(
                value: OrderEntity(
                  uId: getUser().id,
                  cartEntity: cartEntity,
                  shipping: ShippingEntity(),
                ),
                child: AddOrderBlocBuilder(child: CheckOutViewBody()))),
      ),
    );
  }
}
