import 'dart:io';
import 'package:drift/native.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'database.g.dart';

class Grades extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get level => integer()();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@UseMoor(tables: [Grades])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Grade>> get getGrades => select(grades).get();

  Future<void> insertGrades(List<GradesCompanion> gradesToInsert) async {
    await batch((batch) {
      batch.insertAll(grades, gradesToInsert);
    });
  }

  Future<Grade> get higherGrade => (select(grades)
        ..orderBy([
          (t) => OrderingTerm(expression: t.level, mode: OrderingMode.desc)
        ])).get().then((value) {
          return value.first;
        });
}
