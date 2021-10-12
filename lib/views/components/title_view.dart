import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? iconOnPressed;

  const TitleView(this.title, {this.icon, this.iconOnPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
              child: Text(
            title,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          )),
          if (icon != null)
            IconButton(
              onPressed: () {
                iconOnPressed?.call();
              },
              icon: Icon(icon),
            )
        ],
      ),
      const SizedBox(
        height: 20,
      )
    ]);
  }
}
