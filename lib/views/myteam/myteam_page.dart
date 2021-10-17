import 'package:airsoft/shared/dimens.dart';
import 'package:flutter/material.dart';

class MyTeamPage extends StatefulWidget {
  const MyTeamPage({ Key? key }) : super(key: key);

  @override
  _MyTeamPageState createState() => _MyTeamPageState();
}

class _MyTeamPageState extends State<MyTeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        padding: const EdgeInsets.all(normalMargin),
      ),),
    );
  }
}