import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/ui/cubit/pick_file_cubit.dart';

class ButtonsSections extends StatelessWidget {
  const ButtonsSections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FilledButton.icon(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
          label: Text('Anuluj'.hardcoded),
        ),
        gapW12,
        BlocBuilder<PickFileCubit, PickFileState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => FilledButton.icon(
                icon: const Icon(Icons.save),
                onPressed: null,
                label: Text('Zapisz'.hardcoded),
              ),
              loaded: (files) {
                return FilledButton.icon(
                  icon: const Icon(Icons.save),
                  onPressed: () {
                    // Navigator.of(context).pop();
                  },
                  label: Text('Zapisz'.hardcoded),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
