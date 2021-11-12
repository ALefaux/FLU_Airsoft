import 'package:airsoft/components/full_size_button.dart';
import 'package:airsoft/di/viewmodels_injector.dart';
import 'package:airsoft/models/member_detail.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:airsoft/views/error/error_page.dart';
import 'package:airsoft/views/loading/loading_page.dart';
import 'package:airsoft/views/team/members/team_members_view_model.dart';
import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({Key? key}) : super(key: key);

  static const String routeName = "MemberPage";

  @override
  MemberPageState createState() => MemberPageState();
}

class MemberPageState extends State<MemberPage> {
  final TeamMembersViewModel _membersViewModel =
      ViewModelInjector.getMembersViewModel();

  @override
  Widget build(BuildContext context) {
    final String userId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(normalMargin),
          child: FutureBuilder<MemberDetail>(
            future: _membersViewModel.getMemberDetail(userId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final MemberDetail memberDetail = snapshot.data!;
                return Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(memberDetail.user.imageUrl),
                        radius: 70,
                      ),
                      const SizedBox(height: normalMargin),
                      Text(
                        memberDetail.user.soldierName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(memberDetail.grade.name),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: memberDetail.currentUserIsChief,
                            child: TextButton(
                              child: const Text("Promouvoir"),
                              onPressed: () {},
                            ),
                          ),
                          Visibility(
                            visible: memberDetail.currentUserIsChief,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text("Rétrograder"),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.mail),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Son arsenal"),
                      ),
                      const Expanded(child: SizedBox()),
                      Visibility(
                        visible: memberDetail.currentUserIsChief,
                        child: FullSizeButton(
                          onPresed: () {},
                          label: "Expulser",
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return const ErrorPage();
              } else {
                return const LoadingPage(
                  message: "Chargement des données du soldat.",
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
