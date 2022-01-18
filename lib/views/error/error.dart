import 'package:airsoft/shared/dimens.dart';
import 'package:flutter/material.dart';

class AirsoftErrorWidget {
  static Widget build({String message = "Une erreur est survenue"}) {
    return Center(
      child: Wrap(
        children: [
          Card(
            child: Container(
              padding: const EdgeInsets.all(normalMargin),
              child: Column(
                children: [
                  const Icon(
                    Icons.sentiment_dissatisfied,
                    size: 150,
                  ),
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
