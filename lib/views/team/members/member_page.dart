import 'package:airsoft/components/full_size_button.dart';
import 'package:airsoft/models/users/user.dart';
import 'package:airsoft/shared/dimens.dart';
import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({Key? key}) : super(key: key);

  static const String routeName = "MemberPage";

  @override
  MemberPageState createState() => MemberPageState();
}

class MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(normalMargin),
          child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(user.imageUrl),
                        radius: 70,
                      ),
                      const SizedBox(height: normalMargin),
                      Text(
                        user.soldierName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: user.team?.chief?.id == user.id,
                            child: TextButton(
                              child: const Text("Promouvoir"),
                              onPressed: () {},
                            ),
                          ),
                          Visibility(
                            visible: user.team?.chief?.id == user.id,
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
                        visible: user.team?.chief?.id == user.id,
                        child: FullSizeButton(
                          onPresed: () {},
                          label: "Expulser",
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
