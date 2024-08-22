import 'package:rcp_dashboard/main_export.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({
    required this.message,
    this.onRetry,
    this.onClose,
    this.icon = Icons.error,
    this.iconColor = Colors.red,
    this.title = 'Wystąpił błąd',
    super.key,
  });

  final String message;
  final VoidCallback? onRetry;
  final VoidCallback? onClose;
  final IconData icon;
  final Color iconColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        gapH24,
        Icon(
          icon,
          color: iconColor,
          size: Sizes.p64,
        ),
        gapH8,
        Text(
          title.hardcoded,
          style: context.textTheme.headlineSmall?.copyWith(
            color: context.colorScheme.error,
          ),
        ),
        gapH24,
        Align(
          child: Container(
            padding: Ui.marginMedium,
            margin: Ui.marginLarge,
            decoration: BoxDecoration(
              borderRadius: Ui.borderRadiusSmall,
              border: Border.all(
                color: context.colorScheme.error,
                width: 2,
              ),
            ),
            child: SelectableText(
              message.isEmpty
                  ? 'Brak dodatkowych informacji'.hardcoded
                  : message,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.error,
              ),
            ),
          ),
        ),
        gapH24,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (onRetry != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: FilledButton(
                  onPressed: onRetry,
                  child: Text('Spróbuj ponownie'.hardcoded),
                ),
              ),
            if (onClose != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: FilledButton(
                  onPressed: onClose,
                  child: Text('Zamknij'.hardcoded),
                ),
              ),
          ],
        ),
        gapH24,
      ],
    );
  }
}
