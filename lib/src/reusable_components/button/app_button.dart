import 'package:flutter/material.dart';

// button component that will be used in the application.
// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  // define the required parameters.
  final Color textColor;
  final String textLabel;
  final VoidCallback? onpressed;
  final Color backgroundColor;
  final IconData icon;
  double? buttonSize;

  AppButton({
    super.key,
    required this.textColor,
    required this.textLabel,
    this.onpressed,
    required this.backgroundColor,
    required this.icon,
    required this.buttonSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonSize,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        icon: Icon(icon),
        label: Text(textLabel),
        onPressed: () {
          onpressed;
        },
      ),
    );
  }
}
