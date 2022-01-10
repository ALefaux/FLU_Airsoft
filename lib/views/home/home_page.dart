import 'dart:developer' as developer;

import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:airsoft/components/title_view.dart';
import 'package:airsoft/views/home/home_view_model.dart';
import 'package:airsoft/views/login/login_destination.dart';
import 'package:airsoft/views/login/login_page.dart';
import 'package:airsoft/views/profile/profile_page.dart';
import 'package:airsoft/views/team/team_navigation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = "/";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _homeViewModel = DependencyInjector.getHomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(normalMargin),
          child: Column(
            children: [
              TitleView(
                title: "Bonjour ${_homeViewModel.getUserLoggedName()}!",
                icon: Icons.person,
                iconOnPressed: () {
                  if (_homeViewModel.isUserLogged()) {
                    Navigator.pushNamed(
                      context,
                      ProfilePage.routeName,
                    );
                  } else {
                    Navigator.pushNamed(
                      context,
                      LoginPage.routeName,
                      arguments: LoginDestination.profile
                    );
                  }
                },
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_homeViewModel.isUserLogged()) {
                          TeamNavigation.navigateToTeamPage(context);
                        } else {
                          Navigator.pushNamed(
                            context,
                            LoginPage.routeName,
                            arguments: LoginDestination.team
                          );
                        }
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.group),
                            Text("Ma team"),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Arsenal"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
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
