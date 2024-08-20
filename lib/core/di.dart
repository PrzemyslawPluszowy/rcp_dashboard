import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

void initDi() {
  //register and setup dio
  getIt.registerLazySingleton<Dio>(
    () => Dio()
      ..interceptors.add(InterceptorsWrapper())
      ..options = BaseOptions(
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
        },
      )
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
      ),
  );
}
