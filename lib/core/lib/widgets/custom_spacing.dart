import 'package:flutter/material.dart';
class VerticalSpace extends StatelessWidget {
  final double space;
  const VerticalSpace(this.space);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space,
    );
  }
}

class HorizontalSpace extends StatelessWidget {
  final double space;
  const HorizontalSpace(this.space);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space,
    );
  }
}