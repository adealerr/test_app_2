import 'package:dio/dio.dart';
import 'package:eclipse_test/common/repository/common_repository.dart';
import 'package:eclipse_test/data/local/hive_helper.dart';
import 'package:eclipse_test/data/remote/rest/common_api.dart';
import 'package:eclipse_test/data/repository_impl/common_repository_impl.dart';
import 'package:eclipse_test/utils/dio_provider.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.I;

class ServiceLocator {
  static Future<void> init() async {
    sl.registerSingleton<Dio>(DioProvider().get());

    sl.registerLazySingleton<CommonApi>(() => CommonApi(sl()));

    sl.registerLazySingleton<CommonRepository>(
      () => CommonRepositoryImpl(commonApi: sl()),
    );

    await sl.allReady();
  }
}
