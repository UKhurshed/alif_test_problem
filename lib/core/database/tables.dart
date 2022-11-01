import 'package:drift/drift.dart';

class UpcomingGuidesModelDatabase extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get endDate => text()();

  TextColumn get icon => text()();

  TextColumn get urlToWeb => text()();
}
