import '../../../domain.dart';

abstract class RepoLocalDataSource {
  Future<List<RepoEntity>> read();
  Future<void> save();
}
