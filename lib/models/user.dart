import 'package:airsoft/shared/utils.dart';

class User {
  String id;
  String soldierName;
  late List<String> nameSearch;

  User({required this.id, required this.soldierName, List<String>? nameSearch}) {
    this.nameSearch = nameSearch ?? Utils.setSearchParam(soldierName);
  }

  factory User.fromJson({required Map<String, dynamic> json}) {
    return User(
      id: json[idName]! as String,
      soldierName: json[_SOLDIER_NAME]! as String,
      nameSearch: json[_NAME_SEARCH].cast<String>()
    );
  }

  Map<String, dynamic> toJson() => {
    idName: id,
    _SOLDIER_NAME: soldierName,
    _NAME_SEARCH: nameSearch
  };

  static const String idName = "id";
  static const String _SOLDIER_NAME = "soldier_name";
  static const String _NAME_SEARCH = "name_search";
}
