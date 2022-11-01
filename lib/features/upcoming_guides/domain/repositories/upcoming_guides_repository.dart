import 'package:alif_test/core/error/failure.dart';
import 'package:alif_test/features/upcoming_guides/domain/entities/upcoming_guides.dart';
import 'package:dartz/dartz.dart';

abstract class UpcomingGuidesRepository {
  Future<Either<Failure, List<UpcomingGuides>>> getUpcomingGuides();
}
