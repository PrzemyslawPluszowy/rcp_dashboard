import 'package:ionicons/ionicons.dart';
import 'package:rcp_dashboard/main_export.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({
    required this.err,
    super.key,
  });

  final String err;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 100,
        minHeight: 50,
      ),
      padding: Ui.paddingMedium,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: Ui.borderRadiusMedium,
      ),
      child: Row(
        children: [
          Icon(
            Ionicons.alert_circle,
            color: context.colorScheme.error,
          ),
          gapW16,
          Expanded(
            child: Text(
              err,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
