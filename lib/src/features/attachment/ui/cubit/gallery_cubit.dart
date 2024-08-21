import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/attachment/models/image_model.dart';
import 'package:rcp_dashboard/src/features/attachment/service/gallery_service.dart';
import 'package:rxdart/rxdart.dart';

part 'gallery_cubit.freezed.dart';
part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit({
    required this.galleryService,
  }) : super(const GalleryState.initial()) {
    Rx.combineLatest2(
        galleryService.loadedImages, galleryService.selectedImages,
        (List<ImageModel>? images, List<ImageModel> selectedImages) {
      if (images == null) {
        return const GalleryState.loading();
      }
      return GalleryState.loaded(
        images: images,
        selectedImages: selectedImages,
      );
    }).listen(emit);
  }

  final GalleryService galleryService;

  Future<void> loadImages() async {
    emit(const GalleryState.loading());
    await Future.delayed(const Duration(seconds: 2));
    galleryService.addImages(mock);
  }

  void selectImage(ImageModel image) {
    galleryService.selectImage(image);
  }

  //remove
  Future<void> removeImage(ImageModel image) async {
    galleryService.removeImage(image);
  }

  final List<ImageModel> mock = [
    ImageModel(
      id: 1,
      url: 'https://picsum.photos/seed/picsum/200/300',
      name: 'Image 1',
      fileName: 'image_1.jpg',
      description: 'Description 1',
      createdAt: DateTime(
        2021,
        9,
      ),
      thumbnailUrl: 'https://picsum.photos/seed/picsum/200/300',
      seo: ImageSeo(
        alt: 'Image 1',
        title: 'Image 1',
        description: 'Description 1',
      ),
    ),
    ImageModel(
      id: 2,
      url: 'https://picsum.photos/seed/picsum/200/300',
      name: 'Image 2',
      fileName: 'image_2.jpg',
      description: 'Description 2',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      thumbnailUrl: 'https://picsum.photos/seed/picsum/200/300',
      seo: ImageSeo(
        alt: 'Image 2',
        title: 'Image 2',
        description: 'Description 2',
      ),
    ),
    ImageModel(
      id: 3,
      url: 'https://picsum.photos/seed/picsum/200/300',
      name: 'Image 3',
      fileName: 'image_3.jpg',
      description: 'Description 3',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      thumbnailUrl: 'https://picsum.photos/200/300',
      seo: ImageSeo(
        alt: 'Image 3',
        title: 'Image 3',
        description: 'Description 3',
      ),
    ),
    ImageModel(
      id: 4,
      url: 'https://picsum.photos/id/237/200/300',
      name: 'Image 4',
      fileName: 'image_4.jpg',
      description: 'Description 4',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      thumbnailUrl: 'https://picsum.photos/seed/picsum/200/300',
    ),
  ];
}
