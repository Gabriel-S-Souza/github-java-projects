import 'package:equatable/equatable.dart';

import '../../../domain/domain.dart';

abstract class PullRequestState extends Equatable {
  const PullRequestState();
}

class PullRequestLoading extends PullRequestState {
  const PullRequestLoading();

  @override
  List<Object?> get props => [];
}

class PullRequestCompleted extends PullRequestState {
  final List<PullRequestEntity> pulls;

  const PullRequestCompleted({required this.pulls});

  @override
  List<Object?> get props => [pulls];
}

class PullRequestError extends PullRequestState {
  final String errorMessage;

  const PullRequestError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
