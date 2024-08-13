import 'dart:convert';
import 'package:flutter_github_explore/model/github_repository.dart';
import 'package:http/http.dart' as http;

class GithubService {
  final String baseUrl = 'https://api.github.com';

  Future<List<GithubRepository>> searchRepositories(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/search/repositories?q=$query'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['items'] as List;
      return data.map((json) => GithubRepository.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load repositories');
    }
  }
}
