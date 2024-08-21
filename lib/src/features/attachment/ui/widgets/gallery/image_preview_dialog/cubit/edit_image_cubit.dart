import 'dart:async';

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
    _subscription = galleryService.loadedImages.distinct().listen((images) {
      final currentIndex = state.maybeWhen(
        loaded: (_, index) => index,
        orElse: () => null,
      );

      if (images != null && currentIndex != null) {
        emit(EditImageState.loaded(images: images, index: currentIndex));
      }
    });
  }

  final GalleryService galleryService;
  final int index;
  final List<ImageModel> images;
  late StreamSubscription<List<ImageModel>?> _subscription;

  void updateImage(ImageModel image) {
    galleryService.updatedImage(image);
  }

  void nextImage() {
    state.maybeWhen(
      loaded: (images, index) {
        if (index < images.length - 1) {
          emit(EditImageState.loaded(images: images, index: index + 1));
        }
      },
      orElse: () {},
    );
  }

  void previousImage() {
    state.maybeWhen(
      loaded: (images, index) {
        if (index > 0) {
          emit(EditImageState.loaded(images: images, index: index - 1));
        }
      },
      orElse: () {},
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
