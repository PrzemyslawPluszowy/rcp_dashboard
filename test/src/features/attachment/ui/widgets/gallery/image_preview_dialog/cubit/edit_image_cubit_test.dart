import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rcp_dashboard/src/features/attachment/data/gallery_repository.dart';
import 'package:rcp_dashboard/src/features/attachment/models/image_model.dart';
import 'package:rcp_dashboard/src/features/attachment/service/gallery_service.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/cubit/gallery_cubit.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/image_preview_dialog/cubit/edit_image_cubit.dart';

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

void main() {
  late GalleryCubit galleryCubit;
  late GalleryService galleryService;
  late MockGalleryRepository mockGalleryRepository;

  setUp(() {
    mockGalleryRepository = MockGalleryRepository();
    galleryService = GalleryService();
    galleryCubit = GalleryCubit(
      galleryRepository: mockGalleryRepository,
      galleryService: galleryService,
    );
  });

  blocTest<EditImageCubit, EditImageState>(
    '''
    When the updateImage method is called, the image should be updated.
''',
    build: () {
      when(() => mockGalleryRepository.fetchImages(0, 30))
          .thenAnswer((_) async => mockImages);
      return EditImageCubit(
        galleryService: galleryService,
        index: 0,
        images: mockImages,
      );
    },
    act: (cubit) async {
      await galleryCubit.loadImages();

      cubit.updateImage(
        mockImages[0].copyWith(
          name: 'Updated Image 1',
          description: 'Updated Description 1',
        ),
      );
    },
    expect: () => [
      EditImageState.loaded(images: mockImages, index: 0),
      EditImageState.loaded(
        images: [
          mockImages[0].copyWith(
            name: 'Updated Image 1',
            description: 'Updated Description 1',
          ),
          ...mockImages.sublist(1),
        ],
        index: 0,
      ),
    ],
  );

  blocTest<EditImageCubit, EditImageState>(
    '''
    When the nextImage method is called, the next image should be displayed.
''',
    build: () {
      when(() => mockGalleryRepository.fetchImages(0, 30))
          .thenAnswer((_) async => mockImages);
      return EditImageCubit(
        galleryService: galleryService,
        index: 0,
        images: mockImages,
      );
    },
    act: (cubit) async {
      await galleryCubit.loadImages();

      cubit.nextImage();
    },
    expect: () => [
      EditImageState.loaded(images: mockImages, index: 1),
    ],
  );

  blocTest<EditImageCubit, EditImageState>(
    '''
    When the previousImage method is called, the previous image should be displayed.
''',
    build: () {
      when(() => mockGalleryRepository.fetchImages(0, 30))
          .thenAnswer((_) async => mockImages);
      return EditImageCubit(
        galleryService: galleryService,
        index: 1,
        images: mockImages,
      );
    },
    act: (cubit) async {
      await galleryCubit.loadImages();

      cubit
        ..nextImage()
        ..nextImage()
        ..previousImage();
    },
    expect: () => [
      EditImageState.loaded(images: mockImages, index: 2),
      EditImageState.loaded(images: mockImages, index: 3),
      EditImageState.loaded(images: mockImages, index: 2),
    ],
  );
}
