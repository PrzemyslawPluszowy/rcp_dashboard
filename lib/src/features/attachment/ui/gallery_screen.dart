import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery_widget.dart';
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
      body: ListView(
        padding: Ui.horizontalPadding,
        children: const [
          gapH12,
          NavBarGallery(),
          gapH24,
          GalleryWidget(),
          gapH24,
          LoadMoreBtn(),
          gapH24,
        ],
      ),
    );
  }
}
