import 'package:flutter/material.dart';

class DigitButton extends StatelessWidget {
  const DigitButton({super.key, required this.onClick, required this.digit});

  final void Function() onClick;
  final String digit;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        width: 55,
        height: 40,
        alignment: Alignment.center,
        child: Text(
          digit,
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
