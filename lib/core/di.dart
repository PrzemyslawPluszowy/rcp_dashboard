import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rcp_dashboard/src/features/attachment/data/gallery_repository.dart';
import 'package:rcp_dashboard/src/features/attachment/service/gallery_service.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/data/upload_attachment_repository.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/services/upload_service.dart';
import 'package:rcp_dashboard/src/features/auth/data/auth_hive_repository.dart';
import 'package:rcp_dashboard/src/features/auth/data/auth_repository.dart';
import 'package:rcp_dashboard/src/features/auth/data/auth_service.dart';

final getIt = GetIt.instance;

void initDi() {
  //register and setup dio
  getIt
    ..registerLazySingleton<Dio>(
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
    )
    ..registerLazySingleton<TokenHiveRepository>(
      TokenHiveRepository.new,
    )
    ..registerLazySingleton<AuthRepo>(
      () => AuthRepo(
        getIt.call(),
      ),
    )
    ..registerLazySingleton<AuthService>(
      () => AuthService(
        tokenRepository: getIt.call(),
        authRepo: getIt.call(),
        dio: getIt.call(),
      ),
    )
    ..registerLazySingleton<GalleryRepository>(
      () => GalleryRepository(getIt.call()),
    )
    ..registerLazySingleton<GalleryService>(GalleryService.new)
    ..registerLazySingleton<UploadAttachmentRepository>(
      () => UploadAttachmentRepository(getIt.call()),
    )
    ..registerSingleton(UploadService());
}
