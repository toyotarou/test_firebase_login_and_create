import 'package:flutter/material.dart';

import 'text_field_container.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    super.key,
    required this.keybordType,
    required this.onChanged,
    required this.controller,
    required this.color,
    required this.borderColor,
  });

  final TextInputType keybordType;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: color,
      borderColor: borderColor,
      child: TextFormField(keyboardType: keybordType, onChanged: onChanged, controller: controller),
    );
  }
}
