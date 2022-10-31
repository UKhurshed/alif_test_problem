import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:alif_test/features/top_headlines/data/model/top_headlines_model.dart';
import 'package:alif_test/features/top_headlines/data/repository/top_headlines_repository.dart';
import 'package:bloc/bloc.dart';

part 'top_headlines_state.dart';

class TopHeadlinesCubit extends Cubit<TopHeadlinesState> {
  TopHeadlinesCubit() : super(TopHeadlinesInitial());

  final TopHeadlineRepository _topHeadlineRepository = TopHeadlineRepository();

  Future<void> fetchHeadline(int page) async {
    try {
      final result = await _topHeadlineRepository.getTopHeadlines(page);
      emit(TopHeadlineSuccess(topHeadlineModel: result));
    } catch (error) {
      log('Error fetchHeadline: ${error.toString()}');
      emit(TopHeadlineError(message: error.toString()));
    }
  }

  Future<void> reloadTopHeadlines() async {
    emit(TopHeadlinesInitial());
  }
}
