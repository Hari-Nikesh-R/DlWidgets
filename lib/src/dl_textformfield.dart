import 'package:flutter/material.dart';

/// Represents a custom text form field widget.
class DlTextFormField extends StatefulWidget {
  /// Constructs a DlTextFormField widget.
  const DlTextFormField({super.key, this.activeColor, this.trailingIcon, this.isPassword, this.isCenter, required this.input});

  /// Specifies the active color of the text form field.
  final Color? activeColor;

  /// Specifies the trailing icon widget for the text form field.
  final Widget? trailingIcon;

  /// Specifies whether the text form field is a password field.
  final bool? isPassword;

  /// Specifies whether the text form field should be centered.
  final bool? isCenter;

  /// Specifies the configuration for the text form field.
  final DlTextFormFieldImpl input;

  @override
  State<DlTextFormField> createState() => _DlTextFormFieldState();
}

class _DlTextFormFieldState extends State<DlTextFormField> {

  bool isObscured = false;

  @override
  void initState() {
    isObscured = widget.isPassword??false;
    super.initState();
  }

  InputBorder? getOutlineBorder(Color borderColor){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
            color: borderColor
        ));
  }

  Widget? passwordIcon(){
    return IconButton(icon: !isObscured ? const Icon(Icons.visibility, color: Colors.black) :
    const Icon(Icons.visibility_off, color: Colors.black,),
        onPressed: (){
          setState(() {
            isObscured = !isObscured;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: widget.isCenter??false ? EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/3.5) : EdgeInsets.zero, child: Padding(padding: EdgeInsets.all(12), child: TextFormField(
      controller: widget.input.textFieldController,
      obscureText:isObscured,
      maxLines: 1,
      onChanged: widget.input.onChanged,
      autocorrect: widget.isPassword??false,
      decoration: InputDecoration(
        errorText: widget.input.errorText,
          fillColor: Colors.white,
          filled: true,
          suffixIcon: widget.isPassword??false ? passwordIcon() : widget.trailingIcon,
          border: getOutlineBorder(widget.activeColor??Colors.blue),
          errorBorder: getOutlineBorder(Colors.red),
          enabledBorder: getOutlineBorder(widget.activeColor??Colors.blue),
          labelText: widget.input.labelText
      ),
    )));
  }
}

/// Represents the configuration for a DlTextFormField widget.
class DlTextFormFieldImpl{
  /// Constructs a DlTextFormFieldImpl object.
  DlTextFormFieldImpl(this.textFieldController, this.onChanged, this.errorText, this.labelText);

  /// Specifies the text field controller for the text form field.
  TextEditingController textFieldController;

  /// Specifies the callback function to invoke when the value of the text form field changes.
  ValueChanged<String>? onChanged;

  /// Specifies the label text for the text form field.
  String? labelText;

  /// Specifies the error text to display for the text form field.
  String? errorText;

}

