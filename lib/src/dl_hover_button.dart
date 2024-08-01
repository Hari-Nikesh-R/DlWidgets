import 'package:flutter/material.dart';

import '../dlwidgets.dart';

class DlHoverButton extends StatefulWidget {
  const DlHoverButton(
      {super.key,
      required this.hoverColor,
      required this.buttonName,
      required this.buttonColor,
      required this.buttonTextColor,
      required this.selectSize,
      required this.onPressed,
      this.hoverButtonTextColor,
      this.dlHoverButtonImpl});

  final Color hoverColor;
  final Color? hoverButtonTextColor;
  final String buttonName;
  final Color buttonColor;
  final Color buttonTextColor;
  final double Function(BuildContext) selectSize;
  final VoidCallback onPressed;
  final DlHoverButtonImpl? dlHoverButtonImpl;

  @override
  State<DlHoverButton> createState() => _DlHoverButtonState();
}

class _DlHoverButtonState extends State<DlHoverButton> {
  late Debounce _debouncer;

  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _debouncer =
        Debounce(debounceInMillis: 500); // Adjust debounce time as needed
  }

  void _handleOnPressed() {
    _debouncer.run(widget.onPressed);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: GestureDetector(
            onTap: widget.dlHoverButtonImpl?.disable ?? false
                ? null
                : _handleOnPressed,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: _isHovered ? widget.hoverColor : widget.buttonColor,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.selectSize(context),
                  vertical: 10,
                ),
                child: Text(
                  widget.buttonName,
                  style: TextStyle(
                      color: _isHovered
                          ? widget.hoverButtonTextColor ?? Colors.white
                          : widget.buttonTextColor),
                ),
              ),
            )));
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}

class DlHoverButtonImpl {
  DlHoverButtonImpl({this.disable});

  bool? disable = false;
}
