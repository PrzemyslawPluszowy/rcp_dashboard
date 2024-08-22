import 'package:flutter_animate/flutter_animate.dart';
import 'package:rcp_dashboard/common/helpers/validators.dart';
import 'package:rcp_dashboard/common/widgets/custom_btn_large.dart';
import 'package:rcp_dashboard/common/widgets/custom_glass_textfield.dart';
import 'package:rcp_dashboard/common/widgets/divider_text.dart';
import 'package:rcp_dashboard/core/gen/assets.gen.dart';
import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/auth/ui/cubit/login_cubit.dart';
import 'package:rcp_dashboard/src/features/auth/ui/widgets/error_login_container.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({
    super.key,
  });

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final constraintsHeight = BoxConstraints(
      maxHeight: size.height * 0.25,
      minHeight: size.height * 0.01,
    );

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(constraints: constraintsHeight),
          Image.asset(
            Assets.images.ifYouCanTFindPartsForYourRacecarWeCanDoIt2.path,
          ),
          gapH24,
          Text(
            context.l10n.signIn,
            style: context.textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(
                duration: Ui.durationShort,
                curve: Curves.easeIn,
              ),
          gapH16,
          CustomGlassTextField(
            autofillHints: const [
              AutofillHints.email,
            ],
            textInputAction: TextInputAction.next,
            validator: (query) => Validators.email(query, context),
            hintText: context.l10n.email,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
          ).animate().fadeIn(
                duration: Ui.durationMedium,
                curve: Curves.easeIn,
              ),
          gapH16,
          CustomGlassTextField(
            obscureText: true,
            autofillHints: const [
              AutofillHints.password,
            ],
            textInputAction: TextInputAction.done,
            controller: _passwordController,
            hintText: context.l10n.password,
            keyboardType: TextInputType.visiblePassword,
            validator: (query) => Validators.password(query, context),
          ).animate().fadeIn(
                duration: Ui.durationShort,
                curve: Curves.easeIn,
              ),
          gapH32,
          DividerText(
            color: Colors.white,
            text: context.l10n.or,
          ).animate().fadeIn(
                duration: Ui.durationMedium,
                curve: Curves.easeIn,
              ),
          gapH16,
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: SizedBox.new,
                error: (message) => Center(
                  child: ErrorLoginContainer(
                    message: message,
                  ).animate().fadeIn(
                        duration: Ui.durationMedium,
                        curve: Curves.easeIn,
                      ),
                ),
              );
            },
          ),
          gapH16,
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(174, 255, 255, 255),
                  ),
                ),
                orElse: () => CustomButtonLarge(
                  color: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<LoginCubit>().login(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                    }
                  },
                  width: double.infinity,
                  text: context.l10n.signIn,
                ),
              );
            },
          ).animate().fadeIn(
                duration: Ui.durationLong,
                curve: Curves.easeIn,
              ),
          gapH4,
        ],
      ),
    );
  }
}
