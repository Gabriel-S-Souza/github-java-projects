import 'package:dartz/dartz.dart';

import '../../../../../core/core.dart';
import '../../domain.dart';

abstract class GithubReposRepository {
  Future<Either<ExceptionApp, List<GithubRepoEntity>>> getReposFromApi(
      int pageNumber);
  Future<void> saveLocally();
  Future<List<GithubRepoEntity>> getLocally();
}
