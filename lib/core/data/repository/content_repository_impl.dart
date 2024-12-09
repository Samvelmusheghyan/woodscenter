import 'package:woodscenter/core/utils/network/api_wrapper.dart';

import '../../domain/repository/content_repository.dart';
import '../../sources/woodscenter/response/resident_dto.dart';
import '../../sources/woodscenter/woodscenter_web_service.dart';
import '../../utils/network/parser.dart';

class ContentRepositoryImpl implements ContentRepository {
  final WoodscenterWebService webService;

  ContentRepositoryImpl({required this.webService});

  @override
  Future<ApiWrapper<ResidentDto>> getResidents() {
    return parseHttpResponse(webService.getResidents, []);
  }
}
