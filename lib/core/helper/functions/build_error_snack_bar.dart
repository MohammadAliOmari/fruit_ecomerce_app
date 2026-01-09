import 'package:flutter/material.dart';

void builderrorsnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 700),
      content: Text(message),
    ),
  );
}
