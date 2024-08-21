import 'package:rcp_dashboard/src/features/attachment/models/image_model.dart';
import 'package:rxdart/rxdart.dart';

class GalleryService {
  GalleryService() {
    _loadedImage = BehaviorSubject<List<ImageModel>?>.seeded(null);
    _selectedImages = BehaviorSubject<List<ImageModel>>.seeded([]);
  }

  late BehaviorSubject<List<ImageModel>?> _loadedImage;
  late BehaviorSubject<List<ImageModel>> _selectedImages;

  Stream<List<ImageModel>?> get loadedImages => _loadedImage.stream;
  Stream<List<ImageModel>> get selectedImages => _selectedImages.stream;

  void addImages(List<ImageModel> images) {
    _loadedImage.add([
      ..._loadedImage.value ?? [],
      ...images,
    ]);
  }

  void selectImage(ImageModel image) {
    final selectedImages = List<ImageModel>.from(_selectedImages.value);
    print(
      'selectedImages: $selectedImages',
    );

    if (selectedImages.contains(image)) {
      _selectedImages.add(selectedImages..remove(image));
    } else {
      _selectedImages.add(selectedImages..add(image));
    }
  }

  void updatedImage(ImageModel image) {
    final images = List<ImageModel>.from(_loadedImage.value?.toList() ?? []);
    final index = images.indexWhere((element) => element.id == image.id);
    if (index != -1) {
      images[index] = image;
      _loadedImage.add(images);
    }
  }

  //remove image
  void removeImage(ImageModel image) {
    final images = List<ImageModel>.from(_loadedImage.value?.toList() ?? []);
    final index = images.indexWhere((element) => element.id == image.id);
    if (index != -1) {
      images.removeAt(index);
      _loadedImage.sink.add(
        images,
      );
    }
  }

  void deleteImages() {
    final images = List<ImageModel>.from(_loadedImage.value?.toList() ?? []);
    final selectedImages = List<ImageModel>.from(_selectedImages.value);

    for (var i = 0; i < selectedImages.length; i++) {
      images.removeWhere((element) => element.id == selectedImages[i].id);
    }
    print(images);
    _loadedImage.sink.add(images);
    _selectedImages.sink.add([]);
  }
}
