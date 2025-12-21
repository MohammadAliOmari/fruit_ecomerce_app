import 'package:flutter/widgets.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/address_section.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/check_out_steps.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/shiping_section.dart';

class CheckOutPageView extends StatelessWidget {
  const CheckOutPageView({
    required this.pageController,
    super.key,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: CheckOutSteps().steps().length,
        itemBuilder: (context, index) {
          return pages()[index];
        },
      ),
    );
  }

  List<Widget> pages() => [
        ShipingSection(),
        const AddressSection(),
        const SizedBox(),
        const SizedBox(),
      ];
}
