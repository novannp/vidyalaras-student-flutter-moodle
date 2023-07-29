import 'package:flutter/material.dart';

showSnackbar(BuildContext context, String message, {bool? isWarning = false}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: isWarning! ? Colors.red : Colors.green,
      content: Text(message),
    ),
  );
}
