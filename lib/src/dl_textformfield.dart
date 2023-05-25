import 'package:flutter/material.dart';

class DlTextFormField extends StatefulWidget {
  const DlTextFormField({super.key, this.activeColor, this.trailingIcon, this.isPassword, this.onChanged, required this.textFieldController, this.labelText});
  final Color? activeColor;
  final Widget? trailingIcon;
  final bool? isPassword;
  final TextEditingController textFieldController;
  final ValueChanged<String>? onChanged;
  final String? labelText;

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
    return TextFormField(
      controller: widget.textFieldController,
      obscureText:isObscured,
      maxLines: 1,
      onChanged: widget.onChanged,
      autocorrect: widget.isPassword??false,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          suffixIcon: widget.isPassword??false ? passwordIcon() : null,
          border: getOutlineBorder(widget.activeColor??Colors.blue),
          errorBorder: getOutlineBorder(Colors.red),
          enabledBorder: getOutlineBorder(widget.activeColor??Colors.blue),
          icon: widget.trailingIcon,
          labelText: widget.labelText
      ),
    );
  }
}

