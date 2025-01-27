import 'package:flutter/material.dart';

class DecoratedContainer extends StatelessWidget {
  final Widget widget;

  const DecoratedContainer({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(),
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}
