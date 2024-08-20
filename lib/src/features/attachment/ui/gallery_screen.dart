import 'package:flutter/material.dart';
import 'package:rcp_dashboard/utils/app_sizes.dart';
import 'package:rcp_dashboard/utils/extension/string_hc.dart';
import 'package:rcp_dashboard/utils/ui.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery Screen'.hardcoded),
      ),
      body: ListView(
        padding: Ui.horizontalPadding,
        children: const [
          gapH12,
          NavBarGallery(),
          gapH24,
          GalleryWidget(),
          gapH24,
          LoadMoreBtn(),
          gapH24,
        ],
      ),
    );
  }
}

class LoadMoreBtn extends StatelessWidget {
  const LoadMoreBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: FilledButton(
        onPressed: () {},
        child: Text('Load more'.hardcoded),
      ),
    );
  }
}

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.grey,
        );
      },
      itemCount: 120,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}

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
