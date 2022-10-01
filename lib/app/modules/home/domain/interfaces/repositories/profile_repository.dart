import 'package:dartz/dartz.dart';

import '../../../../../core/core.dart';
import '../../domain.dart';

abstract class ProfileRepository {
  Future<Either<ExceptionApp, ProfileEntity>> get();
}
