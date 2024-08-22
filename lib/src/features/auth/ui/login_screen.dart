import 'dart:ui';

import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/auth/ui/widgets/content_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          transform: GradientRotation(2.35619),
          colors: [
            Color.fromARGB(255, 34, 34, 34),
            Color.fromARGB(255, 159, 160, 189),
          ],
        ),
      ),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 400,
                  ),
                  child: const LoginContent(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
