import 'package:alif_test/core/database/database.dart';
import 'package:alif_test/core/network/network_info.dart';
import 'package:alif_test/features/top_headlines/data/datasources/local/top_headlines_local_data_source.dart';
import 'package:alif_test/features/top_headlines/data/datasources/remote/top_headlines_repository.dart';
import 'package:alif_test/features/top_headlines/data/repositories/top_headlines_repository_impl.dart';
import 'package:alif_test/features/top_headlines/domain/repositories/top_headlines_repository.dart';
import 'package:alif_test/features/top_headlines/domain/usecases/getLatestTopHeadlinesNews.dart';
import 'package:alif_test/features/top_headlines/ui/bloc/top_headline/top_headlines_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<void> initIC() async {
  final sl = GetIt.instance;

  //bloc
  sl.registerFactory(() => TopHeadlinesBloc(getLatestTopHeadlinesNews: sl()));

  //usecase
  sl.registerLazySingleton(
      () => GetLatestTopHeadlinesNews(topHeadlinesRepository: sl()));

  //repository
  sl.registerLazySingleton<TopHeadlinesRepository>(() =>
      TopHeadlinesRepositoryImpl(
          topHeadlinesLocalDataSource: sl(),
          topHeadlineRemoteDataSource: sl(),
          networkInfo: sl()));

  //datasource
  sl.registerLazySingleton<TopHeadlineRemoteDataSource>(
      () => TopHeadlineRemoteDataSourceImpl(topHeadlinesLocalSource: sl()));
  sl.registerLazySingleton<TopHeadlinesLocalDataSource>(
      () => TopHeadlinesLocalDataSourceImpl(newsDatabase: sl<NewsDatabase>()));

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

  sl.registerLazySingleton(() => NewsDatabase());

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
