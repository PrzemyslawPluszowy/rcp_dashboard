// Definicja enum
import 'package:rcp_dashboard/main_export.dart';

enum DeviceType {
  mobile,
  tablet,
  desktop,
}

class Responsive extends StatelessWidget {
  const Responsive({
    required this.mobile,
    this.tablet,
    this.desktop,
    super.key,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 700;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 700 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  static DeviceType getDeviceSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 1200) {
      return DeviceType.desktop;
    } else if (width >= 700 && width < 1200) {
      return DeviceType.tablet;
    } else {
      return DeviceType.mobile;
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = getDeviceSize(context);

    switch (deviceType) {
      case DeviceType.desktop:
        return desktop ?? mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.mobile:
        return mobile;
    }
  }
}
