import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class PullRequestCase {
  final PullRequestRepository _repository;

  PullRequestCase(this._repository);

  Future<Either<ExceptionApp, List<PullRequestEntity>>> getReposFromApi(
          String owner, String repo) async =>
      _repository.getPullRequests(owner, repo);
}
