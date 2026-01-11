import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/helper/functions/build_error_snack_bar.dart';
import 'package:fruite_app/features/check_out/presentation/manager/order_cubit/add_order_cubit.dart';

class AddOrderBlocListener extends StatelessWidget {
  const AddOrderBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddOrderCubit, AddOrderState>(
      listenWhen: (previous, current) =>
          current is AddOrderLoading ||
          current is AddOrderSuccess ||
          current is AddOrderFailure,
      listener: (context, state) {
        if (state is AddOrderLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is AddOrderSuccess) {
          Navigator.pop(context); // Close the loading dialog
          builderrorsnackbar(context, 'تم اضافة الطلب بنجاح');
        } else if (state is AddOrderFailure) {
          Navigator.pop(context); // Close the loading dialog
          builderrorsnackbar(context, state.message);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
