import '../../../domain.dart';

abstract class PullReqRemoteDataSource {
  Future<List<PullRequestEntity>> get(String owner, String repo);
}
