import 'package:airsoft/models/grade.dart' as g;
import 'package:airsoft/storage/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moor/moor.dart';

class GradeRepository {
  final CollectionReference _reference = FirebaseFirestore.instance
      .collection(g.Grade.tableName)
      .withConverter<g.Grade>(
        fromFirestore: (snapshot, _) =>
            g.Grade.fromJson(json: snapshot.data()!),
        toFirestore: (grade, _) => grade.toJson(),
      );
  final AppDatabase database = AppDatabase();

  GradeRepository() {
    loadGrades();
  }

  void loadGrades() async {
    final localGrades = await database.getGrades;

    if (localGrades.isEmpty) {
      final snapshot = await _reference.get();
      final List<GradesCompanion> grades = snapshot.docs.map((e) {
        final g.Grade grade = e.data() as g.Grade;
        grade.setId(e.id);
        return GradesCompanion(
          id: Value(e.id),
          name: Value(grade.name),
          level: Value(grade.level),
        );
      }).toList();

      database.insertGrades(grades);
    }
  }

  Future<g.Grade> getHigherGrade() async {
    final databaseGrade = await database.higherGrade;

    final grade = g.Grade(name: databaseGrade.name, level: databaseGrade.level);
    grade.id = databaseGrade.id;

    return grade;
  }

  Future<Grade> getGradeByLevel(int level) async {
    return await database.getGradeByLevel(level);
  }
}
