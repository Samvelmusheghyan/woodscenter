import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'login_dto.g.dart';

@JsonSerializable()
final class LoginDto {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'code')
  final int? code;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'data')
  final LoginDataDto? data;

  const LoginDto({required this.name, required this.message, required this.code, required this.type, required this.data});

  factory LoginDto.fromJson(Map<String, dynamic> json) => _$LoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LoginDataDto {
  @JsonKey(name: 'ctx')
  final String? ctx;
  @JsonKey(name: 'error')
  final LoginDataErrorDto? error;

  const LoginDataDto({required this.ctx, required this.error});

  factory LoginDataDto.fromJson(Map<String, dynamic> json) => _$LoginDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataDtoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LoginDataErrorDto {
  @JsonKey(name: 'stack')
  final String? stack;

  const LoginDataErrorDto({required this.stack});

  factory LoginDataErrorDto.fromJson(Map<String, dynamic> json) => _$LoginDataErrorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataErrorDtoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
