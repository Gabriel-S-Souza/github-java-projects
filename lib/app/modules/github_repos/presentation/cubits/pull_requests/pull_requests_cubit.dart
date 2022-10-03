import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';
import '../cubits.dart';

class PullRequestCubit extends Cubit<PullRequestState> {
  final PullRequestCase _pullRequestCase;
  PullRequestCubit(this._pullRequestCase) : super(const PullRequestLoading());

  Future<void> getPullRequestsFromApi(String owner, String repo) async {
    emit(const PullRequestLoading());
    await Future.delayed(const Duration(seconds: 3));
    final response = await _pullRequestCase.getReposFromApi(owner, repo);

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
