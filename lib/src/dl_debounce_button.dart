import 'dart:async';

import 'package:flutter/material.dart';

class DlDebounceButton extends StatefulWidget {
  const DlDebounceButton({
    super.key,
    required this.buttonName,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.selectSize,
    required this.onPressed,
  });

  final String buttonName;
  final Color buttonColor;
  final Color buttonTextColor;
  final double Function(BuildContext) selectSize;
  final VoidCallback onPressed;

  @override
  State<DlDebounceButton> createState() => _DlDebounceButtonState();
}

class _DlDebounceButtonState extends State<DlDebounceButton> {
  late DlDebounceButtonImpl _debouncer;

  @override
  void initState() {
    super.initState();
    _debouncer = DlDebounceButtonImpl(
        debounceInMillis: 500); // Adjust debounce time as needed
  }

  void _handleOnPressed() {
    _debouncer.run(widget.onPressed);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _handleOnPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.buttonColor,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widget.selectSize(context),
          vertical: 10,
        ),
        child: Text(
          widget.buttonName,
          style: TextStyle(
            color: widget.buttonTextColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}

class DlDebounceButtonImpl {
  DlDebounceButtonImpl({this.debounceInMillis});

  Timer? _timer;
  int? debounceInMillis;

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: debounceInMillis ?? 1000), action);
  }

  void cancel() {
    _timer?.cancel();
  }
}
