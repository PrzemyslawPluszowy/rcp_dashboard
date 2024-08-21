part of 'edit_image_cubit.dart';

@freezed
class EditImageState with _$EditImageState {
  const factory EditImageState.loading() = _Loading;
  const factory EditImageState.loaded({
    required List<ImageModel> images,
    required int index,
  }) = _Loaded;
  const factory EditImageState.error({required String message}) = _Error;
}
