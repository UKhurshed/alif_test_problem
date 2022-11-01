import 'dart:async';

import 'package:alif_test/features/top_headlines/data/model/top_headlines_model.dart';
import 'package:alif_test/features/top_headlines/data/repository/top_headlines_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'top_headlines_event.dart';

part 'top_headlines_state.dart';

class TopHeadlinesBloc extends Bloc<TopHeadlinesEvent, TopHeadlinesState> {
  TopHeadlinesBloc() : super(TopHeadlinesInitial()) {
    on<GetTopHeadlines>((event, emit) async {
      try {
        final currentState = state;
        if (currentState is TopHeadlinesInitial) {
          final result = await _topHeadlineRepository.getTopHeadlines(0);
          emit(TopHeadlinesSuccess(articles: result.articles, page: 0));
        } else if (currentState is TopHeadlinesSuccess) {
          int currentPage = currentState.page;
          final newResult =
              await _topHeadlineRepository.getTopHeadlines(currentPage++);
          newResult.articles.isEmpty
              ? emit(currentState.copyWith(newResult.articles))
              : emit(TopHeadlinesSuccess(
                  articles: currentState.articles + newResult.articles,
                  page: currentPage));
        }
      } catch (error) {
        emit(TopHeadlinesError(errorMessage: error.toString()));
      }
    });
  }

  final TopHeadlineRepository _topHeadlineRepository = TopHeadlineRepository();
}
