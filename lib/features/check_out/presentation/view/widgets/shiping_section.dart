import 'package:flutter/widgets.dart';
import 'package:fruite_app/features/check_out/domain/entities/order_entity.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/shiping_item.dart';
import 'package:provider/provider.dart';

class ShipingSection extends StatefulWidget {
  const ShipingSection({super.key});

  @override
  State<ShipingSection> createState() => _ShipingSectionState();
}

class _ShipingSectionState extends State<ShipingSection>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        ShipingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
              context.read<OrderEntity>().payWithCash = true;
            });
          },
          isSelected: selectedIndex == 1,
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price:
              (context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 1)
                  .toString(),
        ),
        SizedBox(
          height: 10,
        ),
        ShipingItem(
          onTap: () {
            setState(() {
              selectedIndex = 2;
              context.read<OrderEntity>().payWithCash = false;
            });
          },
          isSelected: selectedIndex == 2,
          title: 'الدفع اونلاين',
          subtitle: ' يرجى تحديد طريقة الدفع',
          price: context
              .read<OrderEntity>()
              .cartEntity
              .calculateTotalPrice()
              .toString(),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
