import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/ui/cubit/pick_file_cubit.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/ui/cubit/upload_cubit.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/ui/widgets/buttons_sections.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/ui/widgets/error_upload.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/ui/widgets/files_picked_grid_view.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/ui/widgets/pick_button.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/ui/widgets/uploaded_done.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/ui/widgets/uploading_progress.dart';

class UploaderDialog extends StatefulWidget {
  const UploaderDialog({super.key});

  @override
  State<UploaderDialog> createState() => _UploaderDialogState();
}

class _UploaderDialogState extends State<UploaderDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => context.pop(),
            ),
            title: Text('Dodaj obrazy'.hardcoded),
          ),
          body: BlocBuilder<UploadCubit, UploadState>(
            builder: (context, state) {
              return state.maybeWhen(
                uploading: (totalParts, currentPart) {
                  return UploadingProgress(
                    currentPart: currentPart,
                    totalParts: totalParts,
                  );
                },
                uploaded: () {
                  return const UploadedDone();
                },
                error: (message) {
                  return ErrorUpload(
                    message: message,
                  );
                },
                orElse: () => Column(
                  children: [
                    gapH24,
                    Expanded(
                      child: Align(
                        child: GestureDetector(
                          onTap: () async {
                            await context.read<PickFileCubit>().pickImage();
                          },
                          child: const PickButton(),
                        ),
                      ),
                    ),
                    gapH24,
                    const FilesPickedGridView(),
                    gapH12,
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: Ui.horizontalPadding,
                        child: ButtonsSections(),
                      ),
                    ),
                    gapH12,
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
