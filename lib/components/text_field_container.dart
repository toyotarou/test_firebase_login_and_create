import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({super.key, required this.color, required this.borderColor, required this.child});

  final Color color;
  final Color borderColor;
  final Widget child;

  ///
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: size.width * 0.9,
        decoration: BoxDecoration(color: color, border: Border.all(color: borderColor)),
        child: child,
      ),
    );
  }
}
