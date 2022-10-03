import '../../../domain.dart';

abstract class LocalDataSource {
  Future<List<RepoEntity>> getLocally();
  Future<void> saveLocally();
}
