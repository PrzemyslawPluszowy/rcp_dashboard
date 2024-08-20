import 'package:rcp_dashboard/main_export.dart';

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
          DropdownButton(
            value: 'all',
            items: [
              DropdownMenuItem(
                value: 'all',
                child: Text('All'.hardcoded),
              ),
              DropdownMenuItem(
                value: 'category1',
                child: Text('Category 1'.hardcoded),
              ),
              DropdownMenuItem(
                value: 'category2',
                child: Text('Category 2'.hardcoded),
              ),
            ],
            onChanged: (value) {},
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
