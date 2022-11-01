import 'dart:developer';

import 'package:alif_test/core/database/database.dart';
import 'package:alif_test/features/upcoming_guides/data/models/upcoming_guides_model.dart';
import 'package:flutter/cupertino.dart';

abstract class UpcomingGuidesLocalDataSource {
  Future<List<Datum>> getUpcomingGuides();

  Future<void> insertUpcomingGuides(List<Datum> upcomingGuides);

  Future<void> deleteUpcomingGuides();
}

class UpcomingGuidesLocalDataSourceImpl
    implements UpcomingGuidesLocalDataSource {
  final UpcomingGuidesDatabase database;

  UpcomingGuidesLocalDataSourceImpl({required this.database});

  @override
  Future<List<Datum>> getUpcomingGuides() async {
    List<Datum> upcoming = [];
    final resultDB =
        await database.select(database.upcomingGuidesModelDatabase).get();
    for (var item in resultDB) {
      upcoming.add(Datum(
          url: item.urlToWeb,
          endDate: item.endDate,
          name: item.name,
          icon: item.icon));
    }
    return upcoming;
  }

  @override
  Future<void> insertUpcomingGuides(List<Datum> upcomingGuides) async {
    try {
      List<UpcomingGuidesModelDatabaseCompanion> insertUpcoming = List.generate(
          upcomingGuides.length,
          (index) => UpcomingGuidesModelDatabaseCompanion.insert(
              name: upcomingGuides[index].name ?? "",
              icon: upcomingGuides[index].icon ?? "",
              endDate: upcomingGuides[index].endDate ?? "",
              urlToWeb: upcomingGuides[index].url ?? ""));
      await database.batch((batch) => batch.insertAll(
          database.upcomingGuidesModelDatabase, insertUpcoming));
    } catch (error) {
      log('error: ${error.toString()}');
    }
  }

  @override
  Future<void> deleteUpcomingGuides() async {
    try {
      var result =
          await (database.delete(database.upcomingGuidesModelDatabase)).go();
      log('result deleteUpcomingGuides: $result');
    } catch (error) {
      log('error deleteUpcomingGuides: ${error.toString()}');
    }
  }
}
