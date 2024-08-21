import 'package:rcp_dashboard/main.dart';
import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/cubit/bath_delete_image_cubit.dart';

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
            onPressed: () {},
            child: Text('Add image'.hardcoded),
          ),
          const VerticalDivider(),
          BlocBuilder<BathDeleteImageCubit, BathDeleteImageState>(
            builder: (context, state) {
              logE.warning(state);
              return state.when(
                selectedToDelte: (selectedImages) {
                  return Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          context.read<BathDeleteImageCubit>().deleteImages();
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
          ),
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
}
