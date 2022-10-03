import 'package:dartz/dartz.dart';

import '../../../../../core/core.dart';
import '../../domain.dart';

abstract class RepoRepository {
  Future<Either<ExceptionApp, List<RepoEntity>>> get(int pageNumber);
  Future<void> saveLocally();
  Future<List<RepoEntity>> getLocally();
}
