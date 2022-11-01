import 'dart:developer';

import 'package:alif_test/core/database/database.dart';
import 'package:alif_test/core/database/tables.dart';
import 'package:alif_test/features/top_headlines/data/model/top_headlines_model.dart';
import 'package:drift/drift.dart';
import 'package:get_it/get_it.dart';

class TopHeadlinesLocalSource {
  final NewsDatabase _db = GetIt.I.get<NewsDatabase>();

  Future<void> getLatestNews() async {
    final topHeadlinesDb = await _db.select(_db.topHeadlinesDatabase).get();
    for (var topElement in topHeadlinesDb) {
      await _getArticleByPage(topElement.page);
    }
  }

  Future<void> _getArticleByPage(String page) async {
    List<QueryRow> articleElement = await _selectArticleByPage(page).get();
    for (var articleItem in articleElement) {
      log('item: ${articleItem.data}');
    }
  }

  Selectable<QueryRow> _selectArticleByPage(String page) {
    return _db.customSelect(
        'SELECT * FROM article_database WHERE article_database.page = ?1',
        readsFrom: {_db.articleDatabase},
        variables: [Variable.withString(page)]);
  }

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
