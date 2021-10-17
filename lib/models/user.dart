import 'package:airsoft/shared/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String soldierName;
  String? teamId;
  late List<String> nameSearch;

  User({required this.id, required this.soldierName, this.teamId, String? nameSearch}) {
    this.nameSearch = nameSearch ?? Utils.setSearchParam(soldierName);
  }

  factory User.fromDocumentSnapshot({required DocumentSnapshot<Map<String, dynamic>> doc}) {
    return User(
      id: doc.data()![_ID],
      soldierName: doc.data()![_SOLDIER_NAME],
      teamId: doc.data()![_TEAM_ID],
      nameSearch: doc.data()![_NAME_SEARCH]
    );
  }

  Map<String, dynamic> toJson() => {
    _ID: id,
    _SOLDIER_NAME: soldierName,
    _TEAM_ID: teamId,
    _NAME_SEARCH: nameSearch
  };

  static const String _ID = "id";
  static const String _SOLDIER_NAME = "soldier_name";
  static const String _NAME_SEARCH = "name_search";
  static const String _TEAM_ID = "team_id";
}
