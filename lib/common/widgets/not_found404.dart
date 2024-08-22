import 'package:rcp_dashboard/core/routes.dart';
import 'package:rcp_dashboard/main_export.dart';
import 'package:rive/rive.dart';

class NotFound404 extends StatelessWidget {
  const NotFound404({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '404 Page Not Found'.hardcoded,
              style: context.textTheme.headlineMedium,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 350,
                maxWidth: 350,
              ),
              child: const RiveAnimation.asset(
                'assets/rive/404_cat.riv',
              ),
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.goNamed(RouteName.home);
              },
              label: Text('Home'.hardcoded),
            ),
          ],
        ),
      ),
    );
  }
}
