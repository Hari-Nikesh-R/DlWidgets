import 'dart:collection';

import 'package:flutter/material.dart';


class DlCheckBox extends StatefulWidget {
  const DlCheckBox({super.key, required, required this.checkBoxOrientation, required this.dlCheckBoxImplList, this.checkBoxShape });
  final CheckBoxOrientation checkBoxOrientation;
  final List<DlCheckBoxImpl> dlCheckBoxImplList;
  final CheckBoxShape? checkBoxShape;

  @override
  State<DlCheckBox> createState() => _DlCheckBoxState();
}

class _DlCheckBoxState extends State<DlCheckBox> {
   final Map<String, bool> _values = HashMap();
   @override
  initState(){
     for(var index=0;index<widget.dlCheckBoxImplList.length;index++){
     _values[widget.dlCheckBoxImplList[index].checkBoxMessage] = widget.dlCheckBoxImplList[index].value;
     }
     super.initState();
   }

  List<Widget> getCheckBoxes(){
    List<Widget> list = [];
    for(var index=0;index<widget.dlCheckBoxImplList.length;index++) {
        list.add(Row(children: [Checkbox(
          onChanged: (value){
            setState(() {
              _values[widget.dlCheckBoxImplList[index].checkBoxMessage] = value??false;
              debugPrint(_values[widget.dlCheckBoxImplList[index].checkBoxMessage].toString());
            });
          },
          activeColor: widget.dlCheckBoxImplList[index].activeColor??Colors.blue,
          value: _values[widget.dlCheckBoxImplList[index].checkBoxMessage],
          splashRadius: 12,
          shape: widget.checkBoxShape == CheckBoxShape.round ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)): null,
        ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 2), child: Text(widget.dlCheckBoxImplList[index].checkBoxMessage, style: TextStyle(
              fontSize: widget.dlCheckBoxImplList[index].fontSize ?? 18,
              fontFamily: widget.dlCheckBoxImplList[index].fontFamily,
              color: widget.dlCheckBoxImplList[index].textColor ??
                  Colors.black)))
        ]));

    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(12), child: widget.checkBoxOrientation == CheckBoxOrientation.row ? Row(
      children: getCheckBoxes(),
    ):Column(
        children: getCheckBoxes(),
    ));
  }
}

class DlCheckBoxImpl{
    DlCheckBoxImpl({required this.value, required this.checkBoxMessage, this.activeColor, this.fontSize, this.fontFamily, this.textColor});
    final bool value;
    late double? fontSize;
    late String? fontFamily;
    final String checkBoxMessage;
    final Color? activeColor;
    late Color? textColor;

}

enum CheckBoxOrientation{
  row, column
}

enum CheckBoxShape{
  round, box
}