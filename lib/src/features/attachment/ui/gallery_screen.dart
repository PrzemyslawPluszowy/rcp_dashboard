import 'package:rcp_dashboard/main_export.dart';
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
      body: BlocProvider(
        create: (context) => GalleryCubit(
          galleryService: getIt.call(),
        ),
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
