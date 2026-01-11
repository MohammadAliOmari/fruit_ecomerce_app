import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/features/check_out/presentation/manager/order_cubit/add_order_cubit.dart';

class AddOrderBlocBuilder extends StatelessWidget {
  const AddOrderBlocBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddOrderCubit, AddOrderState>(
      builder: (context, state) {
        return child;
      },
    );
  }
}
