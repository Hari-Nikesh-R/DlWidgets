import 'package:flutter/material.dart';

class DlWindowManger {
  const DlWindowManger(this.screenContext);
  final BuildContext screenContext;
  adjustWindowWidth() {
    double width = MediaQuery.of(screenContext).size.width;
    if (width <= 400) {
      return width/2;
    }
    else if (width <= 600) {
      return width/4;
    }
    else if(width < 1000) {
      return width/6;
    }
  }

  adjustWindowHeight() {
    double height = MediaQuery.of(screenContext).size.height;
    if (height <= 400) {

    }
    else if (height <= 600) {

    }
    else if(height < 1000) {

    }
  }

}