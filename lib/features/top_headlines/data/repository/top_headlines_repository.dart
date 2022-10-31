import 'dart:developer';

import 'package:alif_test/core/network/dio_helper.dart';
import 'package:alif_test/core/utils/constants.dart';
import 'package:alif_test/features/top_headlines/data/model/top_headlines_model.dart';

class TopHeadlineRepository {
  Future<TopHeadlineModel> getTopHeadlines(int page) async {
    final response = await API().dio.get(
        '/top-headlines?apiKey=${NewsAPI.apiKey}&page=$page&pageSize=10&category=general');
    log('Response: $response');
    final result = TopHeadlineModel.fromJson(response.data);
    return result;
  }
}
