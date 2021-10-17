import 'package:airsoft/shared/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Team {
  late String id;
  String name;
  late List<String> nameSearch;

  Team({String? id, required this.name, List<String>? nameSearch}) {
    this.id = id ?? const Uuid().v4();
    this.nameSearch = Utils.setSearchParam(name);
  }

  factory Team.fromDocumentSnapshot({required DocumentSnapshot<Map<String, dynamic>> doc}) {
    return Team(
      id: doc.data()![_ID],
      name: doc.data()![NAME],
      nameSearch: doc.data()![_NAME_SEARCH]
    );
  }

  Map<String, dynamic> toJson() => {
    _ID: id,
    NAME: name,
    _NAME_SEARCH: nameSearch
  };

  static const _ID = "id";
  static const NAME = "name";
  static const _NAME_SEARCH = "name_search";

}