import 'package:airsoft/main.dart';
import 'package:airsoft/views/energyconverter/energy_converter_view_model.dart';
import 'package:flutter/material.dart';

class EnergyConverterPage extends StatefulWidget {
  const EnergyConverterPage({Key? key}) : super(key: key);

  @override
  _EnergyConverterPageState createState() => _EnergyConverterPageState();
}

class _EnergyConverterPageState extends State<EnergyConverterPage> {
  TextEditingController joulesController = TextEditingController();
  TextEditingController poidsBilleController = TextEditingController();
  TextEditingController fpsController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final energyConverterViewModel = locator<EnergyConverterViewModel>();
    return Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                controller: joulesController,
                keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Energie en joules'),
                validator: (value) {
                  if (joulesController.text.isEmpty &&
                      fpsController.text.isEmpty) {
                    return 'Une de ces valeurs est requise';
                  } else if (joulesController.text.isNotEmpty &&
                      fpsController.text.isNotEmpty) {
                    return 'Une seule de ces valeurs doit être renseignée';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: ColoredBox(
                          color: Theme.of(context).colorScheme.primary,
                          child: const SizedBox(height: 3))),
                  const SizedBox(width: 10),
                  const Text('OU'),
                  const SizedBox(width: 10),
                  Expanded(
                      child: ColoredBox(
                          color: Theme.of(context).colorScheme.primary,
                          child: const SizedBox(height: 3)))
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: fpsController,
                keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Vitesse en fps'),
                validator: (value) {
                  if (joulesController.text.isEmpty &&
                      fpsController.text.isEmpty) {
                    return 'Une de ces valeurs est requise';
                  } else if (joulesController.text.isNotEmpty &&
                      fpsController.text.isNotEmpty) {
                    return 'Une seule de ces valeurs doit être renseignée';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: poidsBilleController,
                keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Poids de la bille'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir le poids';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    energyConverterViewModel.clearResult();
                    if (_formKey.currentState!.validate()) {
                      energyConverterViewModel.convert(joulesController.text,
                          poidsBilleController.text, fpsController.text);
                    }
                  },
                  child: const Text('Calculer')),
              const SizedBox(height: 10),
              if (energyConverterViewModel.convertResponse.isNotEmpty)
                Text('Résultat : ${energyConverterViewModel.convertResponse}')
            ],
          ),
        ));
  }
}
