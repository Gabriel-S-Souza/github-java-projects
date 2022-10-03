import '../../../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../data.dart';

class PullReqRemoteDataSourceImp implements PullReqRemoteDataSource {
  final HttpClient httpClient;
  PullReqRemoteDataSourceImp({
    required this.httpClient,
  });

  @override
  Future<List<PullRequestEntity>> get(String owner, String repo) async {
    try {
      final endpoint = '${Constants.repoPath}/$owner/$repo/pulls';
      final ResponseModel response = await httpClient.get(endpoint);
      return List<Map<String, dynamic>>.from(response.body)
          .map((json) => PullRequestModel.fromJson(json).toEntity())
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
