import 'package:get_it/get_it.dart';
import 'package:rcp_dashboard/core/dio_helper.dart';
import 'package:rcp_dashboard/src/features/attachment/data/gallery_repository.dart';
import 'package:rcp_dashboard/src/features/attachment/service/gallery_service.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/data/upload_attachment_repository.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/services/upload_service.dart';
import 'package:rcp_dashboard/src/features/auth/data/auth_hive_repository.dart';
import 'package:rcp_dashboard/src/features/auth/data/auth_repository.dart';
import 'package:rcp_dashboard/src/features/auth/data/auth_service.dart';

final getIt = GetIt.instance;

void initDi() {
  getIt
    ..registerLazySingleton<TokenHiveRepository>(
      TokenHiveRepository.new,
    )
    ..registerLazySingleton<AuthRepo>(
      () => AuthRepo(
        DioHelper.instance,
      ),
    )
    ..registerLazySingleton<AuthService>(
      () => AuthService(
        tokenRepository: getIt.call(),
        authRepo: getIt.call(),
      ),
    )
    ..registerLazySingleton<GalleryRepository>(
      () => GalleryRepository(DioHelper.instance),
    )
    ..registerLazySingleton<GalleryService>(GalleryService.new)
    ..registerLazySingleton<UploadAttachmentRepository>(
      () => UploadAttachmentRepository(DioHelper.instance),
    )
    ..registerSingleton(UploadService());
}
