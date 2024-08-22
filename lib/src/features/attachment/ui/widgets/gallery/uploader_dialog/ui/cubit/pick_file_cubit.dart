import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/services/upload_service.dart';

part 'pick_file_cubit.freezed.dart';
part 'pick_file_state.dart';

class PickFileCubit extends Cubit<PickFileState> {
  PickFileCubit({
    required this.uploadService,
  }) : super(const PickFileState.initial());

  final UploadService uploadService;

  Future<void> pickImage() async {
    try {
      emit(const PickFileState.loading());
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        compressionQuality: 80,
        type: FileType.image,
      );

      if (result == null) {
        emit(const PickFileState.initial());
        return;
      }
      uploadService.addFiles(result.files);
      emit(PickFileState.loaded(result.files));
    } catch (e) {
      emit(PickFileState.error(e.toString()));
    }
  }

  void resetState() {
    uploadService.clear();
    emit(const PickFileState.initial());
  }
}
