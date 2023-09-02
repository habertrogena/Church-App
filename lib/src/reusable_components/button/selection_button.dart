import 'package:flutter/material.dart';

// this is a button component that will be used in the selection page.
// ignore: must_be_immutable
class SelectionButton extends StatelessWidget {
  // selection button component.
  // add the required parameters.
  final Color textColor;
  final String textLabel;
  VoidCallback onpressed;
  final Color backgroundColor;
  final Icon icon;

  SelectionButton({
    super.key,
    required this.textColor,
    required this.textLabel,
    required this.onpressed,
    required this.backgroundColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        icon: icon,
        label: Text(textLabel),
        onPressed: onpressed);
  }
}
