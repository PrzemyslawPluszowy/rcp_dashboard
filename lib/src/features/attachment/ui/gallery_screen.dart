import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/cubit/batch_delete_image_cubit.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/cubit/gallery_cubit.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/gallery_widget.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/load_more_btn.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/nav_bar_gallery.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery Screen'.hardcoded),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => GalleryCubit(
              galleryService: getIt.call(),
              galleryRepository: getIt.call(),
            ),
          ),
          BlocProvider(
            create: (_) => BatchDeleteImageCubit(galleryService: getIt.call()),
          ),
        ],
        child: ListView(
          padding: Ui.horizontalPadding,
          children: const [
            gapH12,
            NavBarGallery(),
            gapH24,
            GalleryWidget(),
            gapH24,
            Divider(),
            gapH8,
            LoadMoreBtn(),
            gapH24,
          ],
        ),
      ),
    );
  }
}
