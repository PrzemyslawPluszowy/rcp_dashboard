import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/ui/cubit/pick_file_cubit.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/ui/cubit/upload_cubit.dart';

class UploadedDone extends StatelessWidget {
  const UploadedDone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        gapH24,
        const Expanded(
          child: Icon(
            Icons.check_circle,
            color: Colors.green,
            size: Sizes.p64,
          ),
        ),
        Expanded(
          child: Align(
            child: Text('Obrazy zostały dodane'.hardcoded),
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
