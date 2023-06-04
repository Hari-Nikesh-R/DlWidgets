import 'package:flutter/material.dart';

class DlTextFormField extends StatefulWidget {
  const DlTextFormField({super.key, this.activeColor, this.trailingIcon, this.isPassword, this.isCenter, required this.input});
  final Color? activeColor;
  final Widget? trailingIcon;
  final bool? isPassword;
  final bool? isCenter;
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

class DlTextFormFieldImpl{
  DlTextFormFieldImpl(this.textFieldController, this.onChanged, this.errorText, this.labelText);
   TextEditingController textFieldController;
   ValueChanged<String>? onChanged;
   String? labelText;
   String? errorText;

}

