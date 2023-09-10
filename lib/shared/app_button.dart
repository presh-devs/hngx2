
import 'package:flutter/material.dart';
import 'package:hngx2/shared/constants.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    required this.title,
  });

  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
        Colors.grey[100],
      )),
      onPressed: onPressed,
      child:  Text(
        title,
        style: kButtonStyle,
      ),
    );
  }
}
