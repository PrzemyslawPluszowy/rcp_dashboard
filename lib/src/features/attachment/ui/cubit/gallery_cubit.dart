import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/attachment/data/gallery_repository.dart';
import 'package:rcp_dashboard/src/features/attachment/models/image_model.dart';
import 'package:rcp_dashboard/src/features/attachment/service/gallery_service.dart';
import 'package:rxdart/rxdart.dart';

part 'gallery_cubit.freezed.dart';
part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit({
    required this.galleryRepository,
    required this.galleryService,
  }) : super(const GalleryState.initial()) {
    Rx.combineLatest2(
      galleryService.loadedImages,
      galleryService.selectedImages,
      (List<ImageModel>? images, List<ImageModel> selectedImages) {
        if (images == null || images.isEmpty) {
          return const GalleryState.loading();
        }
        return GalleryState.loaded(
          images: images,
          selectedImages: selectedImages,
          hasReachedMax: images.length < _pageSize,
        );
      },
    ).distinct().listen(emit);
  }

  final GalleryService galleryService;
  final GalleryRepository galleryRepository;
  static const int _pageSize = 30;
  int _page = 0;

  Future<void> loadImages() async {
    try {
      emit(const GalleryState.loading());
      final isReachedMax = state.maybeWhen(
        orElse: () => false,
        loaded: (images, _, hasReachedMax) => hasReachedMax,
      );

      if (isReachedMax == true) {
        return;
      }

      final images = await galleryRepository.fetchImages(_page, _pageSize);
      if (images.length < _pageSize) {
        galleryService.addImages([
          ...images,
        ]);
      } else {
        _page++;
        galleryService.addImages(
          images,
        );
      }
    } catch (e, s) {
      emit(GalleryState.error(message: s.toString()));
    }
  }

  void selectImage(ImageModel image) {
    galleryService.selectImage(image);
  }

  //remove
  Future<void> removeImage(ImageModel image) async {
    try {
      // await galleryRepository.removeImage(image.id);
      galleryService.removeImage(image);
    } catch (e, s) {
      emit(GalleryState.error(message: s.toString()));
    }
  }
}
