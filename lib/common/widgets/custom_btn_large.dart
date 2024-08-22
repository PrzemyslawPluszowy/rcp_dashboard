import 'package:flutter_animate/flutter_animate.dart';
import 'package:rcp_dashboard/main_export.dart';

class CustomButtonLarge extends StatelessWidget {
  const CustomButtonLarge({
    required this.text,
    this.color,
    this.onPressed,
    this.animation = true,
    super.key,
    this.width = 80,
  });

  final String text;
  final Color? color;
  final void Function()? onPressed;
  final bool animation;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: Ui.borderRadiusMedium,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(1, 4),
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: Ui.borderRadiusMedium,
        child: FilledButton(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(
              Size(
                width,
                70,
              ),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: Ui.borderRadiusMedium,
              ),
            ),
            elevation: const WidgetStatePropertyAll(
              10,
            ),
            backgroundColor: WidgetStatePropertyAll(
              context.colorScheme.primary.withOpacity(1),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: context.textTheme.bodyLarge?.copyWith(
              color: color ?? Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ).animate(
          onPlay: (controller) {
            if (animation) {
              controller.repeat();
            } else {
              controller.stop();
            }
          },
        ).shimmer(
          size: 2,
          blendMode: BlendMode.overlay,
          duration: const Duration(seconds: 5),
        ),
      ),
    );
  }
}
