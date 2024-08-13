import 'package:flutter/material.dart';
import 'package:flutter_github_explore/view_model/repo_search_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RepoSearchView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(repoSearchProvider);
    final notifier = ref.watch(repoSearchProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Repo Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (query) => notifier.searchRepositories(query),
              decoration: InputDecoration(
                labelText: 'Search Repositories',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: state.isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(

              itemCount: state.repositories.length,
              itemBuilder: (context, index) {
                final repo = state.repositories[index];
                return ListTile(
                  title: Text(repo.name),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
