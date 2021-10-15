import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String soldierName;

  User({required this.id, required this.soldierName});

  factory User.fromDocumentSnapshot({required DocumentSnapshot<Map<String, dynamic>> doc}) {
    return User(
      id: doc.data()!["id"],
      soldierName: doc.data()!["soldierName"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "soldierName": soldierName
  };
}
