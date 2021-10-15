import 'dart:developer' as developer;

import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:airsoft/components/title_view.dart';
import 'package:airsoft/views/energyconverter/energy_converter_page.dart';
import 'package:airsoft/views/home/home_view_model.dart';
import 'package:airsoft/views/login/login_page.dart';
import 'package:airsoft/views/profile/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel homeViewModel = DependencyInjector.getHomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              TitleView(
                "Bonjour ${homeViewModel.getUserLoggedName()}!",
                icon: Icons.person,
                iconOnPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        if(homeViewModel.isUserLogged()) {
                          return ProfilePage();
                        } else {
                          return const LoginPage();
                        }
                      },
                    ),
                  );
                },
              ),
              MenuRowView(() {}, "Mon arsenal"),
              const SizedBox(
                height: 10,
              ),
              MenuRowView(() {
                // todo couldn't navigate cause of MaterialApp. Put MaterialApp to global.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EnergyConverterPage(),
                  ),
                );
              }, "Utilitaires")
            ],
          ),
        ),
      ),
    );
  }
}

class MenuRowView extends StatelessWidget {
  final Function onPresed;
  final String label;

  const MenuRowView(this.onPresed, this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: ElevatedButton(
          onPressed: () {
            developer.log("$label clicked");
            onPresed.call();
          },
          child: Row(
            children: [
              Expanded(child: Text(label)),
              const Icon(Icons.arrow_forward_ios)
            ],
          )),
    );
  }
}
