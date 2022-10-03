import '../../../domain.dart';

abstract class RepoRemoteDataSource {
  Future<List<RepoEntity>> get(int pageNumber);
}
