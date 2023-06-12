import 'package:flutter/material.dart';

class DlRadioButton<T> extends StatefulWidget {
  const DlRadioButton(
      {super.key, required this.dlRadioButtonImplList, required this.intention});
  final List<DlRadioButtonImpl> dlRadioButtonImplList;
  final Intention intention;
  @override
  State<DlRadioButton> createState() => _DlRadioButtonState();
}

class _DlRadioButtonState extends State<DlRadioButton> {
  Color focussedColor = Colors.white;
  dynamic _value;

  List<Widget> getRadioButtons(){
    List<Widget> list = [];
    for(var index = 0;index < widget.dlRadioButtonImplList.length;index++) {
      list.add(
          Flexible(
              child: Radio(
              value: widget.dlRadioButtonImplList[index].value,
              groupValue: _value,
              onChanged: (value) {
                setState(() {
                    _value = value;
                });
              })));
      list.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              widget.dlRadioButtonImplList[index].radioButtonMessage,
              style: TextStyle(
                  fontSize: widget.dlRadioButtonImplList[index].fontSize ?? 18,
                  fontFamily: widget.dlRadioButtonImplList[index].fontFamily,
                  color: widget.dlRadioButtonImplList[index].textColor ?? Colors.black),
            ),
          )
      );

    }
    return list;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: widget.intention == Intention.row ? Row(children: getRadioButtons()) : Column(
          children: getRadioButtons(),
        ));
  }
}

class DlRadioButtonImpl<T>{
  DlRadioButtonImpl({required this.value, this.textColor, required this.radioButtonMessage, this.fontFamily, this.fontSize});
  late T value;
   late Color? textColor;
   late String radioButtonMessage;
   late double? fontSize;
   late String? fontFamily;
}

enum Intention{
  row, column
}
