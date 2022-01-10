import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final Function()? onTap;

  const GridItem(
      {required this.icon, required this.title, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(title),
          ],
        ),
      ),
    );
  }
}
