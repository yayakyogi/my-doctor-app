import 'package:flutter/material.dart';
import 'package:my_doctor/theme.dart';

class TextfieldWidget extends StatefulWidget {
  const TextfieldWidget({
    super.key,
    required this.label,
    required this.controller,
    required this.validator,
    this.type,
  });

  final String label;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final String? type;

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
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: widget.type == "email"
              ? TextInputType.emailAddress
              : widget.type == "password"
                  ? TextInputType.visiblePassword
                  : TextInputType.text,
          obscureText: widget.type == "password",
          decoration: InputDecoration(
            labelText: '',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: borderColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: dangerColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: dangerColor),
            ),
          ),
        ),
      ],
    );
  }
}
