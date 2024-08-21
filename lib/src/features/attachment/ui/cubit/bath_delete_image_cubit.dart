import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rcp_dashboard/src/features/attachment/models/image_model.dart';
import 'package:rcp_dashboard/src/features/attachment/service/gallery_service.dart';

part 'bath_delete_image_cubit.freezed.dart';
part 'bath_delete_image_state.dart';

class BathDeleteImageCubit extends Cubit<BathDeleteImageState> {
  BathDeleteImageCubit({
    required this.galleryService,
  }) : super(const BathDeleteImageState.initial()) {
    _subscription = galleryService.selectedImages.distinct().listen((images) {
      if (images.isEmpty) {
        emit(const BathDeleteImageState.initial());
      } else {
        emit(
          BathDeleteImageState.selectedToDelte(
            selectedImages: images,
          ),
        );
      }
    });
  }

  final GalleryService galleryService;

  late StreamSubscription<List<ImageModel>?> _subscription;

  void deleteImages() {
    emit(const BathDeleteImageState.deleting());

    galleryService.deleteImages();
  }

  @override
  Future<void> close() {
    _subscription.cancel();

    return super.close();
  }
}
