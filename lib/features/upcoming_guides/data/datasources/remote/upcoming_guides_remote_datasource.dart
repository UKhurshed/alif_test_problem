import 'dart:developer';

import 'package:alif_test/core/network/dio_helper.dart';
import 'package:alif_test/features/upcoming_guides/data/datasources/local/upcoming_guides_local_datasource.dart';
import 'package:alif_test/features/upcoming_guides/data/models/upcoming_guides_model.dart';

abstract class UpcomingGuidesRemoteDataSource {
  Future<UpcomingGuidesModel> getUpcomingGuides();
}

class UpcomingGuidesRemoteDataSourceImpl
    implements UpcomingGuidesRemoteDataSource {
  final UpcomingGuidesLocalDataSource upcomingGuidesLocalDataSource;

  UpcomingGuidesRemoteDataSourceImpl(
      {required this.upcomingGuidesLocalDataSource});

  @override
  Future<UpcomingGuidesModel> getUpcomingGuides() async {
    final response = await API().dio.get('/upcomingGuides');
    log('Response: $response');
    final result = UpcomingGuidesModel.fromJson(response.data);
    await upcomingGuidesLocalDataSource.deleteUpcomingGuides();
    await upcomingGuidesLocalDataSource.insertUpcomingGuides(result.data);
    return result;
  }
}
