import 'package:rcp_dashboard/main_export.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.2,
          vertical: MediaQuery.sizeOf(context).width * 0.05,
        ),
        constraints: const BoxConstraints(
          minWidth: 180,
          maxHeight: 70,
          maxWidth: 200,
        ),
        decoration: BoxDecoration(
          borderRadius: Ui.borderRadiusSmall,
          border: Border.all(
            color: context.colorScheme.primary,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            'Kliknij w ikone aby rozpocząć dodawania'.hardcoded,
            style: context.textTheme.bodyLarge
                ?.copyWith(color: context.colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
