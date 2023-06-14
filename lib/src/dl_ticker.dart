import 'package:flutter/material.dart';

/// Represents a ticker widget to display information with an icon.
class DlTicker extends StatefulWidget {
  /// Constructs a DlTicker widget.
  const DlTicker({super.key, this.tickerType, required this.textInfo, this.customIcon});

  /// Specifies the type of the ticker (success, error, info, warning).
  final TickerType? tickerType;

  /// Specifies the text information to display in the ticker.
  final String textInfo;

  /// Specifies the custom icon to display in the ticker.
  final IconData? customIcon;

  @override
  State<DlTicker> createState() => _DlTickerState();
}

class _DlTickerState extends State<DlTicker> {

  Color textColor = Colors.black;
  IconData? customIcon;

  @override
  void initState() {
    customIcon = widget.customIcon;
    super.initState();
  }

  /// Determines the color of the ticker based on its type.
  Color tickerColor(){
    switch(widget.tickerType){
      case TickerType.success:
        customIcon = Icons.check;
        textColor = Colors.black;
        return Colors.greenAccent;
      case TickerType.error:
        customIcon = Icons.error;
        textColor = Colors.black;
        return Colors.redAccent;
      case TickerType.info:
        customIcon = Icons.info;
        textColor = Colors.black;
        return Colors.cyanAccent;
      case TickerType.warning:
        customIcon = Icons.warning;
        textColor = Colors.black;
        return Colors.yellow;
      default:
        customIcon = Icons.info;
        textColor = Colors.black;
        return Colors.cyanAccent;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 20,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: tickerColor(),
        child: Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
        child: Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.aspectRatio),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          Icon(customIcon),
          const SizedBox(width: 8),
          Text(
          widget.textInfo, style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
        )])),
    ));
  }
}

/// Represents the type of the ticker.
enum TickerType{
  info, success, warning, error
}