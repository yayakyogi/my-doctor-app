import 'package:flutter/material.dart';
import 'package:my_doctor/theme.dart';

class ButtonLinkWidget extends StatefulWidget {
  const ButtonLinkWidget({
    super.key,
    required this.label,
    required this.onClick,
  });

  final String label;
  final Function() onClick;

  @override
  State<ButtonLinkWidget> createState() => _ButtonLinkWidgetState();
}

class _ButtonLinkWidgetState extends State<ButtonLinkWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onClick,
      child: Text(
        widget.label,
        style: const TextStyle(
          decoration: TextDecoration.underline,
          fontSize: 16,
          color: textSecondaryColor,
        ),
      ),
    );
  }
}
