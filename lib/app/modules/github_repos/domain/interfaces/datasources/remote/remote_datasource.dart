import '../../../domain.dart';

abstract class RemoteDataSource {
  Future<List<GithubRepoEntity>> get(int pageNumber);
}
