import 'package:flutter_animate/flutter_animate.dart';
import 'package:rcp_dashboard/main_export.dart';

class UploadingProgress extends StatelessWidget {
  const UploadingProgress({
    required this.currentPart,
    required this.totalParts,
    super.key,
  });

  final int currentPart;
  final int totalParts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        gapH24,
        Expanded(
          child: Align(
            child: Padding(
              padding: Ui.horizontalPadding,
              child: Column(
                children: [
                  Text('Wysyłanie obrazów'.hardcoded),
                  gapH4,
                  Text(
                    'Część $currentPart z $totalParts'.hardcoded,
                  ),
                  gapH12,
                  LinearProgressIndicator(
                    borderRadius: Ui.borderRadiusMedium,
                    minHeight: 10,
                    value: currentPart / totalParts,
                  ).animate(
                    onPlay: (controller) {
                      controller.repeat();
                    },
                  ).shimmer(
                    duration: const Duration(seconds: 5),
                  ),
                  gapH24,
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
          ),
        ),
        gapH24,
      ],
    );
  }
}
