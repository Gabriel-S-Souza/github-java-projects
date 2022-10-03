import 'cubits.dart';

class GithubReposController {
  final GithubReposCubit githubReposCubit;
  final PullRequestCubit pullRequestCubit;

  GithubReposController({
    required this.githubReposCubit,
    required this.pullRequestCubit,
  });
}
