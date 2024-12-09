import '../../sources/woodscenter/response/login_dto.dart';
import '../../utils/network/api_wrapper.dart';

abstract interface class AuthenticationRepository {

  //TODO:need to create another model and use it as a response
  Future<ApiWrapper<LoginDto>> login({required String email,required String password,required bool rememberMe,required String gRecaptchaResponse});
}