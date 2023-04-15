import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Feature/Home/data/repos/home_repo_imp.dart';
import 'api_service.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(Dio()),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
