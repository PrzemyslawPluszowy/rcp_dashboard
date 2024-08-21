import 'package:intl/intl.dart';
import 'package:rcp_dashboard/common/widgets/cashed_image_widget.dart';
import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/attachment/models/image_model.dart';

class ImagesPreviewDialog extends StatefulWidget {
  const ImagesPreviewDialog({
    required this.images,
    required this.index,
    super.key,
  });

  final List<ImageModel> images;
  final int index;

  @override
  State<ImagesPreviewDialog> createState() => _ImagesPreviewDialogState();
}

class _ImagesPreviewDialogState extends State<ImagesPreviewDialog> {
  @override
  void initState() {
    super.initState();
    selectedIndex = ValueNotifier<int>(widget.index);
    _descController = TextEditingController(
      text: widget.images[widget.index].description,
    );
    _nameController = TextEditingController(
      text: widget.images[widget.index].name,
    );
    _altTextController = TextEditingController(
      text: widget.images[widget.index].seo?.alt,
    );
  }

  late final ValueNotifier<int> selectedIndex;

  void _nextImge() {
    if (selectedIndex.value < widget.images.length - 1) {
      selectedIndex.value++;
      _altTextController.text =
          widget.images[selectedIndex.value].seo?.alt ?? '';
      _nameController.text = widget.images[selectedIndex.value].name;
      _descController.text = widget.images[selectedIndex.value].description;
    }
  }

  void _previousImage() {
    if (selectedIndex.value > 0) {
      selectedIndex.value--;
      _altTextController.text =
          widget.images[selectedIndex.value].seo?.alt ?? '';
      _nameController.text = widget.images[selectedIndex.value].name;
      _descController.text = widget.images[selectedIndex.value].description;
    }
  }

  late final TextEditingController _descController;
  late final TextEditingController _nameController;
  late final TextEditingController _altTextController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.7,
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: ValueListenableBuilder(
          valueListenable: selectedIndex,
          builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  onPressed: _previousImage,
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: _nextImge,
                ),
              ],
              title: Text(
                widget.images[value].name,
              ),
            ),
            body: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.7,
              height: MediaQuery.sizeOf(context).height * 0.7,
              child: Row(
                children: [
                  Expanded(
                    child: CashedImageWidget(
                      imageUrl: widget.images[value].url,
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(),
                        Padding(
                          padding: Ui.paddingMedium,
                          child: Text(
                            textAlign: TextAlign.left,
                            // ignore: lines_longer_than_80_chars
                            'Uploaded at:\n${DateFormat('yyyy-MM-dd HH:mm:ss').format(
                              widget.images[value].createdAt,
                            )}',
                          ),
                        ),
                        const Divider(),
                        TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                          ),
                        ),
                        const Divider(),
                        TextField(
                          controller: _descController,
                          minLines: 3,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            labelText: 'Description',
                          ),
                        ),
                        const Divider(),
                        TextField(
                          controller: _altTextController,
                          decoration: const InputDecoration(
                            labelText: 'Alt text',
                          ),
                        ),
                        const Divider(),
                        gapH8,
                        Center(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            label: const Text('Update'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
