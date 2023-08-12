import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'data') List<DataBean>? data,
    @JsonKey(name: 'support') SupportBean? support,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, Object?> json) => _$UserProfileFromJson(json);
}

@freezed
class SupportBean with _$SupportBean {
  const factory SupportBean({
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'text') String? text,
  }) = _SupportBean;

  factory SupportBean.fromJson(Map<String, Object?> json) => _$SupportBeanFromJson(json);
}

@freezed
class DataBean with _$DataBean {
  const factory DataBean({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'avatar') String? avatar,
  }) = _DataBean;

  factory DataBean.fromJson(Map<String, Object?> json) => _$DataBeanFromJson(json);
}
