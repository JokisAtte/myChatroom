import 'package:flutter/material.dart';

class AppBreakpoints {
  static const double mobile = 600.0;

  AppBreakpoints._();
}

extension ResponsiveBreakpoints on BuildContext {
  /// Returns the current screen width.
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Returns the current screen height.
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Checks if the current screen width is considered a mobile size.
  bool get isMobile => screenWidth < AppBreakpoints.mobile;
}
