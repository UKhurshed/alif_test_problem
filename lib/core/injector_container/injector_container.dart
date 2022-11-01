import 'package:alif_test/core/database/database.dart';
import 'package:alif_test/core/network/network_info.dart';
import 'package:alif_test/features/upcoming_guides/data/datasources/local/upcoming_guides_local_datasource.dart';
import 'package:alif_test/features/upcoming_guides/data/datasources/remote/upcoming_guides_remote_datasource.dart';
import 'package:alif_test/features/upcoming_guides/data/repositories/upcoming_guides_repository_impl.dart';
import 'package:alif_test/features/upcoming_guides/domain/repositories/upcoming_guides_repository.dart';
import 'package:alif_test/features/upcoming_guides/domain/usecase/get_latest_upcoming_guides.dart';
import 'package:alif_test/features/upcoming_guides/ui/cubit/upcoming_guides_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<void> initIC() async {
  final sl = GetIt.instance;

  //bloc
  sl.registerFactory(() => UpcomingGuidesCubit(getLatestUpcomingGuides: sl()));

  //usecase
  sl.registerLazySingleton(
      () => GetLatestUpcomingGuides(upcomingGuidesRepository: sl()));

  //repository
  sl.registerLazySingleton<UpcomingGuidesRepository>(() =>
      UpcomingGuidesRepositoryImpl(
          upcomingGuidesLocalDataSource: sl(),
          upcomingGuidesRemoteDataSource: sl(),
          networkInfo: sl()));

  //datasource
  sl.registerLazySingleton<UpcomingGuidesRemoteDataSource>(() =>
      UpcomingGuidesRemoteDataSourceImpl(upcomingGuidesLocalDataSource: sl()));
  sl.registerLazySingleton<UpcomingGuidesLocalDataSource>(() =>
      UpcomingGuidesLocalDataSourceImpl(
          database: sl<UpcomingGuidesDatabase>()));

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

  sl.registerLazySingleton(() => UpcomingGuidesDatabase());

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
