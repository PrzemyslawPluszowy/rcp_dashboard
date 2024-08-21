import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rcp_dashboard/src/features/attachment/data/gallery_repository.dart';
import 'package:rcp_dashboard/src/features/attachment/models/image_model.dart';
import 'package:rcp_dashboard/src/features/attachment/service/gallery_service.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/cubit/batch_delete_image_cubit.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/cubit/gallery_cubit.dart';

class MockGalleryRepository extends Mock implements GalleryRepository {}

final List<ImageModel> mockImages = [
  ImageModel(
    id: 1,
    url: 'https://picsum.photos/seed/picsum/200/300',
    name: 'Image 1',
    fileName: 'image_1.jpg',
    description: 'Description 1',
    createdAt: DateTime(2021, 9),
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
    createdAt: DateTime(2024),
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

void main() {
  late GalleryCubit galleryCubit;
  late GalleryService galleryService;
  late BatchDeleteImageCubit bathDeleteImageCubit;
  late MockGalleryRepository mockGalleryRepository;

  setUp(() {
    mockGalleryRepository = MockGalleryRepository();
    galleryService = GalleryService();
    bathDeleteImageCubit =
        BatchDeleteImageCubit(galleryService: galleryService);
    galleryCubit = GalleryCubit(
      galleryRepository: mockGalleryRepository,
      galleryService: galleryService,
    );
  });

  blocTest<BatchDeleteImageCubit, BatchDeleteImageState>(
    '''
  Given a gallery cubit
  When an image is selected to delete
  Then the image should be added to the selected images list
  then the image should be removed from the selected images list
  ''',
    build: () {
      when(() => mockGalleryRepository.fetchImages(0, 30))
          .thenAnswer((_) async => mockImages);
      return BatchDeleteImageCubit(galleryService: galleryService);
    },
    act: (cubit) async {
      await galleryCubit.loadImages();
      galleryCubit.selectImage(mockImages[1]);
      bathDeleteImageCubit.deleteImages();
    },
    expect: () => [
      const BatchDeleteImageState.initial(),
      BatchDeleteImageState.selectedToDelte(
        selectedImages: [
          ImageModel(
            id: 2,
            url: 'https://picsum.photos/seed/picsum/200/300',
            name: 'Image 2',
            fileName: 'image_2.jpg',
            description: 'Description 2',
            createdAt: DateTime(
              2024,
            ),
            thumbnailUrl: 'https://picsum.photos/seed/picsum/200/300',
            seo: ImageSeo(
              alt: 'Image 2',
              title: 'Image 2',
              description: 'Description 2',
            ),
          ),
        ],
      ),
      const BatchDeleteImageState.initial(),
    ],
  );
}
