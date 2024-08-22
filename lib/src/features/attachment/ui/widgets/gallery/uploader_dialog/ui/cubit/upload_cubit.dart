import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/data/upload_attachment_repository.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/services/upload_service.dart';

part 'upload_cubit.freezed.dart';
part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit({
    required this.uploadService,
    required this.uploadAttachmentRepository,
  }) : super(const UploadState.initial());

  final UploadService uploadService;
  final UploadAttachmentRepository uploadAttachmentRepository;

  Future<void> uploadFiles() async {
    final files = uploadService.files;
    emit(UploadState.uploading(totalParts: files.length, currentPart: 1));
    for (final element in files) {
      try {
        await uploadAttachmentRepository.uploadImage(
          File(element.path!),
          element.name,
          element.name,
          element.name,
        );
        emit(
          UploadState.uploading(
            totalParts: files.length,
            currentPart: files.indexOf(element) + 1,
          ),
        );
      } catch (e) {
        emit(UploadState.error(e.toString()));
        uploadService.clear();
        return;
      }
    }
    uploadService.clear();
    emit(
      const UploadState.uploaded(),
    );
  }
}
