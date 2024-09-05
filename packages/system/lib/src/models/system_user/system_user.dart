import 'package:json_annotation/json_annotation.dart';

part 'system_user.g.dart';

@JsonSerializable()
class SystemUser {
  @JsonKey()
  String? username;
  @JsonKey()
  String? fullname;
  @JsonKey()
  String? email;
  @JsonKey()
  String? city;
  @JsonKey()
  String? country;
  @JsonKey()
  String? moodlePhoto;
  @JsonKey()
  String? customPhoto;
  @JsonKey()
  bool? active;
  @JsonKey()
  DateTime? createdAt;

  SystemUser({
    this.username,
    this.fullname,
    this.email,
    this.city,
    this.country,
    this.moodlePhoto,
    this.customPhoto,
    this.active,
    this.createdAt,
  });

  String? get firstName => fullname?.substring(
      0, ((fullname?.contains(" ") ?? false) ? fullname?.indexOf(" ") : null));

  factory SystemUser.fromJson(Map<String, dynamic> json) =>
      _$SystemUserFromJson(json);

  Map<String, dynamic> toJson() => _$SystemUserToJson(this);
}
