import 'package:rcp_dashboard/main_export.dart';

class ErrorLoginContainer extends StatelessWidget {
  const ErrorLoginContainer({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Ui.marginSmall,
      margin: Ui.marginLarge,
      decoration: BoxDecoration(
        borderRadius: Ui.borderRadiusSmall,
        border: Border.all(
          color: const Color.fromARGB(255, 0, 255, 213),
        ),
      ),
      child: Text(
        '$message !!!',
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 255, 213),
        ),
      ),
    );
  }
}

// Logowanie social
//   Row _socialBtn(
//     BuildContext context, {
//     required String text,
//     required IconData icon,
//   }) {
//     return Row(
//       children: [
//         CircleAvatar(
//           backgroundColor: context.colorScheme.onPrimary,
//           child: Icon(
//             icon,
//             color: const Color.fromARGB(255, 65, 81, 203),
//           ),
//         ),
//         gapW16,
//         Text(
//           text,
//           style: context.textTheme.bodyLarge?.copyWith(
//             color: context.colorScheme.onPrimary,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }
// }
