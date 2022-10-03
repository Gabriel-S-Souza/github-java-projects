import '../../../domain.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileEntity> get(String user);
}
