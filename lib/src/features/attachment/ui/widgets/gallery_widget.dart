import 'package:rcp_dashboard/common/widgets/cashed_image_widget.dart';
import 'package:rcp_dashboard/common/widgets/responsive.dart';
import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/cubit/gallery_cubit.dart';

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
          loaded: (images, _) => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _getCrossAxisCount(context),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return CashedImageWidget(
                imageUrl: images[index].thumbnailUrl,
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
}
