import 'package:airsoft/shared/utils.dart';

class User {
  String id;
  String soldierName;
  String? teamId;
  late List<String> nameSearch;

  User({required this.id, required this.soldierName, this.teamId, List<String>? nameSearch}) {
    this.nameSearch = nameSearch ?? Utils.setSearchParam(soldierName);
  }

  factory User.fromJson({required Map<String, dynamic> json}) {
    return User(
      id: json[_ID]! as String,
      soldierName: json[_SOLDIER_NAME]! as String,
      teamId: json[_TEAM_ID] as String?,
      nameSearch: json[_NAME_SEARCH].cast<String>()
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
