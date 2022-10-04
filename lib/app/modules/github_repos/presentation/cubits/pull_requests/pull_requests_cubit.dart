import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';
import '../cubits.dart';

class PullRequestCubit extends Cubit<PullRequestState> {
  final PullRequestCase _pullRequestCase;
  PullRequestCubit(this._pullRequestCase) : super(const PullRequestLoading());

  late GithubRepoEntity? repo;

  Future<void> getPullRequestsFromApi() async {
    emit(const PullRequestLoading());
    await Future.delayed(const Duration(seconds: 3));
    final response = await _pullRequestCase.getReposFromApi(
      repo!.login,
      repo!.name,
    );

    response.fold((exception) {
      log('erro pull');
      log(exception.message.toString());
    }, (pullsList) {
      log('get pull');
      log(pullsList.toString());
      return emit(PullRequestCompleted(pulls: pullsList));
    });
  }
}
