import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rcp_dashboard/main_export.dart';
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

    if (files.isEmpty) {
      return;
    }
    _emitUploadingState(1, files.length);
    for (var i = 0; i < files.length; i++) {
      final file = files[i];
      debugPrint('Processing file: ${file.name} at index $i');

      try {
        // await _simulateFileUploadDelay();

        final multipartFile = _createMultipartFile(file);

        await _uploadFile(multipartFile, file);

        _emitUploadingState(i + 1, files.length);
      } catch (e, stacktrace) {
        _handleUploadError(e, stacktrace);
        return;
      }
    }

    _completeUpload();
  }

  MultipartFile _createMultipartFile(PlatformFile file) {
    return MultipartFile.fromBytes(
      file.bytes!,
      filename: file.name,
    );
  }

  Future<void> _uploadFile(MultipartFile file, PlatformFile element) async {
    await uploadAttachmentRepository.uploadImage(
      file: file,
      alt: element.name,
      description: element.name,
      name: element.name,
    );
  }

  void _emitUploadingState(int currentPart, int totalParts) {
    emit(
      UploadState.uploading(
        totalParts: totalParts,
        currentPart: currentPart,
      ),
    );
  }

  void _handleUploadError(dynamic error, StackTrace stacktrace) {
    emit(UploadState.error(error.toString()));
    uploadService.clear();
  }

  void _completeUpload() {
    uploadService.clear();
    emit(const UploadState.uploaded());
  }

  void reset() {
    uploadService.clear();
    emit(const UploadState.initial());
  }
}
