import 'package:flutter/material.dart';

class DlAlertDialog extends StatefulWidget {
  const DlAlertDialog({super.key, this.showDialogFlag, required this.dlAlertDialogImpl});
  final bool? showDialogFlag;
  final DlAlertDialogImpl dlAlertDialogImpl;

  @override
  State<DlAlertDialog> createState() => _DlAlertDialogState();
}

class _DlAlertDialogState extends State<DlAlertDialog> {
  OutlinedBorder getDialogBasedOnShapes(){
    switch(widget.dlAlertDialogImpl.shape??DialogShape.roundedRectangleBorder){
      case DialogShape.circleBorder:
        return const CircleBorder();
      case DialogShape.roundedRectangleBorder:
        return const RoundedRectangleBorder();
      case DialogShape.curved:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(12), child: AlertDialog(
      title: widget.dlAlertDialogImpl.title,
      content: Padding(padding: const EdgeInsets.all(18), child: widget.dlAlertDialogImpl.content),
      actions: [
        widget.dlAlertDialogImpl.positiveAction,
        widget.dlAlertDialogImpl.negativeAction
      ],
      shape: getDialogBasedOnShapes(),
        backgroundColor: widget.dlAlertDialogImpl.backgroundColor??const Color(0xFF757575),
      elevation: 12,
      alignment: Alignment.center,
      buttonPadding: const EdgeInsets.all(8),
      icon: widget.dlAlertDialogImpl.customIcon,
      contentPadding: const EdgeInsets.all(4),
      shadowColor: Colors.grey,
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
    ));
  }
}

enum DialogShape{
  circleBorder, roundedRectangleBorder, curved
}

class DlAlertDialogImpl{
  DlAlertDialogImpl({required this.title, this.content, required this.positiveAction, required this.negativeAction, this.shape, this.backgroundColor, this.customIcon});
  final Widget title;
  final Widget? content;
  final Widget positiveAction;
  final Widget negativeAction;
  final DialogShape? shape;
  final Color? backgroundColor;
  final Widget? customIcon;
}
