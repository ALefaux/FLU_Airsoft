import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String url;
  const CircleImage(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.fill
        ),
      ),
    );
  }
}
