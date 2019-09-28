import 'package:json_annotation/json_annotation.dart';
import "user.dart";
part 'repo.g.dart';

@JsonSerializable()
class Repo {
  Repo();

  num id;

  String name;

  @JsonKey(name: "full_name")
  String fullName;

  User owner;

  Repo parent;

  bool private;

  String description;

  bool fork;

  String language;

  @JsonKey(name: "forks_count")
  num forksCount;

  @JsonKey(name: "stargazers_count")
  num stargazersCount;

  num size;

  @JsonKey(name: "default_branch")
  String defaultBranch;

  @JsonKey(name: "open_issues_count")
  num openIssuesCount;

  @JsonKey(name: "pushed_at")
  DateTime pushedAt;

  @JsonKey(name: "created_at")
  DateTime createdAt;

  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  @JsonKey(name: "subscribers_count")
  num subscribersCount;

  Map<String,dynamic> license;

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);

  Map<String, dynamic> toJson() => _$RepoToJson(this);
}
