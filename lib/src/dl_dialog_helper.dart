import 'package:flutter/material.dart';

import '../dlwidgets.dart';

class AlertDialogHelper {
  AlertDialogHelper(this.context, this.dialogWidget);
  final DlAlertDialog dialogWidget;
  final BuildContext context;
  Future<dynamic>? showDialogPopUp() {
    return (dialogWidget.showDialogFlag??false) ? showDialog(context: context, builder: (context) => dialogWidget): null;
  }
}
