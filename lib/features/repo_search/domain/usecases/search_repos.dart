import '../repositories/repo_repository.dart';
import '../../data/models/repo_dto.dart';

class SearchRepos {
  final RepoRepository repo;

  SearchRepos(this.repo);

  Future<(List<RepoDto>, bool)> call(String query, int page,
          {int perPage = 20}) =>
      repo.search(query: query, page: page, perPage: perPage);
}
