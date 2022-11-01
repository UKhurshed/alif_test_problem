import 'dart:developer';
import 'package:alif_test/core/network/dio_helper.dart';
import 'package:alif_test/core/utils/constants.dart';
import 'package:alif_test/features/top_headlines/data/datasources/local/top_headlines_local_data_source.dart';
import 'package:alif_test/features/top_headlines/data/model/top_headlines_model.dart';

abstract class TopHeadlineRemoteDataSource {
  Future<TopHeadlineModel> getTopHeadlines(int page);
}

class TopHeadlineRemoteDataSourceImpl implements TopHeadlineRemoteDataSource {
  final TopHeadlinesLocalDataSource topHeadlinesLocalSource;

  TopHeadlineRemoteDataSourceImpl({required this.topHeadlinesLocalSource});

  @override
  Future<TopHeadlineModel> getTopHeadlines(int page) async {
    final response = await API().dio.get(
        '/top-headlines?apiKey=${NewsAPI.apiKey}&page=$page&pageSize=7&category=general');
    log('Response: $response');
    final result = TopHeadlineModel.fromJson(response.data);
    await topHeadlinesLocalSource.deletePage(page);
    await topHeadlinesLocalSource.insertTopHeadlines(page, result.articles);
    return result;
  }
}
