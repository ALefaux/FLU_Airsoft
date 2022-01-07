// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Grade extends DataClass implements Insertable<Grade> {
  final String id;
  final String name;
  final int level;
  Grade({required this.id, required this.name, required this.level});
  factory Grade.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Grade(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      level: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}level'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['level'] = Variable<int>(level);
    return map;
  }

  GradesCompanion toCompanion(bool nullToAbsent) {
    return GradesCompanion(
      id: Value(id),
      name: Value(name),
      level: Value(level),
    );
  }

  factory Grade.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Grade(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      level: serializer.fromJson<int>(json['level']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'level': serializer.toJson<int>(level),
    };
  }

  Grade copyWith({String? id, String? name, int? level}) => Grade(
        id: id ?? this.id,
        name: name ?? this.name,
        level: level ?? this.level,
      );
  @override
  String toString() {
    return (StringBuffer('Grade(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, level);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Grade &&
          other.id == this.id &&
          other.name == this.name &&
          other.level == this.level);
}

class GradesCompanion extends UpdateCompanion<Grade> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> level;
  const GradesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.level = const Value.absent(),
  });
  GradesCompanion.insert({
    required String id,
    required String name,
    required int level,
  })  : id = Value(id),
        name = Value(name),
        level = Value(level);
  static Insertable<Grade> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? level,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (level != null) 'level': level,
    });
  }

  GradesCompanion copyWith(
      {Value<String>? id, Value<String>? name, Value<int>? level}) {
    return GradesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      level: level ?? this.level,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GradesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }
}

class $GradesTable extends Grades with TableInfo<$GradesTable, Grade> {
  final GeneratedDatabase _db;
  final String? _alias;
  $GradesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int?> level = GeneratedColumn<int?>(
      'level', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, level];
  @override
  String get aliasedName => _alias ?? 'grades';
  @override
  String get actualTableName => 'grades';
  @override
  VerificationContext validateIntegrity(Insertable<Grade> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Grade map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Grade.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GradesTable createAlias(String alias) {
    return $GradesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $GradesTable grades = $GradesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [grades];
}
