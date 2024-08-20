import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rcp_dashboard/src/features/attachment/models/image_model.dart';

part 'gallery_cubit.freezed.dart';
part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(const GalleryState.initial());

  Future<void> loadImages() async {
    emit(const GalleryState.loading());
    await Future.delayed(const Duration(seconds: 2));
    emit(GalleryState.loaded(images: mock, hasReachedMax: true));
  }
}

final List<ImageModel> mock = [
  ImageModel(
    id: 1,
    url: 'https://picsum.photos/200/300',
    name: 'Image 1',
    fileName: 'image_1.jpg',
    description: 'Description 1',
    createdAt: '2021-09-01T00:00:00Z',
    updatedAt: '2021-09-01T00:00:00Z',
    thumbnailUrl: 'https://picsum.photos/200/300',
    seo: ImageSeo(
      alt: 'Image 1',
      title: 'Image 1',
      description: 'Description 1',
    ),
  ),
  ImageModel(
    id: 2,
    url: 'https://picsum.photos/200/300',
    name: 'Image 2',
    fileName: 'image_2.jpg',
    description: 'Description 2',
    createdAt: '2021-09-01T00:00:00Z',
    updatedAt: '2021-09-01T00:00:00Z',
    thumbnailUrl: 'https://picsum.photos/200/300',
    seo: ImageSeo(
      alt: 'Image 2',
      title: 'Image 2',
      description: 'Description 2',
    ),
  ),
  ImageModel(
    id: 3,
    url: 'https://picsum.photos/200/300',
    name: 'Image 3',
    fileName: 'image_3.jpg',
    description: 'Description 3',
    createdAt: '2021-09-01T00:00:00Z',
    updatedAt: '2021-09-01T00:00:00Z',
    thumbnailUrl: 'https://picsum.photos/200/300',
    seo: ImageSeo(
      alt: 'Image 3',
      title: 'Image 3',
      description: 'Description 3',
    ),
  ),
  ImageModel(
    id: 4,
    url: 'https://picsum.photos/200/300',
    name: 'Image 4',
    fileName: 'image_4.jpg',
    description: 'Description 4',
    createdAt: '2021-09-01T00:00:00Z',
    updatedAt: '2021-09-01T00:00:00Z',
    thumbnailUrl: 'https://picsum.photos/200/300',
  ),
];
