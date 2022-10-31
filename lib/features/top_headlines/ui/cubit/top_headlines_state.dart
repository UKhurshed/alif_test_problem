part of 'top_headlines_cubit.dart';

@immutable
abstract class TopHeadlinesState {}

class TopHeadlinesInitial extends TopHeadlinesState {}

class TopHeadlineSuccess extends TopHeadlinesState {
  final TopHeadlineModel topHeadlineModel;

  TopHeadlineSuccess({required this.topHeadlineModel});
}

class TopHeadlineError extends TopHeadlinesState {
  final String message;

  TopHeadlineError({required this.message});
}
