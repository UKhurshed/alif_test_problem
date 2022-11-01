import 'package:alif_test/core/error/failure.dart';
import 'package:alif_test/core/usecases/usercase.dart';
import 'package:alif_test/features/top_headlines/domain/entities/top_headlines.dart';
import 'package:alif_test/features/top_headlines/domain/repositories/top_headlines_repository.dart';
import 'package:dartz/dartz.dart';

class GetLatestTopHeadlinesNews
    extends UseCase<List<TopHeadlines>, TopHeadlinesParams> {
  final TopHeadlinesRepository topHeadlinesRepository;

  GetLatestTopHeadlinesNews({required this.topHeadlinesRepository});

  @override
  Future<Either<Failure, List<TopHeadlines>>> call(
      TopHeadlinesParams params) async {
    return await topHeadlinesRepository.getTopHeadlines(params.page);
  }
}

class TopHeadlinesParams {
  final int page;

  TopHeadlinesParams({required this.page});
}
