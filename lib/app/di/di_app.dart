import 'package:get_it/get_it.dart';

import '../modules/repositories_list/data/data.dart';
import '../modules/repositories_list/domain/domain.dart';

class ServiceLocator {
  static void setUpDependencies() {
    final getIt = GetIt.instance;

    final RepoRepository repoRepository = RepoRepositoryImp(
      remoteDataSource: RepoRemoteDataSourceImp(httpClient: HttpClientImp()),
      localDataSource: LocalDataSourceImp(),
    );

    getIt.registerSingleton<RepoRepository>(repoRepository);
  }
}
