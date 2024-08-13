class GithubRepository {
  final String name;
  final String owner;
  final String ownerAvatarUrl;
  final String language;
  final int stars;
  final int watchers;
  final int forks;
  final int openIssues;

  GithubRepository({
    required this.name,
    required this.owner,
    required this.ownerAvatarUrl,
    required this.language,
    required this.stars,
    required this.watchers,
    required this.forks,
    required this.openIssues,
  });

  factory GithubRepository.fromJson(Map<String, dynamic> json) {
    return GithubRepository(
      name: json['name'],
      owner: json['owner']['login'],
      ownerAvatarUrl: json['owner']['avatar_url'],
      language: json['language'] ?? 'Unknown',
      stars: json['stargazers_count'],
      watchers: json['watchers_count'],
      forks: json['forks_count'],
      openIssues: json['open_issues_count'],
    );
  }
}

class RepoSearchState {
  final bool isLoading;
  final List<GithubRepository> repositories;

  RepoSearchState({
    this.isLoading = false,
    this.repositories = const [],
  });

  RepoSearchState copyWith({bool? isLoading, List<GithubRepository>? repositories}) {
    return RepoSearchState(
      isLoading: isLoading ?? this.isLoading,
      repositories: repositories ?? this.repositories,
    );
  }
}