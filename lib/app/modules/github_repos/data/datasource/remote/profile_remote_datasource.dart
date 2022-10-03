import '../../../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../data.dart';

class ProfileRemoteDataSourceImp implements ProfileRemoteDataSource {
  final HttpClient httpClient;
  ProfileRemoteDataSourceImp({
    required this.httpClient,
  });

  @override
  Future<ProfileEntity> get(String user) async {
    try {
      final endpoint = '${Constants.usersPath}/$user';
      final ResponseModel response = await httpClient.get(endpoint);
      return ProfileModel.fromJson(response.body!).toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
