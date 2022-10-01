import '../../../domain.dart';

abstract class RepoRemoteDataSource {
  Future<RepoEntity> get();
}
