import 'package:airsoft/components/title_view.dart';
import 'package:airsoft/models/teams/team.dart';
import 'package:airsoft/models/users/user.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:airsoft/views/team/members/member_page.dart';
import 'package:flutter/material.dart';

class TeamMembersPage extends StatefulWidget {
  const TeamMembersPage({Key? key}) : super(key: key);

  static const routeName = "/team/my/members";

  @override
  _TeamMembersPageState createState() => _TeamMembersPageState();
}

class _TeamMembersPageState extends State<TeamMembersPage> {
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _createMemberCard(team.chief!, grade: "Chef"),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: _createGradeWidget(team.members),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _createGradeWidget(List<User> members) {
    List<Widget> components = [];

    components.addAll(members.map((e) => _createMemberCard(e)));

    return components;
  }

  GestureDetector _createMemberCard(User member, {String? grade}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MemberPage.routeName,
            arguments: member);
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(normalMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                member.soldierName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Visibility(
                child: Text(grade ?? ""),
                visible: grade != null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
