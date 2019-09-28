// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repo _$RepoFromJson(Map<String, dynamic> json) {
  return Repo()
    ..id = json['id'] as num
    ..name = json['name'] as String
    ..fullName = json['full_name'] as String
    ..owner = json['owner'] == null
        ? null
        : User.fromJson(json['owner'] as Map<String, dynamic>)
    ..parent = json['parent'] == null
        ? null
        : Repo.fromJson(json['parent'] as Map<String, dynamic>)
    ..private = json['private'] as bool
    ..description = json['description'] as String
    ..fork = json['fork'] as bool
    ..language = json['language'] as String
    ..forksCount = json['forks_count'] as num
    ..stargazersCount = json['stargazers_count'] as num
    ..size = json['size'] as num
    ..defaultBranch = json['default_branch'] as String
    ..openIssuesCount = json['open_issues_count'] as num
    ..pushedAt = json['pushed_at'] == null
        ? null
        : DateTime.parse(json['pushed_at'] as String)
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..subscribersCount = json['subscribers_count'] as num
    ..license = json['license'] as Map<String, dynamic>;
}

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'owner': instance.owner,
      'parent': instance.parent,
      'private': instance.private,
      'description': instance.description,
      'fork': instance.fork,
      'language': instance.language,
      'forks_count': instance.forksCount,
      'stargazers_count': instance.stargazersCount,
      'size': instance.size,
      'default_branch': instance.defaultBranch,
      'open_issues_count': instance.openIssuesCount,
      'pushed_at': instance.pushedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'subscribers_count': instance.subscribersCount,
      'license': instance.license
    };
