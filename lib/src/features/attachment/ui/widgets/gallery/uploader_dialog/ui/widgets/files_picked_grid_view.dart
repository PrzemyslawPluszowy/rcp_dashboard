import 'package:flutter_animate/flutter_animate.dart';
import 'package:rcp_dashboard/common/widgets/responsive.dart';
import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/widgets/gallery/uploader_dialog/ui/cubit/pick_file_cubit.dart';

class FilesPickedGridView extends StatelessWidget {
  const FilesPickedGridView({
    super.key,
  });

  int _getResponsiveGrid(BuildContext context) {
    switch (Responsive.getDeviceSize(context)) {
      case DeviceType.desktop:
        return 8;
      case DeviceType.tablet:
        return 4;
      case DeviceType.mobile:
        return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PickFileCubit, PickFileState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (files) {
            return Expanded(
              flex: 2,
              child: GridView.builder(
                padding: Ui.horizontalPadding,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _getResponsiveGrid(context),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                shrinkWrap: true,
                itemCount: files.length,
                itemBuilder: (context, index) {
                  final file = files[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: Ui.borderRadiusMedium,
                      image: DecorationImage(
                        image: MemoryImage(
                          file.bytes!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ).animate().fadeIn(
                        duration: Ui.durationMedium,
                      );
                },
              ),
            );
          },
          orElse: SizedBox.new,
        );
      },
    );
  }
}
