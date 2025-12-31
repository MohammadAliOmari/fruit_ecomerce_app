import 'package:flutter/material.dart';
import 'package:fruite_app/core/widgets/custom_button.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/check_out_page_view.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/check_out_steps.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  late PageController pageController;
  int currentIndex = 0;
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
          CheckOutSteps(currentIndex: currentIndex),
          Expanded(
            child: CheckOutPageView(
              pageController: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          CustomButton(
            title: 'التالي',
            onPressed: () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
