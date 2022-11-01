part of 'top_headlines_bloc.dart';

@immutable
abstract class TopHeadlinesState {}

class TopHeadlinesInitial extends TopHeadlinesState {}

class TopHeadlinesError extends TopHeadlinesState {
  final String errorMessage;

  TopHeadlinesError({required this.errorMessage});
}

class TopHeadlinesSuccess extends TopHeadlinesState {
  final List<Article> articles;
  final int page;

  TopHeadlinesSuccess({required this.articles, required this.page});

  TopHeadlinesSuccess copyWith(List<Article> articles) =>
      TopHeadlinesSuccess(articles: articles, page: page);
}
