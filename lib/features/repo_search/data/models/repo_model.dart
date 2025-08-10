import 'package:hive/hive.dart';

part 'repo_model.g.dart';

@HiveType(typeId: 0)
class RepoModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String fullName;

  @HiveField(2)
  final String ownerLogin;

  @HiveField(3)
  final String ownerAvatarUrl;

  @HiveField(4)
  final String htmlUrl;

  @HiveField(5)
  final String description;

  @HiveField(6)
  final int stargazersCount;

  @HiveField(7)
  final int forksCount;

  @HiveField(8)
  final String? language;

  @HiveField(9)
  final String? licenseName;

  RepoModel({
    required this.name,
    required this.fullName,
    required this.ownerLogin,
    required this.ownerAvatarUrl,
    required this.htmlUrl,
    required this.description,
    required this.stargazersCount,
    required this.forksCount,
    this.language,
    this.licenseName,
  });

  factory RepoModel.fromJson(Map<String, dynamic> json) {
    return RepoModel(
      name: json['name'],
      fullName: json['full_name'],
      ownerLogin: json['owner']['login'],
      ownerAvatarUrl: json['owner']['avatar_url'],
      htmlUrl: json['html_url'],
      description: json['description'] ?? '',
      stargazersCount: json['stargazers_count'] ?? 0,
      forksCount: json['forks_count'] ?? 0,
      language: json['language'],
      licenseName: json['license'] != null ? json['license']['name'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'full_name': fullName,
      'owner': {
        'login': ownerLogin,
        'avatar_url': ownerAvatarUrl,
      },
      'html_url': htmlUrl,
      'description': description,
      'stargazers_count': stargazersCount,
      'forks_count': forksCount,
      'language': language,
      'license': licenseName != null ? {'name': licenseName} : null,
    };
  }
}
