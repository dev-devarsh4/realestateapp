import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:realestateapp/features/dashboard/domain/dashboard_repo.dart';

import '../core/apirepo/custom_interceptors.dart';
import '../core/http/network_info.dart';
import '../core/http/network_info_impl.dart';
import '../core/http/rest_client.dart';
import '../core/http/rest_client_impl.dart';
import '../core/loggers/app_log_filter.dart';
import '../core/loggers/app_log_printer.dart';
import '../core/preference/pref_helper.dart';
import '../core/preference/pref_helper_impl.dart';
import '../features/dashboard/data/data_source/remote_load_products_data_source.dart';
import '../features/dashboard/data/data_source/remote_load_products_data_source_impl.dart';
import '../features/dashboard/data/repository/dashboard_repo_impl.dart';
import '../features/splash/data/data_source/remote_fetch_users_data_source.dart';
import '../features/splash/data/data_source/remote_fetch_users_data_source_impl.dart';
import '../features/splash/data/repository/splash_repo_impl.dart';
import '../features/splash/domain/splash_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Configuration injection
  sl.registerLazySingleton<PrefHelper>(() => PrefHelperImpl());
  sl.registerLazySingleton<Logger>(() =>
      Logger(filter: AppLogFilter(), printer: AppLogPrinter(prefHelper: sl())));
  Dio dio = Dio();
  dio.interceptors.add(CustomInterceptors());
  sl.registerSingleton<Dio>(dio);
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<RestClient>(() => RestClientImpl(dioClient: sl()));

  // Some initialization
  sl.registerLazySingleton<FirebaseMessaging>(() => FirebaseMessaging.instance);
  // sl.registerLazySingleton<MessageDataSource>(
  //     () => FirebaseMessageDataSourceImpl());

  // Some API Repositories
  sl.registerLazySingleton<SplashRepo>(
      () => SplashRepoImpl(sl(), remoteFetchUsersRepo: sl()));
  sl.registerLazySingleton<DashboardRepo>(() => DashboardRepoImpl(sl()));

  // Some data sources
  sl.registerLazySingleton<RemoteFetchUsersDataSource>(
      () => RemoteFetchUsersDataSourceImpl(restClient: sl()));
  sl.registerLazySingleton<RemoteLoadProductsDataSource>(() => RemoteLoadProductsDataSourceImpl(restClient: sl()));
}
