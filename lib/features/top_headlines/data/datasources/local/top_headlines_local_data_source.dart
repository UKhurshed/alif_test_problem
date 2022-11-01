import 'dart:developer';
import 'package:alif_test/core/database/database.dart';
import 'package:alif_test/features/top_headlines/data/model/top_headlines_model.dart';
import 'package:drift/drift.dart';

abstract class TopHeadlinesLocalDataSource {
  Future<List<Article>> getLatestNews();

  Future<void> insertTopHeadlines(int page, List<Article> articles);

  Future<void> deletePage(int page);
}

class TopHeadlinesLocalDataSourceImpl implements TopHeadlinesLocalDataSource {
  final NewsDatabase newsDatabase;

  TopHeadlinesLocalDataSourceImpl({required this.newsDatabase});

  @override
  Future<List<Article>> getLatestNews() async {
    List<Article> articles = [];
    final topHeadlinesDb =
        await newsDatabase.select(newsDatabase.topHeadlinesDatabase).get();
    for (var topElement in topHeadlinesDb) {
      final articlesByPage = await _getArticleByPage(topElement.page);
      articles.addAll(articlesByPage);
    }
    return articles;
  }

  Future<List<Article>> _getArticleByPage(String page) async {
    List<Article> articles = [];
    List<QueryRow> articleElement = await _selectArticleByPage(page).get();
    for (var articleItem in articleElement) {
      log('item: ${articleItem.data}');
      articles.add(Article(
          title: articleItem.data['title'],
          description: articleItem.data['description'],
          url: articleItem.data['url_to_web'],
          urlToImage: articleItem.data['url_to_image']));
    }
    return articles;
  }

  Selectable<QueryRow> _selectArticleByPage(String page) {
    return newsDatabase.customSelect(
        'SELECT * FROM article_database WHERE article_database.page = ?1',
        readsFrom: {newsDatabase.articleDatabase},
        variables: [Variable.withString(page)]);
  }

  @override
  Future<void> insertTopHeadlines(int page, List<Article> articles) async {
    try {
      int result = await newsDatabase
          .into(newsDatabase.topHeadlinesDatabase)
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
    await newsDatabase.batch((batch) => batch.insertAll(
        newsDatabase.articleDatabase, insertArticlesDBCompanion));
  }

  @override
  Future<void> deletePage(int page) async {
    try {
      var result = await (newsDatabase.delete(newsDatabase.topHeadlinesDatabase)
            ..where((tbl) => tbl.page.equals(page.toString())))
          .go();
      log('deletePage result: $result');
    } catch (error) {
      log('deletePage error: ${error.toString()}');
    }
  }
}
