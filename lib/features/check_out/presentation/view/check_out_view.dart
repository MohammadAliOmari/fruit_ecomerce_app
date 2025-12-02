import 'package:flutter/material.dart';
import 'package:fruite_app/core/widgets/custom_app_bar.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/check_out_view_body.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});
  static const String routeName = '/check-out-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context, title: 'الشحن', showNotification: false),
      body: SafeArea(child: const CheckOutViewBody()),
    );
  }
}
