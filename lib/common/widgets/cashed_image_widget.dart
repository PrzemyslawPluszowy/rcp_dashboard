import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rcp_dashboard/main_export.dart';

class CashedImageWidget extends StatelessWidget {
  const CashedImageWidget({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container().animate(
        onPlay: (controller) {
          controller.repeat(
            reverse: true,
          );
        },
      ).shimmer(
        duration: Durations.medium4,
        color: context.colorScheme.primary.withOpacity(0.5),
      ),
      errorWidget: (context, url, error) => Container(
        constraints: const BoxConstraints.tightFor(width: 50, height: 50),
        color: context.colorScheme.errorContainer.withOpacity(0.5),
        child: const Icon(Icons.error),
      ),
    );
  }
}
