import 'package:airsoft/shared/dimens.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(normalMargin),
        child: Column(
          children: const [
            CircularProgressIndicator(),
            Text("Chargement"),
          ],
        ),
      ),
    );
  }
}
