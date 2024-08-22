import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/ui/cubit/pick_file_cubit.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/ui/cubit/upload_cubit.dart';

class ErrorUpload extends StatelessWidget {
  const ErrorUpload({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        gapH24,
        const Icon(
          Icons.error,
          color: Colors.red,
          size: Sizes.p64,
        ),
        gapH8,
        Text(
          'Wystąpił błąd podczas przesyłania obrazów'.hardcoded,
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
              message,
            ),
          ),
        ),
        gapH24,
        FilledButton(
          onPressed: () {
            context.read<UploadCubit>().reset();
            context.read<PickFileCubit>().resetState();
            context.pop();
          },
          child: Text('Zamknij modal'.hardcoded),
        ),
        gapH24,
      ],
    );
  }
}
