import 'package:airsoft/shared/dimens.dart';
import 'package:flutter/material.dart';

class FullSizeButton extends StatelessWidget {
  final Function onPresed;
  final String label;
  final Color? backgroundColor;

  const FullSizeButton(this.onPresed, this.label, {this.backgroundColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: backgroundColor ?? Theme.of(context).colorScheme.primary
        ),
        onPressed: () {
          onPresed.call();
        },
        child: Text(label),
      ),
    );
  }
}
