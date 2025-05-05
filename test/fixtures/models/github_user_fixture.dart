import 'dart:convert';

import 'package:alfred_workflow/src/models/github_user.dart';
import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:meta/meta.dart';

extension GithubUserFixture on GithubUser {
  static GithubUserFactory get factory => GithubUserFactory();
}

@internal
final class GithubUserFactory extends FixtureFactory<GithubUser> {
  @override
  FixtureDefinition<GithubUser> definition() => define(
        (Faker faker, [int index = 0]) {
          final String login = faker.lorem.word().toLowerCase();
          final int id = faker.randomGenerator.integer(9999999, min: 1000000);

          return GithubUser(
            login: login,
            id: id,
            nodeId: base64.encode(
              utf8.encode(
                '${faker.randomGenerator.integer(10, min: 00)}:User$id',
              ),
            ),
            avatarUrl:
                Uri.parse('https://avatars.githubusercontent.com/u/$id?v=4'),
            gravatarId: '',
            url: Uri.parse('https://api.github.com/users/$login'),
            htmlUrl: Uri.parse('https://github.com/$login'),
            reposUrl: Uri.parse('https://api.github.com/users/$login/repos'),
            type: 'User',
            siteAdmin: false,
          );
        },
      );

  FixtureRedefinitionBuilder<GithubUser> id(int id) =>
      (GithubUser githubUser, [int index = 0]) => githubUser.copyWith(
            id: id,
            nodeId: base64.encode(
              utf8.encode(
                '${faker.randomGenerator.integer(10, min: 00)}:User$id',
              ),
            ),
            avatarUrl:
                Uri.parse('https://avatars.githubusercontent.com/u/$id?v=4'),
          );

  FixtureRedefinitionBuilder<GithubUser> login(String login) =>
      (GithubUser githubUser, [int index = 0]) => githubUser.copyWith(
            login: login,
            url: Uri.parse('https://api.github.com/users/$login'),
            htmlUrl: Uri.parse('https://github.com/$login'),
            reposUrl: Uri.parse('https://api.github.com/users/$login/repos'),
          );
}
