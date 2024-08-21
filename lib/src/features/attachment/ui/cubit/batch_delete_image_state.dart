part of 'batch_delete_image_cubit.dart';

@freezed
class BatchDeleteImageState with _$BatchDeleteImageState {
  const factory BatchDeleteImageState.initial() = _Initial;
  const factory BatchDeleteImageState.deleting() = _Deleting;
  const factory BatchDeleteImageState.selectedToDelte({
    required List<ImageModel> selectedImages,
  }) = _SelectedToDelte;
  const factory BatchDeleteImageState.error({required String message}) = _Error;
}
