import 'package:alif_test/core/error/exception.dart';
import 'package:alif_test/core/error/failure.dart';
import 'package:alif_test/core/network/network_info.dart';
import 'package:alif_test/features/top_headlines/data/datasources/local/top_headlines_local_data_source.dart';
import 'package:alif_test/features/top_headlines/data/datasources/remote/top_headlines_repository.dart';
import 'package:alif_test/features/top_headlines/domain/entities/top_headlines.dart';
import 'package:alif_test/features/top_headlines/domain/repositories/top_headlines_repository.dart';
import 'package:dartz/dartz.dart';

class TopHeadlinesRepositoryImpl implements TopHeadlinesRepository {
  final TopHeadlinesLocalDataSource topHeadlinesLocalDataSource;
  final TopHeadlineRemoteDataSource topHeadlineRemoteDataSource;
  final NetworkInfo networkInfo;

  TopHeadlinesRepositoryImpl(
      {required this.topHeadlinesLocalDataSource,
      required this.topHeadlineRemoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<TopHeadlines>>> getTopHeadlines(int page) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTopHeadlines =
            await topHeadlineRemoteDataSource.getTopHeadlines(page);
        List<TopHeadlines> topHeadlines = [];
        for (var item in remoteTopHeadlines.articles) {
          final TopHeadlines headlines = TopHeadlines(
              title: item.title ?? "title",
              description: item.description ?? "description",
              urlToImage: item.urlToImage ?? "",
              urlToWeb: item.url ?? "");
          topHeadlines.add(headlines);
        }
        return Right(topHeadlines);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTopHeadline =
            await topHeadlinesLocalDataSource.getLatestNews();
        List<TopHeadlines> topHeadlines = [];
        for (var item in localTopHeadline) {
          final TopHeadlines headlines = TopHeadlines(
              title: item.title ?? "title",
              description: item.description ?? "description",
              urlToImage: item.urlToImage ?? "",
              urlToWeb: item.url ?? "");
          topHeadlines.add(headlines);
        }
        return Right(topHeadlines);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
