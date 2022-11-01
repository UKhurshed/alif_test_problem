import 'package:drift/drift.dart';

class TopHeadlinesDatabase extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get page => text().unique()();
}

class ArticleDatabase extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get page => text()
      .references(TopHeadlinesDatabase, #page, onDelete: KeyAction.cascade)();

  TextColumn get title => text()();

  TextColumn get description => text()();

  TextColumn get urlToImage => text()();

  TextColumn get urlToWeb => text()();
}
