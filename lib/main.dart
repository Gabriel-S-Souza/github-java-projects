import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/app.dart';
import 'app/di/di.dart';
import 'app/modules/repositories_list/domain/domain.dart';

void main() async {
  ServiceLocator.setUpDependencies();
  final repository = GetIt.I.get<RepoRepository>();
  final response = await repository.get(1);
  response.fold(
    (exception) => print(exception.message ?? 'deu erro'),
    (repoListe) => print(repoListe[0]),
  );
  runApp(const AppWidget());
}
