// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepoDtoImpl _$$RepoDtoImplFromJson(Map<String, dynamic> json) =>
    _$RepoDtoImpl(
      id: (json['id'] as num).toInt(),
      fullName: json['full_name'] as String,
      name: json['name'] as String,
      owner: RepoOwnerDto.fromJson(json['owner'] as Map<String, dynamic>),
      stars: (json['stargazers_count'] as num).toInt(),
      description: json['description'] as String? ?? '',
      htmlUrl: json['html_url'] as String,
      forks: (json['forks_count'] as num).toInt(),
    );

Map<String, dynamic> _$$RepoDtoImplToJson(_$RepoDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'name': instance.name,
      'owner': instance.owner,
      'stargazers_count': instance.stars,
      'description': instance.description,
      'html_url': instance.htmlUrl,
      'forks_count': instance.forks,
    };

_$RepoOwnerDtoImpl _$$RepoOwnerDtoImplFromJson(Map<String, dynamic> json) =>
    _$RepoOwnerDtoImpl(
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
    );

Map<String, dynamic> _$$RepoOwnerDtoImplToJson(_$RepoOwnerDtoImpl instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
    };
