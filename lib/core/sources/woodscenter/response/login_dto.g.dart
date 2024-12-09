// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) => LoginDto(
      name: json['name'] as String?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      type: json['type'] as String?,
      data: json['data'] == null
          ? null
          : LoginDataDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginDtoToJson(LoginDto instance) => <String, dynamic>{
      'name': instance.name,
      'message': instance.message,
      'code': instance.code,
      'type': instance.type,
      'data': instance.data,
    };

LoginDataDto _$LoginDataDtoFromJson(Map<String, dynamic> json) => LoginDataDto(
      ctx: json['ctx'] as String?,
      error: json['error'] == null
          ? null
          : LoginDataErrorDto.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginDataDtoToJson(LoginDataDto instance) =>
    <String, dynamic>{
      'ctx': instance.ctx,
      'error': instance.error,
    };

LoginDataErrorDto _$LoginDataErrorDtoFromJson(Map<String, dynamic> json) =>
    LoginDataErrorDto(
      stack: json['stack'] as String?,
    );

Map<String, dynamic> _$LoginDataErrorDtoToJson(LoginDataErrorDto instance) =>
    <String, dynamic>{
      'stack': instance.stack,
    };
