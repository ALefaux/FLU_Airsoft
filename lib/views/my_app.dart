import 'package:airsoft/blocs/application/application_cubit.dart';
import 'package:airsoft/blocs/application/application_state.dart';
import 'package:airsoft/views/profile/profile_page.dart';
import 'package:airsoft/views/splashscreen/splashscreen_page.dart';
import 'package:airsoft/views/team/add/add_team_page.dart';
import 'package:airsoft/views/team/members/member_page.dart';
import 'package:airsoft/views/team/members/team_members_page.dart';
import 'package:airsoft/views/team/myteam/myteam_page.dart';
import 'package:airsoft/views/team/search/search_team.dart';
import 'package:airsoft/views/team/settings/settings_page.dart';
import 'package:airsoft/views/team/team/team_page.dart';
import 'package:airsoft/views/team/team_applies/team_applies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/home_page.dart';
import 'login/login_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState? get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<ApplicationCubit, ApplicationState>(
          listener: (context, state) {
            state.maybeWhen(
              init: () => _navigator?.pushNamedAndRemoveUntil(
                SplashscreenPage.routeName,
                (route) => false,
              ),
              appStarted: () => _navigator?.pushNamedAndRemoveUntil(
                HomePage.routeName,
                (route) => false,
              ),
              orElse: () => {},
            );
          },
          child: child,
        );
      },
      routes: {
        SplashscreenPage.routeName: ((context) => const SplashscreenPage()),
        HomePage.routeName: (context) => const HomePage(),
        TeamPage.routeName: (context) => const TeamPage(),
        MyTeamPage.routeName: (context) => const TeamPage(),
        TeamMembersPage.routeName: (context) => const TeamMembersPage(),
        MemberPage.routeName: (context) => const MemberPage(),
        TeamSettingsPage.routeName: (context) => const TeamSettingsPage(),
        TeamAppliesPage.routeName: (context) => const TeamAppliesPage(),
        SearchTeamPage.routeName: (context) => const SearchTeamPage(),
        AddTeamPage.routeName: (context) => const AddTeamPage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
        LoginPage.routeName: (context) => const LoginPage()
      },
    );
  }
}