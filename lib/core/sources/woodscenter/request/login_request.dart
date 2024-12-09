import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
final class LoginRequest {
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'remember_me')
  final bool rememberMe;
  @JsonKey(name: 'g-recaptcha-response')
  final String gRecaptchaResponse;

  const LoginRequest({required this.email, required this.password, required this.rememberMe, required this.gRecaptchaResponse});

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
