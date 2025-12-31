import 'package:flutter/material.dart';

class CustomPaymentItem extends StatelessWidget {
  const CustomPaymentItem({
    super.key,
    required this.image,
    required this.color,
  });
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 67,
      height: 43,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(image),
        ),
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: const Color(0xFFD6DCE5),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x14B7B7B7),
            blurRadius: 20,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x14B7B7B7),
            blurRadius: 40,
            offset: Offset(0, 20),
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(),
    );
  }
}
