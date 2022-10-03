import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';
import 'cubits.dart';

class GithubReposCubit extends Cubit<GithubReposState> {
  final GithubReposCase _githubReposCase;
  GithubReposCubit(this._githubReposCase) : super(const GithubReposLoading()) {
    getReposFromApi(1);
  }

  Future<void> getReposFromApi(int pageNumber) async {
    emit(const GithubReposLoading());
    await Future.delayed(const Duration(seconds: 3));
    final response = await _githubReposCase.getReposFromApi(pageNumber);

    response.fold((exception) => log(exception.message.toString()),
        (reposList) {
      log(reposList.toString());
      emit(GithubReposCompleted(repos: reposList));
    });
  }
}
