import 'package:alif_test/core/error/failure.dart';
import 'package:alif_test/features/top_headlines/domain/entities/top_headlines.dart';
import 'package:dartz/dartz.dart';

abstract class TopHeadlinesRepository {
  Future<Either<Failure, List<TopHeadlines>>> getTopHeadlines(int page);
}
