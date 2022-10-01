import '../../../domain.dart';

abstract class ProfileLocalDataSource {
  Future<List<ProfileEntity>> read();
  Future<void> save();
}
