import 'package:flutter/material.dart';
import 'package:flutter_github_explore/model/github_repository.dart';

class RepoDetailView extends StatelessWidget {
  final GithubRepository repository;

  const RepoDetailView({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(repository.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(repository.ownerAvatarUrl),
            ),
            const SizedBox(height: 16),
            Text('Name: ${repository.name}'),
            Text('Owner: ${repository.owner}'),
            Text('Language: ${repository.language}'),
            Text('Stars: ${repository.stars}'),
            Text('Watchers: ${repository.watchers}'),
            Text('Forks: ${repository.forks}'),
            Text('Issues: ${repository.openIssues}'),
          ],
        ),
      ),
    );
  }
}
