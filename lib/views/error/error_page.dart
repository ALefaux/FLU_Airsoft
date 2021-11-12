import 'package:airsoft/shared/dimens.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String message;
  const ErrorPage({ this.message = "Une erreur est survenue", Key? key }) : super(key: key);

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
                  const Icon(Icons.sentiment_dissatisfied, size: 150,),
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