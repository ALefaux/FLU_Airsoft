import 'package:airsoft/shared/dimens.dart';
import 'package:flutter/material.dart';

class Snackbars {
  static SnackBar success(String message) {
    return SnackBar(
      content: Row(
        children: [
          const Icon(
            Icons.check,
            color: Colors.white,
          ),
          const SizedBox(
            width: smallMargin,
          ),
          Text(message),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
    );
  }

  static SnackBar error(String message) {
    return SnackBar(
      content: Row(
        children: [
          const Icon(
            Icons.report_problem,
            color: Colors.white,
          ),
          const SizedBox(
            width: smallMargin,
          ),
          Text(message),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
    );
  }
}
