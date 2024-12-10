import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'resident_dto.g.dart';

@JsonSerializable()
class ResidentDto {
  @JsonKey(name: "residents")
  final List<ResidentItemDto>? residents;
  @JsonKey(name: "totalCount")
  final int? totalCount;

  const ResidentDto(this.residents, this.totalCount);

  factory ResidentDto.fromJson(Map<String, dynamic> json) => _$ResidentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResidentDtoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ResidentItemDto {
  @JsonKey(name: "space_id")
  final dynamic spaceId;
  @JsonKey(name: "org_index_code")
  final List<dynamic>? orgIndexCode;
  @JsonKey(name: "position")
  final int? position;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "type")
  final ResidentType? type;
  @JsonKey(name: "user_id")
  final dynamic userId;
  @JsonKey(name: "logo")
  final String? logo;
  @JsonKey(name: "images")
  final List<dynamic>? images;
  @JsonKey(name: "public")
  final bool? public;
  @JsonKey(name: "social_links")
  final ResidentsSocialLinksDto? socialLinks;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;

  const ResidentItemDto(this.spaceId, this.position, this.id, this.name, this.description, this.type, this.userId, this.logo, this.images, this.public, this.socialLinks, this.createdAt, this.updatedAt, this.v, this.orgIndexCode);

  factory ResidentItemDto.fromJson(Map<String, dynamic> json) => _$ResidentItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResidentItemDtoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ResidentsSocialLinksDto {
  @JsonKey(name: "facebook")
  final String? facebook;
  @JsonKey(name: "instagram")
  final String? instagram;
  @JsonKey(name: "linkedin")
  final String? linkedin;

  const ResidentsSocialLinksDto(this.facebook, this.instagram, this.linkedin);

  factory ResidentsSocialLinksDto.fromJson(Map<String, dynamic> json) => _$ResidentsSocialLinksDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResidentsSocialLinksDtoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

enum ResidentType {
  all,
  @JsonValue("technology")
  technology,
  @JsonValue("education")
  education,
  @JsonValue("food")
  food,
  @JsonValue("business")
  business;
}
