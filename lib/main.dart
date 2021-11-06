import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/di/usecases_injector.dart';
import 'package:airsoft/views/home/home_page.dart';
import 'package:airsoft/views/login/login_page.dart';
import 'package:airsoft/views/login/login_view_model.dart';
import 'package:airsoft/views/profile/profile_page.dart';
import 'package:airsoft/views/team/add/add_team_page.dart';
import 'package:airsoft/views/team/myteam/myteam_page.dart';
import 'package:airsoft/views/team/search/search_team.dart';
import 'package:airsoft/views/team/team/team_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjector.initLocator();
  UsecaseInjector.initLocator();
  
  runApp(
    FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text(
            'Error initilisation app',
            textDirection: TextDirection.ltr,
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        return const Text(
          'Loading',
          textDirection: TextDirection.ltr,
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  LoginViewModel loginViewModel = DependencyInjector.getLoginViewModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        MyTeamPage.routeName: (context) => const MyTeamPage(),
        TeamPage.routeName: (context) => const TeamPage(),
        SearchTeamPage.routeName: (context) => const SearchTeamPage(),
        AddTeamPage.routeName: (context) => const AddTeamPage(),
        ProfilePage.routeName: (context) => ProfilePage(),
        LoginPage.routeName: (context) => const LoginPage()
      },
    );
  }
}
