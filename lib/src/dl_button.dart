import 'package:flutter/material.dart';

/// Represents a custom button widget.
@immutable
class DlButton extends StatelessWidget {
  /// Constructs a DlButton widget.
  const DlButton(
      {super.key, required this.buttonName, required this.size, required this.buttonColor, required this.onPressed});

  /// Specifies the name of the button.
  final String buttonName;

  /// Specifies the size of the button (large, medium, small).
  final ButtonSize? size;

  /// Specifies the background color of the button.
  final Color buttonColor;

  /// Specifies the callback function to be executed when the button is pressed.
  final VoidCallback onPressed;

  /// Determines the size of the button based on the specified size and the device's width.
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

/// Specifies the size options for the DlButton widget.
enum ButtonSize{
  large, medium, small
}
