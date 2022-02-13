import 'dart:developer' as developer;
import 'package:airsoft/blocs/application/application_cubit.dart';
import 'package:airsoft/blocs/application/application_state.dart';
import 'package:airsoft/models/users/user.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:airsoft/components/title_view.dart';
import 'package:airsoft/views/error/error.dart';
import 'package:airsoft/views/loading/loading.dart';
import 'package:airsoft/views/login/login_destination.dart';
import 'package:airsoft/views/login/login_page.dart';
import 'package:airsoft/views/profile/profile_page.dart';
import 'package:airsoft/views/team/team_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<ApplicationCubit>()..getUser(),
      child: BlocBuilder<ApplicationCubit, ApplicationState>(
          builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.all(normalMargin),
              child: state.maybeWhen(
                userLoaded: (User? user) => _buildHomeView(context, user),
                loading: () {
                  return AirsoftLoadingWidget.build();
                },
                orElse: () {
                  return AirsoftErrorWidget.build();
                },
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildHomeView(BuildContext context, User? user) {
    return Column(
      children: [
        TitleView(
          title: "Bonjour ${user?.soldierName ?? ""}!",
          icon: Icons.person,
          iconOnPressed: () {
            if (context.read<ApplicationCubit>().isUserLogged()) {
              Navigator.pushNamed(
                context,
                ProfilePage.routeName,
              ).then((value) {
                setState(() {});
              });
            } else {
              Navigator.pushNamed(context, LoginPage.routeName,
                      arguments: LoginDestination.profile);
            }
          },
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              GestureDetector(
                onTap: () {
                  if (user != null) {
                    TeamNavigation.navigateToTeamPage(context, user);
                  } else {
                    Navigator.pushNamed(context, LoginPage.routeName,
                        arguments: LoginDestination.team);
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
