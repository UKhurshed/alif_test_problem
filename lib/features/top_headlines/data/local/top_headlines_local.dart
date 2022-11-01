import 'dart:developer';

import 'package:alif_test/core/database/database.dart';
import 'package:alif_test/features/top_headlines/data/model/top_headlines_model.dart';
import 'package:get_it/get_it.dart';

class TopHeadlinesLocalSource {
  final NewsDatabase _db = GetIt.I.get<NewsDatabase>();

  Future<void> getLatestNews() async {}

  Future<void> insertTopHeadlines(int page, List<Article> articles) async {
    try {
      int result = await _db
          .into(_db.topHeadlinesDatabase)
          .insert(TopHeadlinesDatabaseCompanion.insert(page: page.toString()));
      await _insertArticles(page, articles);
      log('result insertTopHeadlines:$result');
    } catch (error) {
      log('insertTopHeadlines error: ${error.toString()}');
    }
  }

  Future<void> _insertArticles(int page, List<Article> articles) async {
    List<ArticleDatabaseCompanion> insertArticlesDBCompanion = List.generate(
        articles.length,
        (index) => ArticleDatabaseCompanion.insert(
            page: page.toString(),
            title: articles[index].title ?? "",
            description: articles[index].description ?? "",
            urlToImage: articles[index].urlToImage ?? "",
            urlToWeb: articles[index].url ?? ""));
    await _db.batch((batch) =>
        batch.insertAll(_db.articleDatabase, insertArticlesDBCompanion));
  }

  Future<void> deletePage(int page) async {
    // final nonNullabePage = page
    try {
      var result = await (_db.delete(_db.topHeadlinesDatabase)
            ..where((tbl) => tbl.page.equals(page.toString())))
          .go();
      log('deletePage result: $result');
    } catch (error) {
      log('deletePage error: ${error.toString()}');
    }
  }
}
