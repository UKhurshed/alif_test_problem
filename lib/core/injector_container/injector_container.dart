import 'package:alif_test/core/database/database.dart';
import 'package:alif_test/features/top_headlines/data/local/top_headlines_local.dart';
import 'package:get_it/get_it.dart';

Future<void> initIC() async {
  final sl = GetIt.instance;

  sl.registerLazySingleton<NewsDatabase>(() => NewsDatabase());

  sl.registerLazySingleton<TopHeadlinesLocalSource>(
      () => TopHeadlinesLocalSource());
}
