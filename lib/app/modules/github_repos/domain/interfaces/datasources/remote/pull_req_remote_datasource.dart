import '../../../domain.dart';

abstract class PullReqRemoteDataSource {
  Future<PullRequestEntity> get();
}
