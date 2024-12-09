// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      name: json['name'] as String?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      type: json['type'] as String?,
      data: json['data'] == null
          ? null
          : LoginResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'message': instance.message,
      'code': instance.code,
      'type': instance.type,
      'data': instance.data,
    };

LoginResponseData _$LoginResponseDataFromJson(Map<String, dynamic> json) =>
    LoginResponseData(
      ctx: json['ctx'] as String?,
      error: json['error'] == null
          ? null
          : LoginResponseDataError.fromJson(
              json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseDataToJson(LoginResponseData instance) =>
    <String, dynamic>{
      'ctx': instance.ctx,
      'error': instance.error,
    };

LoginResponseDataError _$LoginResponseDataErrorFromJson(
        Map<String, dynamic> json) =>
    LoginResponseDataError(
      stack: json['stack'] as String?,
    );

Map<String, dynamic> _$LoginResponseDataErrorToJson(
        LoginResponseDataError instance) =>
    <String, dynamic>{
      'stack': instance.stack,
    };
