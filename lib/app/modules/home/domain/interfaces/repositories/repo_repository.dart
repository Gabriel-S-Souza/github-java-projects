import 'package:dartz/dartz.dart';

import '../../../../../core/core.dart';
import '../../domain.dart';

abstract class RepoRepository {
  Future<Either<ExceptionApp, RepoEntity>> get();
}
