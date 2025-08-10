import 'package:equatable/equatable.dart';

class Repo extends Equatable {
  final int id;
  final String name;
  final String fullName;
  final String owner;
  final String avatarUrl;
  final int stars;
  final int forks;
  final String description;
  final String htmlUrl;

  const Repo(
      {required this.id,
      required this.name,
      required this.fullName,
      required this.owner,
      required this.avatarUrl,
      required this.stars,
      required this.forks,
      required this.description,
      required this.htmlUrl});

  @override
  List<Object?> get props => [id];
}
