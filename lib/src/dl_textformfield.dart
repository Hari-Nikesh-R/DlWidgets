import 'package:flutter/material.dart';

class DlTextFormField extends StatelessWidget {
  const DlTextFormField({super.key, this.activeColor, this.trailingIcon, required this.hintText});
  final Color? activeColor;
  final Widget? trailingIcon;
  final String hintText;

  //Under constuction
  InputBorder? getOutlineBorder(Color borderColor){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
    color: borderColor
    ));
  }


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        border: getOutlineBorder(activeColor??Colors.blue),
          errorBorder: getOutlineBorder(Colors.red),
          enabledBorder: getOutlineBorder(activeColor??Colors.blue),
        icon: trailingIcon
        ),
    );
  }
}
