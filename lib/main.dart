import 'package:airsoft/di/dependency_injector.dart';
import 'package:airsoft/di/usecases_injector.dart';
import 'package:airsoft/di/viewmodels_injector.dart';
import 'package:airsoft/views/home/home_page.dart';
import 'package:airsoft/views/login/login_page.dart';
import 'package:airsoft/views/login/login_view_model.dart';
import 'package:airsoft/views/profile/profile_page.dart';
import 'package:airsoft/views/team/add/add_team_page.dart';
import 'package:airsoft/views/team/members/member_page.dart';
import 'package:airsoft/views/team/members/team_members_page.dart';
import 'package:airsoft/views/team/myteam/myteam_page.dart';
import 'package:airsoft/views/team/search/search_team.dart';
import 'package:airsoft/views/team/settings/settings_page.dart';
import 'package:airsoft/views/team/team/team_page.dart';
import 'package:airsoft/views/team/team_applies/team_applies_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ViewModelInjector.initLocator();
  UsecaseInjector.initLocator();
  DependencyInjector.initLocator();
  
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

        TeamPage.routeName: (context) => const TeamPage(),
        MyTeamPage.routeName: (context) => const MyTeamPage(),
        TeamMembersPage.routeName: (context) => const TeamMembersPage(),
        MemberPage.routeName: (context) => const MemberPage(),
        TeamSettingsPage.routeName: (context) => const TeamSettingsPage(),
        TeamAppliesPage.routeName: (context) => const TeamAppliesPage(),

        SearchTeamPage.routeName: (context) => const SearchTeamPage(),
        AddTeamPage.routeName: (context) => const AddTeamPage(),

        ProfilePage.routeName: (context) => ProfilePage(),
        LoginPage.routeName: (context) => const LoginPage()
      },
    );
  }
}
