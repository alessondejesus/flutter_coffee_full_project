import 'package:flutter/material.dart';

class RemoveBehaviorUtil extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
