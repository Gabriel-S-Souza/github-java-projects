import 'package:dartz/dartz.dart';

import '../../../../core/exception/exception_app.dart';
import '../../domain/domain.dart';

class GithubReposRepositoryImp implements GithubReposRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  GithubReposRepositoryImp({
    required RemoteDataSource remoteDataSource,
    required LocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future<Either<ExceptionApp, List<GithubRepoEntity>>> getReposFromApi(
      int pageNumber) async {
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
    await _localDataSource.putLocally();
  }

  @override
  Future<List<GithubRepoEntity>> getReposFromDevice() async =>
      _localDataSource.getLocally();
}
