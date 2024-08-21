part of 'gallery_cubit.dart';

@freezed
class GalleryState with _$GalleryState {
  const factory GalleryState.initial() = _Initial;
  const factory GalleryState.loading() = _Loading;
  const factory GalleryState.loaded({
    required List<ImageModel> images,
    @Default([]) List<ImageModel> selectedImages,
  }) = _Loaded;
  const factory GalleryState.error({required String message}) = _Error;
}
