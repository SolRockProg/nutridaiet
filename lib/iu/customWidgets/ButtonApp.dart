import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final String text;
  final Icon icon;
  final Function() onPressed;

  const ButtonApp(
      {Key? key,
      required this.text,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            primary: const Color(0xFF976f4f),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onPressed,
        icon: icon,
        label: Text(text));
  }
}
