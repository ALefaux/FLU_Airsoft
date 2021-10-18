import 'package:airsoft/shared/utils.dart';
import 'package:uuid/uuid.dart';

class Team {
  late String id;
  String name;
  late List<String> nameSearch;

  Team({String? id, required this.name, List<String>? nameSearch}) {
    this.id = id ?? const Uuid().v4();
    this.nameSearch = Utils.setSearchParam(name);
  }

  factory Team.fromJson({required Map<String, dynamic> json}) {
    return Team(
      id: json[_ID]! as String,
      name: json[_NAME]! as String,
      nameSearch: []
    );
  }

  Map<String, dynamic> toJson() => {
    _ID: id,
    _NAME: name,
    NAME_SEARCH: nameSearch
  };

  static const _ID = "id";
  static const _NAME = "name";
  static const NAME_SEARCH = "name_search";

}