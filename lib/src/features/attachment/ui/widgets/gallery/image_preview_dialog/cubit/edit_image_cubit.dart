import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rcp_dashboard/src/features/attachment/models/image_model.dart';
import 'package:rcp_dashboard/src/features/attachment/service/gallery_service.dart';

part 'edit_image_cubit.freezed.dart';
part 'edit_image_state.dart';

class EditImageCubit extends Cubit<EditImageState> {
  EditImageCubit({
    required this.galleryService,
    required this.index,
    required this.images,
  }) : super(EditImageState.loaded(images: images, index: index)) {
    galleryService.loadedImages.listen((images) {
      final index = state.whenOrNull(
        loaded: (images, index) => index,
      );

      if (index != null) {
        emit(EditImageState.loaded(images: images!, index: index));
      }
    });
  }

  final GalleryService galleryService;
  final int index;
  final List<ImageModel> images;

  void updateImage(ImageModel image) {
    galleryService.updatedImage(image);
  }

  void nextImage() {
    final index = state.whenOrNull(
      loaded: (images, index) => index,
    );

    if (index != null && index < images.length - 1) {
      emit(EditImageState.loaded(images: images, index: index + 1));
    }
  }

  void previousImage() {
    final index = state.whenOrNull(
      loaded: (images, index) => index,
    );

    if (index != null && index > 0) {
      emit(EditImageState.loaded(images: images, index: index - 1));
    }
  }
}
