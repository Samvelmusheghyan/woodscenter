import 'package:woodscenter/core/utils/network/api_wrapper.dart';
import 'package:woodscenter/core/utils/network/parser.dart';

import '../../domain/repository/authentication_repository.dart';
import '../../sources/woodscenter/request/login_request.dart';
import '../../sources/woodscenter/response/login_dto.dart';
import '../../sources/woodscenter/woodscenter_web_service.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final WoodscenterWebService webService;

  AuthenticationRepositoryImpl({required this.webService});

  @override
  Future<ApiWrapper<LoginDto>> login({required String email, required String password, required bool rememberMe, required String gRecaptchaResponse}) {
    return parseHttpResponse(webService.login, [LoginRequest(email: email, password: password, rememberMe: rememberMe, gRecaptchaResponse: gRecaptchaResponse)]);
  }
}
