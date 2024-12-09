import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
final class LoginResponse {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'code')
  final int? code;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'data')
  final LoginResponseData? data;

  const LoginResponse({required this.name, required this.message, required this.code, required this.type, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LoginResponseData {
  @JsonKey(name: 'ctx')
  final String? ctx;
  @JsonKey(name: 'error')
  final LoginResponseDataError? error;

  const LoginResponseData({required this.ctx, required this.error});

  factory LoginResponseData.fromJson(Map<String, dynamic> json) => _$LoginResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LoginResponseDataError {
  @JsonKey(name: 'stack')
  final String? stack;

  const LoginResponseDataError({required this.stack});

  factory LoginResponseDataError.fromJson(Map<String, dynamic> json) => _$LoginResponseDataErrorFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDataErrorToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
