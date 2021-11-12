import 'package:airsoft/components/loading_view.dart';
import 'package:airsoft/components/title_view.dart';
import 'package:airsoft/di/viewmodels_injector.dart';
import 'package:airsoft/models/member.dart';
import 'package:airsoft/models/team.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:airsoft/storage/database.dart';
import 'package:airsoft/views/team/members/member_page.dart';
import 'package:airsoft/views/team/members/team_members_view_model.dart';
import 'package:flutter/material.dart';

class TeamMembersPage extends StatefulWidget {
  const TeamMembersPage({Key? key}) : super(key: key);

  static const routeName = "/team/my/members";

  @override
  _TeamMembersPageState createState() => _TeamMembersPageState();
}

class _TeamMembersPageState extends State<TeamMembersPage> {
  final TeamMembersViewModel _membersViewModel =
      ViewModelInjector.getMembersViewModel();

  @override
  Widget build(BuildContext context) {
    final Team team = ModalRoute.of(context)!.settings.arguments as Team;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(normalMargin),
          child: Column(
            children: [
              const TitleView(title: "Membres"),
              FutureBuilder<Map<Grade, List<Member>>>(
                future: _membersViewModel.getGroupedMembers(team.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: snapshot.data!.entries
                                .map((e) => _createGradeWidget(e.key, e.value))
                                .expand((element) => element)
                                .toList()));
                  } else if (snapshot.hasError) {
                    return const Text("Une erreur est survenue");
                  } else {
                    return const LoadingView();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _createGradeWidget(Grade grade, List<Member> members) {
    List<Widget> components = [];

    components.add(Text(grade.name));
    components.addAll(members.map((e) => _createMemberCard(e)));

    return components;
  }

  GestureDetector _createMemberCard(Member member) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MemberPage.routeName, arguments: member.userId);
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(normalMargin),
          child: Text(member.userName),
        ),
      ),
    );
  }
}
