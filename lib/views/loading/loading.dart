import 'package:airsoft/shared/dimens.dart';
import 'package:flutter/material.dart';

class AirsoftLoadingWidget {
  static Widget build({String message = "Chargement"}) {
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
