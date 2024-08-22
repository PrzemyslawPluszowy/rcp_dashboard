import 'package:flutter_animate/flutter_animate.dart';
import 'package:rcp_dashboard/main_export.dart';

class PickButton extends StatelessWidget {
  const PickButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.p96,
      width: Sizes.p96,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            blurRadius: Sizes.p8,
            offset: const Offset(0, 4),
          ),
        ],
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.add_a_photo, color: Colors.white),
    ).animate(
      onPlay: (controller) {
        controller.repeat(reverse: true);
      },
    ).boxShadow(
      begin: BoxShadow(
        color: context.colorScheme.primary,
        blurRadius: Sizes.p16,
        spreadRadius: Sizes.p8,
      ),
      end: BoxShadow(
        color: context.colorScheme.primary,
        blurRadius: Sizes.p8,
      ),
      duration: Ui.durationLong,
      borderRadius: const BorderRadius.all(
        Radius.circular(Sizes.p96),
      ),
    );
  }
}
