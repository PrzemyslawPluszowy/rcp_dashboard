import 'package:rcp_dashboard/common/widgets/not_found404.dart';
import 'package:rcp_dashboard/core/routes.dart';
import 'package:rcp_dashboard/core/routing_transition.dart';
import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/attachment/ui/gallery_screen.dart';
import 'package:rcp_dashboard/src/features/auth/data/auth_service.dart';
import 'package:rcp_dashboard/src/features/auth/ui/login_screen.dart';
import 'package:rcp_dashboard/src/features/navigations/ui/navigation_sidebar.dart';
import 'package:rcp_dashboard/src/features/setting/settings_screen.dart';

enum NavigationItem {
  home,
  products,
  orders,
  category,
  tags,
  users,
  gallery,
  statistics,
  settings,
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/',
  errorBuilder: (context, state) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      router.goNamed(RouteName.notFound);
    });
    return const SizedBox.shrink();
  },
  redirect: (context, state) async {
    final authStatus = AuthService.authStatusStream.value;
    if (authStatus == AuthStatus.authenticated) {
      if (state.uri == Uri.parse('/')) {
        return RouteName.home;
      } else {
        return null;
      }
    } else {
      return RouteName.login;
    }
  },
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: RouteName.login,
      pageBuilder: (context, state) => RoutingTransition.fadeTransition(
        const LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/404',
      name: RouteName.notFound,
      builder: (context, state) {
        return const NotFound404();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationLayout(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              name: RouteName.home,
              pageBuilder: (context, state) => RoutingTransition.fadeTransition(
                Container(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/products',
              name: RouteName.products,
              pageBuilder: (context, state) => RoutingTransition.fadeTransition(
                Container(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/orders',
              name: RouteName.orders,
              pageBuilder: (context, state) => RoutingTransition.fadeTransition(
                Container(
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/category',
              name: RouteName.category,
              pageBuilder: (context, state) => RoutingTransition.fadeTransition(
                Container(
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/tags',
              name: RouteName.tags,
              pageBuilder: (context, state) => RoutingTransition.fadeTransition(
                Container(
                  color: Colors.yellow,
                ),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/users',
              name: RouteName.users,
              pageBuilder: (context, state) => RoutingTransition.fadeTransition(
                Container(
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/gallery',
              name: RouteName.gallery,
              pageBuilder: (context, state) => RoutingTransition.fadeTransition(
                const GalleryScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/statistics',
              name: RouteName.statistics,
              pageBuilder: (context, state) => RoutingTransition.fadeTransition(
                Container(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/setting',
              name: RouteName.setting,
              pageBuilder: (context, state) => RoutingTransition.fadeTransition(
                const SettingScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
