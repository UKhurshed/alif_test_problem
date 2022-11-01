import 'dart:io';

import 'package:alif_test/core/database/tables.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DriftDatabase(tables: [TopHeadlinesDatabase, ArticleDatabase])
class NewsDatabase extends _$NewsDatabase {
  NewsDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (db) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
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
