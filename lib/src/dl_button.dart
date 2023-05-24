import 'package:flutter/material.dart';

@immutable
class DlButton extends StatelessWidget {
   const DlButton(
      {super.key, required this.buttonName, required this.size, required this.buttonColor, required this.onPressed});

  final String buttonName;
  final ButtonSize? size;
  final Color buttonColor;
  final VoidCallback onPressed;

  double selectSize(BuildContext context) {
    if (size == ButtonSize.small) {
      return MediaQuery
          .of(context)
          .size
          .width / 20;
    }
    else if (size == ButtonSize.medium) {
      return MediaQuery
          .of(context)
          .size
          .width / 14;
    }
    else if (size == ButtonSize.large) {
      return MediaQuery
          .of(context)
          .size
          .width / 8;
    }
    return MediaQuery
        .of(context)
        .size
        .width / 9;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor, elevation: 8, shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      )// Background color
      ),
      child: Padding(padding: EdgeInsets.symmetric(
          horizontal: selectSize(context), vertical: 10),
          child: Text(buttonName, style:
          const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ))
      ),
    );
  }
}

enum ButtonSize{
  large, medium, small
}
