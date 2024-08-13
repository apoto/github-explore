import 'package:flutter/material.dart';
import 'package:flutter_github_explore/model/github_repository.dart';
import 'package:flutter_github_explore/service/github_service.dart';
import 'package:flutter_github_explore/view/repo_detail_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final githubServiceProvider = Provider((ref) => GithubService());

final repoSearchProvider = StateNotifierProvider<RepoSearchController, RepoSearchState>((ref) {
  final githubService = ref.watch(githubServiceProvider);
  return RepoSearchController(githubService);
});

class RepoSearchController extends StateNotifier<RepoSearchState> {
  final GithubService _githubService;

  RepoSearchController(this._githubService) : super(RepoSearchState());

  bool isLoading = false;
  List<GithubRepository> repositories = [];

  Future<void> searchRepositories(String query) async {
    state = state.copyWith(isLoading: true);
    final repositories = await _githubService.searchRepositories(query);
    state = state.copyWith(isLoading: false, repositories: repositories);
  }

  void selectRepository(BuildContext context, GithubRepository repository) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RepoDetailView(repository: repository),
      ),
    );
  }
}
