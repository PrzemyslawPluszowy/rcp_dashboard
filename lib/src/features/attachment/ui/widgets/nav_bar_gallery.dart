import 'package:rcp_dashboard/main.dart';
import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/cubit/batch_delete_image_cubit.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/ui/cubit/pick_file_cubit.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/ui/cubit/upload_cubit.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/ui/uploader_dialog.dart';

class NavBarGallery extends StatelessWidget {
  const NavBarGallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Ui.horizontalPadding,
      height: Sizes.p64,
      decoration: Ui.boxDecoration(context),
      child: Row(
        children: [
          gapW12,
          TextButton(
            onPressed: () {
              showAdaptiveDialog<BuildContext>(
                context: context,
                builder: (_) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (_) =>
                            PickFileCubit(uploadService: getIt.call()),
                      ),
                      BlocProvider(
                        create: (_) => UploadCubit(
                          uploadAttachmentRepository: getIt.call(),
                          uploadService: getIt.call(),
                        ),
                      ),
                    ],
                    child: const UploaderDialog(),
                  );
                },
              );
            },
            child: Text('Add image'.hardcoded),
          ),
          const VerticalDivider(),
          _batchRemoveIMages(),
          const Spacer(),
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search'.hardcoded,
                border: InputBorder.none,
              ),
            ),
          ),
          gapW12,
        ],
      ),
    );
  }

  BlocBuilder<BatchDeleteImageCubit, BatchDeleteImageState>
      _batchRemoveIMages() {
    return BlocBuilder<BatchDeleteImageCubit, BatchDeleteImageState>(
      builder: (context, state) {
        logE.warning(state);
        return state.when(
          selectedToDelte: (selectedImages) {
            return Row(
              children: [
                TextButton(
                  onPressed: () {
                    context.read<BatchDeleteImageCubit>().deleteImages();
                  },
                  child: Text(
                    'Delete'.hardcoded,
                    style: TextStyle(
                      color: context.colorScheme.error,
                    ),
                  ),
                ),
                const VerticalDivider(),
              ],
            );
          },
          initial: () => const SizedBox(),
          deleting: () => const CircularProgressIndicator.adaptive(),
          error: (message) {
            return Text(
              message,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.error,
              ),
            );
          },
        );
      },
    );
  }
}
