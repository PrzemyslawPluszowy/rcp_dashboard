import 'package:rcp_dashboard/main_export.dart';

class LoadMoreBtn extends StatelessWidget {
  const LoadMoreBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: FilledButton(
        onPressed: () {},
        child: Text('Load more'.hardcoded),
      ),
    );
  }
}
