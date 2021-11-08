import 'package:airsoft/components/title_view.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:flutter/material.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({Key? key}) : super(key: key);

  static const routeName = "/team/my/members";

  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(normalMargin),
          child: const TitleView(
            title: "Membres",
          ),
        ),
      ),
    );
  }
}
