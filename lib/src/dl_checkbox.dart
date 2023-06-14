import 'dart:collection';
import 'package:flutter/material.dart';

///This documentation explains the purpose and functionality of each class, method, and property in the provided code. It provides information about the constructors, parameters, and return types, as well as the enums used for specifying checkbox orientation and shape.
//
// Note that the documentation assumes basic familiarity with the Dart programming language and the Flutter framework. If you have any specific questions about the code or need further clarification, feel free to ask!

/// Represents a custom checkbox widget.
class DlCheckBox extends StatefulWidget {

  /// Constructs a DlCheckBox widget.
  const DlCheckBox({super.key, required, required this.checkBoxOrientation, required this.dlCheckBoxImplList, this.checkBoxShape });

  /// Specifies the orientation of the checkboxes (row or column).
  final CheckBoxOrientation checkBoxOrientation;

  /// Contains a list of DlCheckBoxImpl objects.
  final List<DlCheckBoxImpl> dlCheckBoxImplList;

  /// Specifies the shape of the checkbox (round or box).
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

   /// Returns a list of checkbox widgets.
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

/// Represents the properties of a checkbox.
class DlCheckBoxImpl{
  /// Constructs a DlCheckBoxImpl object.
  DlCheckBoxImpl({required this.value, required this.checkBoxMessage, this.activeColor, this.fontSize, this.fontFamily, this.textColor});
  /// Specifies the value of the checkbox.
  final bool value;

  /// Specifies the font size of the checkbox's message.
  late double? fontSize;

  /// Specifies the font family of the checkbox's message.
  late String? fontFamily;

  /// Specifies the message of the checkbox.
  final String checkBoxMessage;

  /// Specifies the color of the checkbox when checked.
  final Color? activeColor;

  /// Specifies the text color of the checkbox
  late Color? textColor;

}
/// Specifies the orientation of the checkboxes (row or column).
enum CheckBoxOrientation{
  row, column
}

/// Specifies the shape of the checkboxes (round or box).
enum CheckBoxShape{
  round, box
}