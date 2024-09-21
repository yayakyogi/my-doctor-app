import 'package:flutter/material.dart';
import 'package:my_doctor/theme.dart';

class TextfieldWidget extends StatefulWidget {
  const TextfieldWidget({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: const TextStyle(color: textSecondaryColor)),
        const SizedBox(height: 5),
        TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            labelText: '',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
