part of 'bath_delete_image_cubit.dart';

@freezed
class BathDeleteImageState with _$BathDeleteImageState {
  const factory BathDeleteImageState.initial() = _Initial;
  const factory BathDeleteImageState.deleting() = _Deleting;
  const factory BathDeleteImageState.selectedToDelte({
    required List<ImageModel> selectedImages,
  }) = _SelectedToDelte;
  const factory BathDeleteImageState.error({required String message}) = _Error;
}
