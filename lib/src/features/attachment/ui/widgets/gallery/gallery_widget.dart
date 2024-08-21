import 'package:rcp_dashboard/common/widgets/cashed_image_widget.dart';
import 'package:rcp_dashboard/common/widgets/responsive.dart';
import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/attachment/models/image_model.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/cubit/gallery_cubit.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/image_preview_dialog/image_preview_dialog.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({
    super.key,
  });

  int _getCrossAxisCount(BuildContext context) {
    switch (Responsive.getDeviceSize(context)) {
      case DeviceType.desktop:
        return 9;
      case DeviceType.tablet:
        return 5;
      case DeviceType.mobile:
        return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryCubit, GalleryState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            context.read<GalleryCubit>().loadImages();
            return const Center(child: CircularProgressIndicator());
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(
            child: Text(
              message,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.error,
              ),
            ),
          ),
          loaded: (images, selectedImages) => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _getCrossAxisCount(context),
              crossAxisSpacing: Sizes.p8,
              mainAxisSpacing: Sizes.p8,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showAdaptiveDialog<BuildContext>(
                    context: context,
                    builder: (_) {
                      return BlocProvider.value(
                        value: context.read<GalleryCubit>(),
                        child: ImagesPreviewDialog(
                          images: images,
                          index: index,
                        ),
                      );
                    },
                  );
                },
                child: _imageContainer(images, index, selectedImages, context),
              );
            },
            itemCount: images.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        );
      },
    );
  }

  Stack _imageContainer(
    List<ImageModel> images,
    int index,
    List<ImageModel> selectedImages,
    BuildContext context,
  ) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CashedImageWidget(
          imageUrl: images[index].thumbnailUrl,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: ColoredBox(
            color: Colors.black.withOpacity(0.5),
            child: Text(
              overflow: TextOverflow.ellipsis,
              images[index].name,
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: IconButton(
            icon: const Icon(
              Icons.remove_circle,
              color: Colors.red,
            ),
            onPressed: () {
              context.read<GalleryCubit>().removeImage(
                    images[index],
                  );
            },
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: Icon(
              Icons.check_circle_rounded,
              color: selectedImages.contains(images[index])
                  ? Colors.green
                  : Colors.white,
            ),
            onPressed: () {
              context.read<GalleryCubit>().selectImage(images[index]);
            },
          ),
        ),
      ],
    );
  }
}
