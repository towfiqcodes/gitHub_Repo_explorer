class RepoEntity {
  final String name;
  final String fullName;
  final String ownerLogin;
  final String ownerAvatarUrl;
  final String htmlUrl;
  final String description;
  final bool fork;
  final int stargazersCount;
  final int watchersCount;
  final String? language;
  final int forksCount;
  final int openIssuesCount;
  final String? licenseName;

  RepoEntity({
    required this.name,
    required this.fullName,
    required this.ownerLogin,
    required this.ownerAvatarUrl,
    required this.htmlUrl,
    required this.description,
    required this.fork,
    required this.stargazersCount,
    required this.watchersCount,
    this.language,
    required this.forksCount,
    required this.openIssuesCount,
    this.licenseName,
  });
}


