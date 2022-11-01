import 'dart:developer';

import 'package:alif_test/core/network/dio_helper.dart';
import 'package:alif_test/core/utils/constants.dart';
import 'package:alif_test/features/top_headlines/data/local/top_headlines_local.dart';
import 'package:alif_test/features/top_headlines/data/model/top_headlines_model.dart';
import 'package:get_it/get_it.dart';

class TopHeadlineRepository {
  final TopHeadlinesLocalSource _topHeadlinesLocalSource =
      GetIt.I.get<TopHeadlinesLocalSource>();

  Future<TopHeadlineModel> getTopHeadlines(int page) async {
    final response = await API().dio.get(
        '/top-headlines?apiKey=${NewsAPI.apiKey}&page=$page&pageSize=7&category=general');
    log('Response: $response');
    final result = TopHeadlineModel.fromJson(response.data);
    await _topHeadlinesLocalSource.deletePage(page);
    await _topHeadlinesLocalSource.insertTopHeadlines(page, result.articles);
    return result;
  }
}
