import '../../../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../data.dart';

class RepoRemoteDataSourceImp implements RepoRemoteDataSource {
  final HttpClient httpClient;
  RepoRemoteDataSourceImp({
    required this.httpClient,
  });

  @override
  Future<List<RepoEntity>> get(int pageNumber) async {
    try {
      final ResponseModel response = await httpClient
          .get(Constants.searchRepoPath, queryParameters: {
        'q': 'language:java',
        'sort': 'stars',
        'page': pageNumber
      });
      return (response.body!['items'] as List)
          .map((json) => RepoModel.fromJson(json).toEntity())
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
