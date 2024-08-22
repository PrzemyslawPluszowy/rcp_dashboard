import 'package:rcp_dashboard/main_export.dart';

class DividerText extends StatelessWidget {
  const DividerText({
    required this.color,
    required this.text,
    this.opacity = 0.8,
    super.key,
  });

  final Color color;
  final String text;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          gapW24,
          Flexible(
            child: Divider(
              color: color.withOpacity(0.8),
            ),
          ),
          gapW24,
          Text(
            text.toUpperCase(),
            style: context.textTheme.bodyLarge?.copyWith(
              color: color.withOpacity(0.8),
            ),
          ),
          gapW24,
          Flexible(
            child: Divider(
              color: color.withOpacity(0.8),
            ),
          ),
          gapW24,
        ],
      ),
    );
  }
}
