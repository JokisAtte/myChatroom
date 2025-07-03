import 'package:flutter/material.dart';
import 'package:my_chatroom/core/constants/breakpoints.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (context.screenWidth < AppBreakpoints.mobile) {
          return mobile;
        } else {
          return desktop;
        }
      },
    );
  }
}
