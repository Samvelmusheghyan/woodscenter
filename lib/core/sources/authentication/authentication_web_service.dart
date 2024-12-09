import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:woodscenter/core/sources/authentication/request/login_request.dart';
import 'package:woodscenter/core/sources/authentication/response/login_response.dart';
import '../utils/auth_constants.dart';

part 'authentication_web_service.g.dart';

@RestApi(baseUrl: AuthConstants.baseUrl)
abstract interface class AuthenticationWebService {
  factory AuthenticationWebService(Dio dio, {String baseUrl}) = _AuthenticationWebService;

  @POST('/login')
  Future<HttpResponse<LoginResponse?>> login(@Body() LoginRequest body);
}
