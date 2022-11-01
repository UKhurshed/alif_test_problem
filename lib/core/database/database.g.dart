// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class UpcomingGuidesModelDatabaseData extends DataClass
    implements Insertable<UpcomingGuidesModelDatabaseData> {
  final int id;
  final String name;
  final String endDate;
  final String icon;
  final String urlToWeb;
  const UpcomingGuidesModelDatabaseData(
      {required this.id,
      required this.name,
      required this.endDate,
      required this.icon,
      required this.urlToWeb});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['end_date'] = Variable<String>(endDate);
    map['icon'] = Variable<String>(icon);
    map['url_to_web'] = Variable<String>(urlToWeb);
    return map;
  }

  UpcomingGuidesModelDatabaseCompanion toCompanion(bool nullToAbsent) {
    return UpcomingGuidesModelDatabaseCompanion(
      id: Value(id),
      name: Value(name),
      endDate: Value(endDate),
      icon: Value(icon),
      urlToWeb: Value(urlToWeb),
    );
  }

  factory UpcomingGuidesModelDatabaseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UpcomingGuidesModelDatabaseData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      endDate: serializer.fromJson<String>(json['endDate']),
      icon: serializer.fromJson<String>(json['icon']),
      urlToWeb: serializer.fromJson<String>(json['urlToWeb']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'endDate': serializer.toJson<String>(endDate),
      'icon': serializer.toJson<String>(icon),
      'urlToWeb': serializer.toJson<String>(urlToWeb),
    };
  }

  UpcomingGuidesModelDatabaseData copyWith(
          {int? id,
          String? name,
          String? endDate,
          String? icon,
          String? urlToWeb}) =>
      UpcomingGuidesModelDatabaseData(
        id: id ?? this.id,
        name: name ?? this.name,
        endDate: endDate ?? this.endDate,
        icon: icon ?? this.icon,
        urlToWeb: urlToWeb ?? this.urlToWeb,
      );
  @override
  String toString() {
    return (StringBuffer('UpcomingGuidesModelDatabaseData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('endDate: $endDate, ')
          ..write('icon: $icon, ')
          ..write('urlToWeb: $urlToWeb')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, endDate, icon, urlToWeb);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UpcomingGuidesModelDatabaseData &&
          other.id == this.id &&
          other.name == this.name &&
          other.endDate == this.endDate &&
          other.icon == this.icon &&
          other.urlToWeb == this.urlToWeb);
}

class UpcomingGuidesModelDatabaseCompanion
    extends UpdateCompanion<UpcomingGuidesModelDatabaseData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> endDate;
  final Value<String> icon;
  final Value<String> urlToWeb;
  const UpcomingGuidesModelDatabaseCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.endDate = const Value.absent(),
    this.icon = const Value.absent(),
    this.urlToWeb = const Value.absent(),
  });
  UpcomingGuidesModelDatabaseCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String endDate,
    required String icon,
    required String urlToWeb,
  })  : name = Value(name),
        endDate = Value(endDate),
        icon = Value(icon),
        urlToWeb = Value(urlToWeb);
  static Insertable<UpcomingGuidesModelDatabaseData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? endDate,
    Expression<String>? icon,
    Expression<String>? urlToWeb,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (endDate != null) 'end_date': endDate,
      if (icon != null) 'icon': icon,
      if (urlToWeb != null) 'url_to_web': urlToWeb,
    });
  }

  UpcomingGuidesModelDatabaseCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? endDate,
      Value<String>? icon,
      Value<String>? urlToWeb}) {
    return UpcomingGuidesModelDatabaseCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      endDate: endDate ?? this.endDate,
      icon: icon ?? this.icon,
      urlToWeb: urlToWeb ?? this.urlToWeb,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<String>(endDate.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (urlToWeb.present) {
      map['url_to_web'] = Variable<String>(urlToWeb.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UpcomingGuidesModelDatabaseCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('endDate: $endDate, ')
          ..write('icon: $icon, ')
          ..write('urlToWeb: $urlToWeb')
          ..write(')'))
        .toString();
  }
}

class $UpcomingGuidesModelDatabaseTable extends UpcomingGuidesModelDatabase
    with
        TableInfo<$UpcomingGuidesModelDatabaseTable,
            UpcomingGuidesModelDatabaseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UpcomingGuidesModelDatabaseTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _endDateMeta = const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<String> endDate = GeneratedColumn<String>(
      'end_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _urlToWebMeta = const VerificationMeta('urlToWeb');
  @override
  late final GeneratedColumn<String> urlToWeb = GeneratedColumn<String>(
      'url_to_web', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, endDate, icon, urlToWeb];
  @override
  String get aliasedName => _alias ?? 'upcoming_guides_model_database';
  @override
  String get actualTableName => 'upcoming_guides_model_database';
  @override
  VerificationContext validateIntegrity(
      Insertable<UpcomingGuidesModelDatabaseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('url_to_web')) {
      context.handle(_urlToWebMeta,
          urlToWeb.isAcceptableOrUnknown(data['url_to_web']!, _urlToWebMeta));
    } else if (isInserting) {
      context.missing(_urlToWebMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UpcomingGuidesModelDatabaseData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UpcomingGuidesModelDatabaseData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      endDate: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}end_date'])!,
      icon: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}icon'])!,
      urlToWeb: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}url_to_web'])!,
    );
  }

  @override
  $UpcomingGuidesModelDatabaseTable createAlias(String alias) {
    return $UpcomingGuidesModelDatabaseTable(attachedDatabase, alias);
  }
}

abstract class _$UpcomingGuidesDatabase extends GeneratedDatabase {
  _$UpcomingGuidesDatabase(QueryExecutor e) : super(e);
  late final $UpcomingGuidesModelDatabaseTable upcomingGuidesModelDatabase =
      $UpcomingGuidesModelDatabaseTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [upcomingGuidesModelDatabase];
}
