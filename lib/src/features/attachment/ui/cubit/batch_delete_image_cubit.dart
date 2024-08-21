import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rcp_dashboard/src/features/attachment/models/image_model.dart';
import 'package:rcp_dashboard/src/features/attachment/service/gallery_service.dart';

part 'batch_delete_image_cubit.freezed.dart';
part 'batch_delete_image_state.dart';

class BatchDeleteImageCubit extends Cubit<BatchDeleteImageState> {
  BatchDeleteImageCubit({
    required this.galleryService,
  }) : super(const BatchDeleteImageState.initial()) {
    _subscription = galleryService.selectedImages.distinct().listen((images) {
      if (images.isEmpty) {
        emit(const BatchDeleteImageState.initial());
      } else {
        emit(
          BatchDeleteImageState.selectedToDelte(
            selectedImages: images,
          ),
        );
      }
    });
  }

  final GalleryService galleryService;

  late StreamSubscription<List<ImageModel>?> _subscription;

  void deleteImages() {
    emit(const BatchDeleteImageState.deleting());

    galleryService.deleteImages();
  }

  @override
  Future<void> close() {
    _subscription.cancel();

    return super.close();
  }
}
