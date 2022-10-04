import 'cubits.dart';

class GithubReposController {
  final GithubReposCubit githubReposCubit;
  final PullRequestCubit pullRequestCubit;

  GithubReposController({
    required this.githubReposCubit,
    required this.pullRequestCubit,
  });

  final LoadingOnScrollCubit loadingOnScrollCubit = LoadingOnScrollCubit();

  Future<void> loadReposPaginated() async {
    loadingOnScrollCubit.showLoading();
    await githubReposCubit.loadReposPaginated();
    loadingOnScrollCubit.removeLoading();
  }
}
