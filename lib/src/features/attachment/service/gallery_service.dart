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
    if (selectedImages.contains(image)) {
      _selectedImages.add(selectedImages..remove(image));
    } else {
      _selectedImages.add(selectedImages..add(image));
    }
  }
}
