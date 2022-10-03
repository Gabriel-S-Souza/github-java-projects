import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/di/di.dart';

void main() async {
  Locator.setUpDependencies();

  // final controller = Locator.get<GithubReposController>();

  // await controller.githubReposCubit.getReposFromApi(1);

  runApp(const AppWidget());
}
