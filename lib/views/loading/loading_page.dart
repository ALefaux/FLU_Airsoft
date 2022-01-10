import 'package:airsoft/shared/dimens.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  final String message;

  const LoadingPage({this.message = "Chargement", Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Card(
            child: Container(
              padding: const EdgeInsets.all(normalMargin),
              child: Column(
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: smallMargin),
                  Text(message),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
