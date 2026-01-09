import 'package:flutter/material.dart';
import 'package:fruite_app/core/helper/functions/build_error_snack_bar.dart';
import 'package:fruite_app/core/widgets/custom_button.dart';
import 'package:fruite_app/features/check_out/domain/entities/order_entity.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/check_out_page_view.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/check_out_steps.dart';
import 'package:provider/provider.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  late PageController pageController;
  int currentIndex = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 18,
          ),
          CheckOutSteps(
              currentIndex: currentIndex, pageController: pageController),
          Expanded(
            child: CheckOutPageView(
              formKey: formKey,
              pageController: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          CustomButton(
            title: getstring(currentIndex),
            onPressed: () {
              if (context.read<OrderEntity>().payWithCash != null) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                builderrorsnackbar(context, 'الرجاء اختيار طريقة الدفع');
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  String getstring(int index) {
    switch (index) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'التأكيد & الاستمرار';
      case 3:
        return ' تأكيدالطلب';
      default:
        return 'التالي';
    }
  }
}
