import 'package:dartz/dartz.dart';

import '../../../../../core/core.dart';
import '../../domain.dart';

abstract class PullRequestRepository {
  Future<Either<ExceptionApp, PullRequestEntity>> get();
}
