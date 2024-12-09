import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:woodscenter/core/domain/repository/content_repository.dart';

import '../../domain/repository/authentication_repository.dart';
import '../../sources/woodscenter/woodscenter_web_service.dart';
import '../repository/authentication_repository_impl.dart';
import '../repository/content_repository_impl.dart';

extension DataModule on GetIt {
  Future<void> initDataModule() async {
    registerLazySingleton<Dio>(() {
      final dio = Dio()
        ..interceptors.addAll([
          LogInterceptor(requestBody: true, responseBody: true),
        ]);
      return dio;
    });
    registerLazySingleton<WoodscenterWebService>(() => WoodscenterWebService(get()));
    registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl(webService: get()));
    registerLazySingleton<ContentRepository>(() => ContentRepositoryImpl(webService: get()));
  }
}
