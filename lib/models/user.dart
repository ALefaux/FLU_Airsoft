import 'package:airsoft/shared/utils.dart';

class User {
  String id;
  String soldierName;
  String imageUrl;
  late List<String> nameSearch;

  User({required this.id, required this.soldierName, required this.imageUrl, List<String>? nameSearch}) {
    this.nameSearch = nameSearch ?? Utils.setSearchParam(soldierName);
  }

  factory User.fromJson({required Map<String, dynamic> json}) {
    return User(
      id: json[idName]! as String,
      soldierName: json[_soldierName]! as String,
      imageUrl: json[_imageUrlName]! as String,
      nameSearch: json[_nameSearch].cast<String>()
    );
  }

  Map<String, dynamic> toJson() => {
    idName: id,
    _soldierName: soldierName,
    _imageUrlName: imageUrl,
    _nameSearch: nameSearch
  };

  static const String idName = "id";
  static const String _soldierName = "soldier_name";
  static const String _imageUrlName = "image_url";
  static const String _nameSearch = "name_search";
}
