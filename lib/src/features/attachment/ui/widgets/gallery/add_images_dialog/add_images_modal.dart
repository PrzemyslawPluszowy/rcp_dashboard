import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rcp_dashboard/main_export.dart';

class AddImagesModal extends StatefulWidget {
  const AddImagesModal({super.key});

  @override
  State<AddImagesModal> createState() => _AddImagesModalState();
}

class _AddImagesModalState extends State<AddImagesModal> {
  final ValueNotifier<List<File>> files = ValueNotifier<List<File>>(<File>[]);

  List<PlatformFile> _imageFile = [];

  Future<void> _pickImage() async {
    try {
      // Wybierz plik obrazu za pomocą pakietu file_picker
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        compressionQuality: 80,
        type: FileType.image,
        onFileLoading: (p0) {
          print('loading');
        },
      );

      // Jeśli użytkownik anuluje wybór, nie rób nic
      if (result == null) return;

      // Jeśli użytkownik wybierze obraz, zaktualizuj stan z nowym plikiem obrazu
      setState(() {
        _imageFile = result.files;
      });
    } catch (e) {
      // W przypadku błędu, pokaż snackbar z komunikatem o błędzie
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text('Dodaj obrazy'.hardcoded),
          ),
          body: Column(
            children: [
              gapH24,
              Align(
                child: GestureDetector(
                  onTap: () async {
                    await _pickImage();
                  },
                  child: Container(
                    height: Sizes.p96,
                    width: Sizes.p96,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                          blurRadius: Sizes.p8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add_a_photo, color: Colors.white),
                  ).animate(
                    onPlay: (controller) {
                      controller.repeat(reverse: true);
                    },
                  ).boxShadow(
                    begin: BoxShadow(
                      color: context.colorScheme.primary.withOpacity(1),
                      blurRadius: Sizes.p16,
                      spreadRadius: Sizes.p8,
                    ),
                    end: BoxShadow(
                      color: context.colorScheme.primary.withOpacity(1),
                      blurRadius: Sizes.p8,
                    ),
                    duration: Ui.durationLong,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(Sizes.p96),
                    ),
                  ),
                ),
              ),
              gapH24,

              // Jeśli plik obrazu został wybrany, pokaż obraz

              if (_imageFile.isNotEmpty)
                Expanded(
                  child: SizedBox(
                    child: GridView.builder(
                      padding: Ui.horizontalPadding,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      shrinkWrap: true,
                      itemCount: _imageFile.length,
                      itemBuilder: (context, index) {
                        final file = _imageFile[index];
                        return SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: Ui.borderRadiusMedium,
                              image: DecorationImage(
                                image: MemoryImage(
                                  file.bytes!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ).animate().fadeIn(
                              duration: Ui.durationMedium,
                            );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
