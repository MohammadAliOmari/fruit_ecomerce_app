import 'package:flutter/widgets.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/shiping_item.dart';

class ShipingSection extends StatefulWidget {
  const ShipingSection({super.key});

  @override
  State<ShipingSection> createState() => _ShipingSectionState();
}

class _ShipingSectionState extends State<ShipingSection> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        ShipingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          isSelected: selectedIndex == 1,
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price: '2',
        ),
        SizedBox(
          height: 10,
        ),
        ShipingItem(
          onTap: () {
            setState(() {
              selectedIndex = 2;
            });
          },
          isSelected: selectedIndex == 2,
          title: 'الدفع اونلاين',
          subtitle: ' يرجى تحديد طريقة الدفع',
          price: '2',
        ),
      ],
    );
  }
}
