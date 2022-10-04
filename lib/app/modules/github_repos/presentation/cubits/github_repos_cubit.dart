import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';
import 'github_repos_state.dart';

class GithubReposCubit extends Cubit<GithubReposState> {
  final GithubReposCase _githubReposCase;
  GithubReposCubit(this._githubReposCase)
      : super(const GithubReposCompleted(repos: [])) {
    getReposFromApi();
  }

  final List<GithubRepoEntity> reposList = [];

  int pageNumber = 1;

  Future<void> getReposFromApi() async {
    emit(const GithubReposLoading());
    await Future.delayed(const Duration(seconds: 3));
    final response = await _githubReposCase.getReposFromApi(pageNumber);

    response.fold((exception) => log(exception.message.toString()),
        (reposListResponse) {
      pageNumber++;
      reposList.addAll(reposListResponse);
      emit(GithubReposCompleted(repos: reposList));
    });
  }

  Future<void> loadReposPaginated() async {
    final response = await _githubReposCase.getReposFromApi(pageNumber);
    response.fold((exception) => log(exception.message.toString()),
        (reposListResponse) {
      pageNumber++;
      reposList.addAll(reposListResponse);
      return emit(GithubReposCompleted(repos: reposList));
    });
  }
}
