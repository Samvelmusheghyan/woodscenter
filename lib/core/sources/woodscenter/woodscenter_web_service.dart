import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:woodscenter/core/sources/woodscenter/request/login_request.dart';
import 'package:woodscenter/core/sources/woodscenter/response/login_dto.dart';
import 'package:woodscenter/core/sources/woodscenter/response/resident_dto.dart';
import '../utils/sources_constants.dart';

part 'woodscenter_web_service.g.dart';

@RestApi(baseUrl: SourcesConstants.baseUrl)
abstract interface class WoodscenterWebService {
  factory WoodscenterWebService(Dio dio, {String baseUrl}) = _WoodscenterWebService;

  @POST('/user/login')
  Future<HttpResponse<LoginDto?>> login(@Body() LoginRequest body);

  @GET('/resident')
  Future<HttpResponse<ResidentDto?>> getResidents();
}
