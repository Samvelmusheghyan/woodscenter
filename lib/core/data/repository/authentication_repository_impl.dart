import 'package:woodscenter/core/utils/network/api_wrapper.dart';
import 'package:woodscenter/core/utils/network/parser.dart';

import '../../domain/repository/authentication_repository.dart';
import '../../sources/authentication/authentication_web_service.dart';
import '../../sources/authentication/request/login_request.dart';
import '../../sources/authentication/response/login_response.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationWebService authenticationWebService;

  AuthenticationRepositoryImpl({required this.authenticationWebService});

  @override
  Future<ApiWrapper<LoginResponse>> login({required String email, required String password, required bool rememberMe, required String gRecaptchaResponse}) {
    return parseHttpResponse(authenticationWebService.login, [LoginRequest(email: email, password: password, rememberMe: rememberMe, gRecaptchaResponse: gRecaptchaResponse)]);
  }
}
