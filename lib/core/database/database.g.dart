// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class TopHeadlinesDatabaseData extends DataClass
    implements Insertable<TopHeadlinesDatabaseData> {
  final int id;
  final String page;
  const TopHeadlinesDatabaseData({required this.id, required this.page});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['page'] = Variable<String>(page);
    return map;
  }

  TopHeadlinesDatabaseCompanion toCompanion(bool nullToAbsent) {
    return TopHeadlinesDatabaseCompanion(
      id: Value(id),
      page: Value(page),
    );
  }

  factory TopHeadlinesDatabaseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TopHeadlinesDatabaseData(
      id: serializer.fromJson<int>(json['id']),
      page: serializer.fromJson<String>(json['page']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'page': serializer.toJson<String>(page),
    };
  }

  TopHeadlinesDatabaseData copyWith({int? id, String? page}) =>
      TopHeadlinesDatabaseData(
        id: id ?? this.id,
        page: page ?? this.page,
      );
  @override
  String toString() {
    return (StringBuffer('TopHeadlinesDatabaseData(')
          ..write('id: $id, ')
          ..write('page: $page')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, page);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TopHeadlinesDatabaseData &&
          other.id == this.id &&
          other.page == this.page);
}

class TopHeadlinesDatabaseCompanion
    extends UpdateCompanion<TopHeadlinesDatabaseData> {
  final Value<int> id;
  final Value<String> page;
  const TopHeadlinesDatabaseCompanion({
    this.id = const Value.absent(),
    this.page = const Value.absent(),
  });
  TopHeadlinesDatabaseCompanion.insert({
    this.id = const Value.absent(),
    required String page,
  }) : page = Value(page);
  static Insertable<TopHeadlinesDatabaseData> custom({
    Expression<int>? id,
    Expression<String>? page,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (page != null) 'page': page,
    });
  }

  TopHeadlinesDatabaseCompanion copyWith(
      {Value<int>? id, Value<String>? page}) {
    return TopHeadlinesDatabaseCompanion(
      id: id ?? this.id,
      page: page ?? this.page,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (page.present) {
      map['page'] = Variable<String>(page.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopHeadlinesDatabaseCompanion(')
          ..write('id: $id, ')
          ..write('page: $page')
          ..write(')'))
        .toString();
  }
}

class $TopHeadlinesDatabaseTable extends TopHeadlinesDatabase
    with TableInfo<$TopHeadlinesDatabaseTable, TopHeadlinesDatabaseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TopHeadlinesDatabaseTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _pageMeta = const VerificationMeta('page');
  @override
  late final GeneratedColumn<String> page = GeneratedColumn<String>(
      'page', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  @override
  List<GeneratedColumn> get $columns => [id, page];
  @override
  String get aliasedName => _alias ?? 'top_headlines_database';
  @override
  String get actualTableName => 'top_headlines_database';
  @override
  VerificationContext validateIntegrity(
      Insertable<TopHeadlinesDatabaseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('page')) {
      context.handle(
          _pageMeta, page.isAcceptableOrUnknown(data['page']!, _pageMeta));
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TopHeadlinesDatabaseData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TopHeadlinesDatabaseData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      page: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}page'])!,
    );
  }

  @override
  $TopHeadlinesDatabaseTable createAlias(String alias) {
    return $TopHeadlinesDatabaseTable(attachedDatabase, alias);
  }
}

class ArticleDatabaseData extends DataClass
    implements Insertable<ArticleDatabaseData> {
  final int id;
  final String page;
  final String title;
  final String description;
  final String urlToImage;
  final String urlToWeb;
  const ArticleDatabaseData(
      {required this.id,
      required this.page,
      required this.title,
      required this.description,
      required this.urlToImage,
      required this.urlToWeb});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['page'] = Variable<String>(page);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['url_to_image'] = Variable<String>(urlToImage);
    map['url_to_web'] = Variable<String>(urlToWeb);
    return map;
  }

  ArticleDatabaseCompanion toCompanion(bool nullToAbsent) {
    return ArticleDatabaseCompanion(
      id: Value(id),
      page: Value(page),
      title: Value(title),
      description: Value(description),
      urlToImage: Value(urlToImage),
      urlToWeb: Value(urlToWeb),
    );
  }

  factory ArticleDatabaseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArticleDatabaseData(
      id: serializer.fromJson<int>(json['id']),
      page: serializer.fromJson<String>(json['page']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      urlToImage: serializer.fromJson<String>(json['urlToImage']),
      urlToWeb: serializer.fromJson<String>(json['urlToWeb']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'page': serializer.toJson<String>(page),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'urlToImage': serializer.toJson<String>(urlToImage),
      'urlToWeb': serializer.toJson<String>(urlToWeb),
    };
  }

  ArticleDatabaseData copyWith(
          {int? id,
          String? page,
          String? title,
          String? description,
          String? urlToImage,
          String? urlToWeb}) =>
      ArticleDatabaseData(
        id: id ?? this.id,
        page: page ?? this.page,
        title: title ?? this.title,
        description: description ?? this.description,
        urlToImage: urlToImage ?? this.urlToImage,
        urlToWeb: urlToWeb ?? this.urlToWeb,
      );
  @override
  String toString() {
    return (StringBuffer('ArticleDatabaseData(')
          ..write('id: $id, ')
          ..write('page: $page, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('urlToWeb: $urlToWeb')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, page, title, description, urlToImage, urlToWeb);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticleDatabaseData &&
          other.id == this.id &&
          other.page == this.page &&
          other.title == this.title &&
          other.description == this.description &&
          other.urlToImage == this.urlToImage &&
          other.urlToWeb == this.urlToWeb);
}

class ArticleDatabaseCompanion extends UpdateCompanion<ArticleDatabaseData> {
  final Value<int> id;
  final Value<String> page;
  final Value<String> title;
  final Value<String> description;
  final Value<String> urlToImage;
  final Value<String> urlToWeb;
  const ArticleDatabaseCompanion({
    this.id = const Value.absent(),
    this.page = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.urlToWeb = const Value.absent(),
  });
  ArticleDatabaseCompanion.insert({
    this.id = const Value.absent(),
    required String page,
    required String title,
    required String description,
    required String urlToImage,
    required String urlToWeb,
  })  : page = Value(page),
        title = Value(title),
        description = Value(description),
        urlToImage = Value(urlToImage),
        urlToWeb = Value(urlToWeb);
  static Insertable<ArticleDatabaseData> custom({
    Expression<int>? id,
    Expression<String>? page,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? urlToImage,
    Expression<String>? urlToWeb,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (page != null) 'page': page,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (urlToImage != null) 'url_to_image': urlToImage,
      if (urlToWeb != null) 'url_to_web': urlToWeb,
    });
  }

  ArticleDatabaseCompanion copyWith(
      {Value<int>? id,
      Value<String>? page,
      Value<String>? title,
      Value<String>? description,
      Value<String>? urlToImage,
      Value<String>? urlToWeb}) {
    return ArticleDatabaseCompanion(
      id: id ?? this.id,
      page: page ?? this.page,
      title: title ?? this.title,
      description: description ?? this.description,
      urlToImage: urlToImage ?? this.urlToImage,
      urlToWeb: urlToWeb ?? this.urlToWeb,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (page.present) {
      map['page'] = Variable<String>(page.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    if (urlToWeb.present) {
      map['url_to_web'] = Variable<String>(urlToWeb.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticleDatabaseCompanion(')
          ..write('id: $id, ')
          ..write('page: $page, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('urlToWeb: $urlToWeb')
          ..write(')'))
        .toString();
  }
}

class $ArticleDatabaseTable extends ArticleDatabase
    with TableInfo<$ArticleDatabaseTable, ArticleDatabaseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticleDatabaseTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _pageMeta = const VerificationMeta('page');
  @override
  late final GeneratedColumn<String> page = GeneratedColumn<String>(
      'page', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          'REFERENCES "top_headlines_database" ("page") ON DELETE CASCADE');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _urlToImageMeta = const VerificationMeta('urlToImage');
  @override
  late final GeneratedColumn<String> urlToImage = GeneratedColumn<String>(
      'url_to_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _urlToWebMeta = const VerificationMeta('urlToWeb');
  @override
  late final GeneratedColumn<String> urlToWeb = GeneratedColumn<String>(
      'url_to_web', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, page, title, description, urlToImage, urlToWeb];
  @override
  String get aliasedName => _alias ?? 'article_database';
  @override
  String get actualTableName => 'article_database';
  @override
  VerificationContext validateIntegrity(
      Insertable<ArticleDatabaseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('page')) {
      context.handle(
          _pageMeta, page.isAcceptableOrUnknown(data['page']!, _pageMeta));
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
          _urlToImageMeta,
          urlToImage.isAcceptableOrUnknown(
              data['url_to_image']!, _urlToImageMeta));
    } else if (isInserting) {
      context.missing(_urlToImageMeta);
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
  ArticleDatabaseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArticleDatabaseData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      page: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}page'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      urlToImage: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}url_to_image'])!,
      urlToWeb: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}url_to_web'])!,
    );
  }

  @override
  $ArticleDatabaseTable createAlias(String alias) {
    return $ArticleDatabaseTable(attachedDatabase, alias);
  }
}

abstract class _$NewsDatabase extends GeneratedDatabase {
  _$NewsDatabase(QueryExecutor e) : super(e);
  late final $TopHeadlinesDatabaseTable topHeadlinesDatabase =
      $TopHeadlinesDatabaseTable(this);
  late final $ArticleDatabaseTable articleDatabase =
      $ArticleDatabaseTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [topHeadlinesDatabase, articleDatabase];
}
