import 'dart:async';

import 'package:alif_test/features/top_headlines/domain/entities/top_headlines.dart';
import 'package:alif_test/features/top_headlines/domain/usecases/getLatestTopHeadlinesNews.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'top_headlines_event.dart';

part 'top_headlines_state.dart';

class TopHeadlinesBloc extends Bloc<TopHeadlinesEvent, TopHeadlinesState> {
  TopHeadlinesBloc({required this.getLatestTopHeadlinesNews})
      : super(TopHeadlinesInitial()) {
    on<GetTopHeadlines>((event, emit) async {
      final currentState = state;
      if (currentState is TopHeadlinesInitial) {
        final result =
            await getLatestTopHeadlinesNews.call(TopHeadlinesParams(page: 0));
        result.fold(
            (error) => emit(TopHeadlinesError(errorMessage: error.toString())),
            (success) => emit(TopHeadlinesSuccess(articles: success, page: 0)));
      } else if (currentState is TopHeadlinesSuccess) {
        int currentPage = currentState.page;
        final newResult = await getLatestTopHeadlinesNews
            .call(TopHeadlinesParams(page: currentPage++));
        newResult.fold(
            (error) => emit(TopHeadlinesError(errorMessage: error.toString())),
            (success) {
          success.isEmpty
              ? emit(currentState.copyWith(success))
              : emit(TopHeadlinesSuccess(
                  articles: currentState.articles + success,
                  page: currentPage));
        });
      }
    });
  }

  final GetLatestTopHeadlinesNews getLatestTopHeadlinesNews;
}
