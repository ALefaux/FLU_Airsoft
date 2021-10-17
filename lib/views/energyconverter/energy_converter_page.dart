import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/components/title_view.dart';
import 'package:flutter/material.dart';

class EnergyConverterPage extends StatefulWidget {
  const EnergyConverterPage({Key? key}) : super(key: key);

  @override
  _EnergyConverterPageState createState() => _EnergyConverterPageState();
}

class _EnergyConverterPageState extends State<EnergyConverterPage> {
  final TextEditingController _joulesController = TextEditingController();
  final TextEditingController _poidsBilleController = TextEditingController();
  final TextEditingController _fpsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final energyConverterViewModel = DependencyInjector.getEnergyViewModel();
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              const TitleView(title: "Convertisseur d'énergie"),
              Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _joulesController,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Energie en joules'),
                        validator: (value) {
                          if (_joulesController.text.isEmpty &&
                              _fpsController.text.isEmpty) {
                            return 'Une de ces valeurs est requise';
                          } else if (_joulesController.text.isNotEmpty &&
                              _fpsController.text.isNotEmpty) {
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
                        controller: _fpsController,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Vitesse en fps'),
                        validator: (value) {
                          if (_joulesController.text.isEmpty &&
                              _fpsController.text.isEmpty) {
                            return 'Une de ces valeurs est requise';
                          } else if (_joulesController.text.isNotEmpty &&
                              _fpsController.text.isNotEmpty) {
                            return 'Une seule de ces valeurs doit être renseignée';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _poidsBilleController,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
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
                              energyConverterViewModel.convert(
                                  _joulesController.text,
                                  _poidsBilleController.text,
                                  _fpsController.text);
                            }
                          },
                          child: const Text('Calculer')),
                      const SizedBox(height: 10),
                      if (energyConverterViewModel.convertResponse.isNotEmpty)
                        Text(
                            'Résultat : ${energyConverterViewModel.convertResponse}')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
