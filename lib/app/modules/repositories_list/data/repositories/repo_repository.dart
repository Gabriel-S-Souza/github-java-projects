import 'package:dartz/dartz.dart';

import '../../../../core/exception/exception_app.dart';
import '../../domain/domain.dart';

class RepoRepositoryImp implements RepoRepository {
  final RepoRemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  RepoRepositoryImp({
    required RepoRemoteDataSource remoteDataSource,
    required LocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future<Either<ExceptionApp, List<RepoEntity>>> get(int pageNumber) async {
    try {
      final response = await _remoteDataSource.get(pageNumber);
      return right(response);
    } catch (e) {
      //TODO: implement treatments for different types of errors
      return left(ServerException(message: e.toString()));
    }
  }

  @override
  Future<void> saveLocally() async {
    await _localDataSource.saveLocally();
  }

  @override
  Future<List<RepoEntity>> getLocally() async => _localDataSource.getLocally();
}
