import '../../sources/woodscenter/response/resident_dto.dart';
import '../../utils/network/api_wrapper.dart';

abstract interface class ContentRepository {
  Future<ApiWrapper<ResidentDto>> getResidents();
}
