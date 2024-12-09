import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repository/authentication_repository.dart';
import '../../sources/authentication/authentication_web_service.dart';
import '../repository/authentication_repository_impl.dart';

extension DataModule on GetIt {
  Future<void> initDataModule() async {
    registerLazySingleton<Dio>(() {
      final dio = Dio()
        ..interceptors.addAll([
          LogInterceptor(requestBody: true, responseBody: true),
        ]);
      return dio;
    });
    registerLazySingleton<AuthenticationWebService>(() => AuthenticationWebService(get()));
    registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl(authenticationWebService: get()));
  }
}
