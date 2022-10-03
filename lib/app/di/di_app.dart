import 'package:get_it/get_it.dart';

import '../modules/github_repos/data/data.dart';
import '../modules/github_repos/domain/domain.dart';
import '../modules/github_repos/presentation/presentation.dart';

class Locator {
  static void setUpDependencies() {
    final getIt = GetIt.instance;

    final httpClient = HttpClientImp();
    final githubReposRepository = GithubReposRepositoryImp(
      remoteDataSource: RemoteDataSourceImp(httpClient: httpClient),
      localDataSource: LocalDataSourceImp(),
    );
    final githubReposCase = GithubReposCase(githubReposRepository);
    final githubReposCubit = GithubReposCubit(githubReposCase);
    final githubReposController = GithubReposController(githubReposCubit);

    getIt.registerFactory(() => httpClient);
    getIt.registerFactory(() => githubReposRepository);
    getIt.registerFactory(() => githubReposCase);
    getIt.registerFactory(() => githubReposCubit);
    getIt.registerSingleton<GithubReposController>(githubReposController);
  }

  static type get<type extends Object>() {
    final getIt = GetIt.instance;
    return getIt.get<type>();
  }
}
