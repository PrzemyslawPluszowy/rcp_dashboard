import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:go_router/go_router.dart';
import 'package:rcp_dashboard/main_export.dart';

class NavigationLayout extends StatelessWidget {
  const NavigationLayout({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SidebarPage(
        navigationShell: navigationShell,
      ),
    );
  }
}

class SidebarPage extends StatefulWidget {
  const SidebarPage({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  SidebarPageState createState() => SidebarPageState();
}

class SidebarPageState extends State<SidebarPage> {
  late List<CollapsibleItem> _items;

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        isSelected:
            widget.navigationShell.currentIndex == NavigationItem.home.index,
        text: 'Home'.hardcoded,
        icon: Icons.home,
        onPressed: () {
          widget.navigationShell.goBranch(NavigationItem.home.index);
        },
      ),
      CollapsibleItem(
        isSelected: widget.navigationShell.currentIndex ==
            NavigationItem.products.index,
        text: 'Products'.hardcoded,
        icon: Icons.production_quantity_limits,
        onPressed: () {
          widget.navigationShell.goBranch(NavigationItem.products.index);
        },
      ),
      CollapsibleItem(
        isSelected:
            widget.navigationShell.currentIndex == NavigationItem.orders.index,
        text: 'Orders'.hardcoded,
        icon: Icons.shopping_bag,
        onPressed: () {
          widget.navigationShell.goBranch(NavigationItem.orders.index);
        },
      ),
      CollapsibleItem(
        isSelected: widget.navigationShell.currentIndex ==
            NavigationItem.category.index,
        text: 'Category'.hardcoded,
        icon: Icons.category,
        onPressed: () {
          widget.navigationShell.goBranch(NavigationItem.category.index);
        },
      ),
      CollapsibleItem(
        isSelected:
            widget.navigationShell.currentIndex == NavigationItem.tags.index,
        text: 'Tags'.hardcoded,
        icon: Icons.label,
        onPressed: () {
          widget.navigationShell.goBranch(NavigationItem.tags.index);
        },
      ),
      CollapsibleItem(
        isSelected:
            widget.navigationShell.currentIndex == NavigationItem.users.index,
        text: 'Users'.hardcoded,
        icon: Icons.people,
        onPressed: () {
          widget.navigationShell.goBranch(NavigationItem.users.index);
        },
      ),
      CollapsibleItem(
        isSelected:
            widget.navigationShell.currentIndex == NavigationItem.gallery.index,
        text: 'Gallery'.hardcoded,
        icon: Icons.photo_library,
        onPressed: () {
          widget.navigationShell.goBranch(NavigationItem.gallery.index);
        },
      ),
      CollapsibleItem(
        isSelected: widget.navigationShell.currentIndex ==
            NavigationItem.statistics.index,
        text: 'Statistics'.hardcoded,
        icon: Icons.bar_chart,
        onPressed: () {
          widget.navigationShell.goBranch(NavigationItem.statistics.index);
        },
      ),
      CollapsibleItem(
        isSelected: widget.navigationShell.currentIndex ==
            NavigationItem.settings.index,
        text: 'Settings'.hardcoded,
        icon: Icons.settings,
        onPressed: () {
          widget.navigationShell.goBranch(NavigationItem.settings.index);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: CollapsibleSidebar(
        showToggleButton: false,
        isCollapsed: size.width <= 800,
        items: _items,
        collapseOnBodyTap: false,
        title: 'John Smith'.hardcoded,
        onTitleTap: () {
          // Można tutaj dodać akcję po kliknięciu w tytuł
        },
        body: _body(size, context, size.width <= 800),
        backgroundColor: context.colorScheme.surface,
        selectedTextColor: context.colorScheme.onPrimary,
        textStyle: context.textTheme.bodyLarge,
        titleStyle: context.textTheme.headlineSmall,
        toggleTitle: 'Zwiń'.hardcoded,
        toggleTitleStyle: context.textTheme.bodyLarge!
            .copyWith(color: context.colorScheme.onPrimary),
        sidebarBoxShadow: [
          BoxShadow(
            color: context.colorScheme.primaryContainer,
            blurRadius: 20,
            spreadRadius: 0.01,
            offset: const Offset(3, 3),
          ),
          BoxShadow(
            color: context.colorScheme.primaryContainer,
            blurRadius: 50,
            spreadRadius: 0.01,
            offset: const Offset(3, 3),
          ),
        ],
      ),
    );
  }

  Widget _body(Size size, BuildContext context, bool isCollapsed) {
    return Padding(
      padding: EdgeInsets.only(left: isCollapsed ? 0 : 190),
      child: widget.navigationShell,
    );
  }
}
