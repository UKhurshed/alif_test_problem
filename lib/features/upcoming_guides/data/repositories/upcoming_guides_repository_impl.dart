import 'package:alif_test/core/error/exception.dart';
import 'package:alif_test/core/error/failure.dart';
import 'package:alif_test/core/network/dio_exceptions.dart';
import 'package:alif_test/core/network/network_info.dart';
import 'package:alif_test/features/upcoming_guides/data/datasources/local/upcoming_guides_local_datasource.dart';
import 'package:alif_test/features/upcoming_guides/data/datasources/remote/upcoming_guides_remote_datasource.dart';
import 'package:alif_test/features/upcoming_guides/domain/entities/upcoming_guides.dart';
import 'package:alif_test/features/upcoming_guides/domain/repositories/upcoming_guides_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UpcomingGuidesRepositoryImpl implements UpcomingGuidesRepository {
  final UpcomingGuidesLocalDataSource upcomingGuidesLocalDataSource;
  final UpcomingGuidesRemoteDataSource upcomingGuidesRemoteDataSource;
  final NetworkInfo networkInfo;

  UpcomingGuidesRepositoryImpl(
      {required this.upcomingGuidesLocalDataSource,
      required this.upcomingGuidesRemoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<UpcomingGuides>>> getUpcomingGuides() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUpcomingGuides =
            await upcomingGuidesRemoteDataSource.getUpcomingGuides();
        List<UpcomingGuides> upcomingGuides = [];
        for (var item in remoteUpcomingGuides.data) {
          final UpcomingGuides guides = UpcomingGuides(
              name: item.name ?? "name",
              icon: item.icon ?? "",
              endDate: item.endDate ?? "date",
              urlToWeb: item.url ?? "");
          upcomingGuides.add(guides);
        }
        return Right(upcomingGuides);
      } on DioError catch (error) {
        return Left(DioExceptions.fromDioError(error));
      } catch (error) {
        return Left(SomethingWentWrongFailure());
      }
    } else {
      try {
        final localUpcomingGuides =
            await upcomingGuidesLocalDataSource.getUpcomingGuides();
        List<UpcomingGuides> upcomingGuides = [];
        for (var item in localUpcomingGuides) {
          final UpcomingGuides guides = UpcomingGuides(
              name: item.name ?? "name",
              icon: item.icon ?? "",
              endDate: item.endDate ?? "date",
              urlToWeb: item.url ?? "");
          upcomingGuides.add(guides);
        }
        if (upcomingGuides.isEmpty) {
          return Left(DioOtherFailure());
        } else {
          return Right(upcomingGuides);
        }
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
