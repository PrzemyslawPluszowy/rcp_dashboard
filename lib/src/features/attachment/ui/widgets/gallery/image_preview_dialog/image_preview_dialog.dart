import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rcp_dashboard/common/widgets/cashed_image_widget.dart';
import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/attachment/models/image_model.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/image_preview_dialog/cubit/edit_image_cubit.dart';

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
  late final EditImageCubit _editImageCubit;
  late final TextEditingController _descController;
  late final TextEditingController _nameController;
  late final TextEditingController _altTextController;

  @override
  void initState() {
    super.initState();
    _initializeCubitsAndControllers();
  }

  @override
  void dispose() {
    _editImageCubit.close();
    _descController.dispose();
    _nameController.dispose();
    _altTextController.dispose();
    super.dispose();
  }

  void _initializeCubitsAndControllers() {
    final image = widget.images[widget.index];

    _editImageCubit = EditImageCubit(
      galleryService: getIt.call(),
      images: widget.images,
      index: widget.index,
    );

    _descController = TextEditingController(text: image.description);
    _nameController = TextEditingController(text: image.name);
    _altTextController = TextEditingController(text: image.seo?.alt);
  }

  void _updateImageDetails(int index) {
    _altTextController.text = widget.images[index].seo?.alt ?? '';
    _descController.text = widget.images[index].description;
    _nameController.text = widget.images[index].name;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditImageCubit, EditImageState>(
      bloc: _editImageCubit,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox(),
          loaded: (images, index) {
            return Center(
              child: _buildDialog(context, images, index),
            );
          },
        );
      },
    );
  }

  Widget _buildDialog(
    BuildContext context,
    List<ImageModel> images,
    int index,
  ) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.7,
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: Scaffold(
        appBar: _buildAppBar(context, images, index),
        body: _buildBody(context, images, index),
      ),
    );
  }

  AppBar _buildAppBar(
    BuildContext context,
    List<ImageModel> images,
    int index,
  ) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => context.pop(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            _editImageCubit.previousImage();
            _updateImageDetails(index);
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios_rounded),
          onPressed: () {
            _editImageCubit.nextImage();
            _updateImageDetails(index);
          },
        ),
      ],
      title: Text(images[index].name),
    );
  }

  Widget _buildBody(BuildContext context, List<ImageModel> images, int index) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.7,
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: Row(
        children: [
          Expanded(
            child: CashedImageWidget(imageUrl: images[index].url),
          ),
          _buildDetailsPanel(images, index),
        ],
      ),
    );
  }

  Widget _buildDetailsPanel(List<ImageModel> images, int index) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          Padding(
            padding: Ui.paddingMedium,
            child: Text(
              // ignore: lines_longer_than_80_chars
              'Uploaded at:\n${DateFormat('yyyy-MM-dd HH:mm:ss').format(images[index].createdAt)}',
              textAlign: TextAlign.left,
            ),
          ),
          const Divider(),
          _buildTextField(_nameController, 'Name'),
          const Divider(),
          _buildTextField(
            _descController,
            'Description',
            minLines: 3,
            maxLines: 5,
          ),
          const Divider(),
          _buildTextField(_altTextController, 'Alt text'),
          const Divider(),
          const SizedBox(height: 8),
          _buildUpdateButton(images, index),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    int minLines = 1,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }

  Widget _buildUpdateButton(List<ImageModel> images, int index) {
    return Center(
      child: OutlinedButton.icon(
        onPressed: () {
          final updatedImage = images[index].copyWith(
            name: _nameController.text,
            description: _descController.text,
            updatedAt: DateTime.now(),
            seo: ImageSeo(
              alt: _altTextController.text,
              description: _descController.text,
              title: _nameController.text,
            ),
          );
          _editImageCubit.updateImage(updatedImage);
        },
        label: const Text('Update'),
        icon: const Icon(Icons.update),
      ),
    );
  }
}
