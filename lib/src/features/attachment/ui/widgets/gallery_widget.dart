import 'package:rcp_dashboard/main_export.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.grey,
        );
      },
      itemCount: 120,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
