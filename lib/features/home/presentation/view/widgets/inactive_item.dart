import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.transparent, child: SvgPicture.asset(icon));
  }
}
