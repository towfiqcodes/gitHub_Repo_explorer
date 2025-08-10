import 'package:freezed_annotation/freezed_annotation.dart';
part 'repo_dto.freezed.dart';
part 'repo_dto.g.dart';

@freezed
class RepoDto with _$RepoDto {
  const factory RepoDto({
    required int id,
    @JsonKey(name:'full_name') required String fullName,
    required String name,
    required RepoOwnerDto owner,
    @JsonKey(name:'stargazers_count') required int stars,
    @Default('') String description,
    @JsonKey(name:'html_url') required String htmlUrl,
    @JsonKey(name:'forks_count') required int forks,
  }) = _RepoDto;
  factory RepoDto.fromJson(Map<String,dynamic> json)=>_$RepoDtoFromJson(json);
}

@freezed
class RepoOwnerDto with _$RepoOwnerDto {
  const factory RepoOwnerDto({
    required String login,
    @JsonKey(name:'avatar_url') required String avatarUrl,
  }) = _RepoOwnerDto;
  factory RepoOwnerDto.fromJson(Map<String,dynamic> json)=>_$RepoOwnerDtoFromJson(json);
}