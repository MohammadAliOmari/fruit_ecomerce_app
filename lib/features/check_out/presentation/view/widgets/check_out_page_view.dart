import 'package:flutter/widgets.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/address_section.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/check_out_steps.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/confirmation_section.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/payment_section.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/shiping_section.dart';

class CheckOutPageView extends StatelessWidget {
  const CheckOutPageView({
    super.key,
    required this.pageController,
    this.onPageChanged,
    required this.formKey,
    required this.autovalidateMode,
  });
  final PageController pageController;
  final ValueChanged<int>? onPageChanged;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: steps().length,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return pages()[index];
        },
      ),
    );
  }

  List<Widget> pages() => [
        ShipingSection(),
        AddressSection(formKey: formKey, autovalidateMode: autovalidateMode),
        const PaymentSection(),
        ConfirmationSection(pageController: pageController),
      ];
}
