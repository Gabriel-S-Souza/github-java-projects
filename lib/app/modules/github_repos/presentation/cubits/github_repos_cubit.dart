import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';
import 'github_repos_state.dart';

class GithubReposCubit extends Cubit<GithubReposState> {
  final GithubReposCase _githubReposCase;
  GithubReposCubit(this._githubReposCase)
      : super(const GithubReposCompleted(repos: [])) {
    getReposFromApi(1);
  }

  Future<void> getReposFromApi(int pageNumber) async {
    emit(const GithubReposLoading());
    await Future.delayed(const Duration(seconds: 3));
    final response = await _githubReposCase.getReposFromApi(pageNumber);

    response.fold((exception) => log(exception.message.toString()),
        (reposList) {
      emit(GithubReposCompleted(repos: reposList));
    });
  }
}
