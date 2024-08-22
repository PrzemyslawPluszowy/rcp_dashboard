import 'package:file_picker/file_picker.dart';

class UploadService {
  final List<PlatformFile> _files = [];

  List<PlatformFile> get files => _files;

  void addFiles(List<PlatformFile> files) {
    _files.addAll(files);
  }

  void clear() {
    _files.clear();
  }
}
