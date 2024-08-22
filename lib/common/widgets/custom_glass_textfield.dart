import 'package:ionicons/ionicons.dart';
import 'package:rcp_dashboard/main_export.dart';

class CustomGlassTextField extends StatelessWidget {
  CustomGlassTextField({
    super.key,
    this.validator,
    this.hintText,
    this.keyboardType,
    this.controller,
    this.textInputAction,
    this.autofillHints,
    this.obscureText = false,
  });

  final String? Function(String?)? validator;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final bool obscureText;
  final ValueNotifier<bool> showObscure = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: showObscure,
      builder: (context, obscure, child) => TextFormField(
        textInputAction: textInputAction,
        controller: controller,
        autofillHints: autofillHints,
        style: context.textTheme.bodyLarge?.copyWith(
          color: Colors.grey[700],
        ),
        validator: validator,
        cursorColor: Colors.grey[700],
        keyboardType: keyboardType,
        obscureText: obscureText ? showObscure.value : showObscure.value,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            color: context.colorScheme.error,
          ),
          hintText: hintText,
          hintStyle: context.textTheme.bodyLarge?.copyWith(
            color: Colors.grey[700],
          ),
          border: OutlineInputBorder(
            borderRadius: Ui.borderRadiusMedium,
            borderSide: BorderSide.none,
          ),
          suffixIcon: obscureText
              ? IconButton(
                  onPressed: () {
                    showObscure.value = !showObscure.value;
                  },
                  icon: Icon(
                    obscure ? Ionicons.eye_off : Ionicons.eye,
                    color: Colors.grey[700],
                  ),
                )
              : null,
          filled: true,
          contentPadding: Ui.paddingLarge,
        ),
      ),
    );
  }
}
