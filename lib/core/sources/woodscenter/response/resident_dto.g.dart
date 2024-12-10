// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resident_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResidentDto _$ResidentDtoFromJson(Map<String, dynamic> json) => ResidentDto(
      (json['residents'] as List<dynamic>?)
          ?.map((e) => ResidentItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['totalCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResidentDtoToJson(ResidentDto instance) =>
    <String, dynamic>{
      'residents': instance.residents,
      'totalCount': instance.totalCount,
    };

ResidentItemDto _$ResidentItemDtoFromJson(Map<String, dynamic> json) =>
    ResidentItemDto(
      json['space_id'],
      (json['position'] as num?)?.toInt(),
      json['_id'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      $enumDecodeNullable(_$ResidentTypeEnumMap, json['type']),
      json['user_id'],
      json['logo'] as String?,
      json['images'] as List<dynamic>?,
      json['public'] as bool?,
      json['social_links'] == null
          ? null
          : ResidentsSocialLinksDto.fromJson(
              json['social_links'] as Map<String, dynamic>),
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      (json['__v'] as num?)?.toInt(),
      json['org_index_code'] as List<dynamic>?,
    );

Map<String, dynamic> _$ResidentItemDtoToJson(ResidentItemDto instance) =>
    <String, dynamic>{
      'space_id': instance.spaceId,
      'org_index_code': instance.orgIndexCode,
      'position': instance.position,
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': _$ResidentTypeEnumMap[instance.type],
      'user_id': instance.userId,
      'logo': instance.logo,
      'images': instance.images,
      'public': instance.public,
      'social_links': instance.socialLinks,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

const _$ResidentTypeEnumMap = {
  ResidentType.all: 'all',
  ResidentType.technology: 'technology',
  ResidentType.education: 'education',
  ResidentType.food: 'food',
  ResidentType.business: 'business',
};

ResidentsSocialLinksDto _$ResidentsSocialLinksDtoFromJson(
        Map<String, dynamic> json) =>
    ResidentsSocialLinksDto(
      json['facebook'] as String?,
      json['instagram'] as String?,
      json['linkedin'] as String?,
    );

Map<String, dynamic> _$ResidentsSocialLinksDtoToJson(
        ResidentsSocialLinksDto instance) =>
    <String, dynamic>{
      'facebook': instance.facebook,
      'instagram': instance.instagram,
      'linkedin': instance.linkedin,
    };
