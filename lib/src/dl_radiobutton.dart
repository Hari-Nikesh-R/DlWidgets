import 'package:flutter/material.dart';

/// Represents a custom radio button widget.
class DlRadioButton<T> extends StatefulWidget {
  /// Constructs a DlRadioButton widget.
  const DlRadioButton(
      {super.key,
      required this.dlRadioButtonImplList,
      required this.intention});

  /// Contains a list of DlRadioButtonImpl objects.
  final List<DlRadioButtonImpl> dlRadioButtonImplList;

  /// Specifies the intention of the radio buttons (row or column).
  final Intention intention;

  @override
  State<DlRadioButton> createState() => _DlRadioButtonState();
}

class _DlRadioButtonState extends State<DlRadioButton> {
  Color focussedColor = Colors.white;
  dynamic _value;

  /// Returns a list of radio button widgets.
  List<Widget> getRadioButtons() {
    List<Widget> list = [];
    for (var index = 0; index < widget.dlRadioButtonImplList.length; index++) {
      list.add(Flexible(
          child: Radio(
              value: widget.dlRadioButtonImplList[index].value,
              groupValue: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              })));
      list.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Text(
          widget.dlRadioButtonImplList[index].radioButtonMessage,
          style: TextStyle(
              fontSize: widget.dlRadioButtonImplList[index].fontSize ?? 18,
              fontFamily: widget.dlRadioButtonImplList[index].fontFamily,
              color: widget.dlRadioButtonImplList[index].textColor ??
                  Colors.black),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: widget.intention == Intention.row
            ? Row(children: getRadioButtons())
            : Column(
                children: getRadioButtons(),
              ));
  }
}
/// Represents the properties of a radio button.
class DlRadioButtonImpl<T> {
  /// Constructs a DlRadioButtonImpl object.
  DlRadioButtonImpl(
      {required this.value,
      this.textColor,
      required this.radioButtonMessage,
      this.fontFamily,
      this.fontSize});

  /// Specifies the value of the radio button.
  late T value;

  /// Specifies the color of the radio button's text.
  late Color? textColor;

  /// Specifies the message of the radio button.
  late String radioButtonMessage;

  /// Specifies the font size of the radio button's text.
  late double? fontSize;

  /// Specifies the font family of the radio button's text.
  late String? fontFamily;
}

/// Specifies the intention of the radio buttons (row or column).
enum Intention { row, column }
