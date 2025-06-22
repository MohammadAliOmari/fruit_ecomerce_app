import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, required this.isChecked});
  final bool isChecked;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: _isChecked ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
            width: 1.0,
          ),
        ),
        child: _isChecked
            ? const Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 16.0,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
