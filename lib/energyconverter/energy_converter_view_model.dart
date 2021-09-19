import 'dart:math';
import 'package:flutter/material.dart';

class EnergyConverterViewModel extends ChangeNotifier {

  String convertResponse = '';

  Future<void> convert(String joules, String poidsBille, String fps) async {
    double? joulesDouble;
    double poidsBilleDouble = 0;
    double? fpsDouble;

    if(joules.isNotEmpty) {
      joulesDouble = double.tryParse(joules.replaceAll(",", "."));
    }

    if(poidsBille.isNotEmpty) {
      poidsBilleDouble = (double.tryParse(poidsBille.replaceAll(",", ".")) ?? 0) / 1000;
    } else {
      return;
    }

    if(fps.isNotEmpty) {
      fpsDouble = double.tryParse(fps);
    }

    if(joulesDouble != null) {
      final fps = sqrt(joulesDouble / 0.5 / poidsBilleDouble) / 0.3048;
      convertResponse = '${fps.round()} FPS';
    } else if (fpsDouble != null) {
      final metreSeconde = fpsDouble * 0.3048;
      final joules = 0.5 * poidsBilleDouble * metreSeconde * metreSeconde;
      convertResponse = '${(joules * 100).roundToDouble() / 100} joules';
    }

    notifyListeners();
  }

  void clearResult() {
    convertResponse = '';
    notifyListeners();
  }
}