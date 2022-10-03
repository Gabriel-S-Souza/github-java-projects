import 'package:dartz/dartz.dart';

import '../../../../core/exception/exception_app.dart';
import '../../domain/domain.dart';

class PullRequestRepositoryImp implements PullRequestRepository {
  final PullReqRemoteDataSource _dataSource;

  PullRequestRepositoryImp(this._dataSource);

  @override
  Future<Either<ExceptionApp, List<PullRequestEntity>>> getPullRequests(
      String owner, String repo) async {
    try {
      final response = await _dataSource.get(owner, repo);
      return right(response);
    } catch (e) {
      //TODO: implement treatments for different types of errors
      return left(ServerException(message: e.toString()));
    }
  }
}
