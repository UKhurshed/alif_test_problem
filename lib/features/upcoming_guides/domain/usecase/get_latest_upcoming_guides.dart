import 'package:alif_test/core/error/failure.dart';
import 'package:alif_test/core/usecases/usercase.dart';
import 'package:alif_test/features/upcoming_guides/domain/entities/upcoming_guides.dart';
import 'package:alif_test/features/upcoming_guides/domain/repositories/upcoming_guides_repository.dart';
import 'package:dartz/dartz.dart';

class GetLatestUpcomingGuides extends UseCase<List<UpcomingGuides>, dynamic> {
  final UpcomingGuidesRepository upcomingGuidesRepository;

  GetLatestUpcomingGuides({required this.upcomingGuidesRepository});

  @override
  Future<Either<Failure, List<UpcomingGuides>>> call(dynamic params) async {
    return await upcomingGuidesRepository.getUpcomingGuides();
  }
}
