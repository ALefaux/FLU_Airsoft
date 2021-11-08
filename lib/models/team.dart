import 'package:airsoft/shared/utils.dart';
import 'package:uuid/uuid.dart';

class Team {
  late String id;
  String name;
  bool acceptApplies;
  late List<String> nameSearch;

  Team({String? id, required this.name, this.acceptApplies = true, List<String>? nameSearch}) {
    this.id = id ?? const Uuid().v4();
    this.nameSearch = Utils.setSearchParam(name);
  }

  factory Team.fromJson({required Map<String, dynamic> json}) {
    return Team(
      id: json[_idName]! as String,
      name: json[_nameName]! as String,
      acceptApplies: (json[_acceptAppliesName] as bool?) ?? true,
      nameSearch: json[nameSearchName].cast<String>()
    );
  }

  Map<String, dynamic> toJson() => {
    _idName: id,
    _nameName: name,
    _acceptAppliesName: acceptApplies,
    nameSearchName: nameSearch
  };

  static const _idName = "id";
  static const _nameName = "name";
  static const _acceptAppliesName = "accept_applies";
  static const nameSearchName = "name_search";

}