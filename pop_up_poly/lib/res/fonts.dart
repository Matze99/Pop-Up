import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'storage.dart';

class Fonts extends ChangeNotifier{
  /**
   * for storing dirrerent font styles and the font size
   *
   * the color is not stored here
   */
  double fontSize = 30;

  TextStyle normal(Color color) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle title1(Color color) {
    return TextStyle(
      fontSize: fontSize*1.5,
      color: color,
    );
  }

  TextStyle drawerTitle(Color color){
    return TextStyle(
      fontSize: fontSize*0.65,
      color: color,
      fontWeight: FontWeight.w300,
    );
  }

  TextStyle drawerChildText(Color color){
    return TextStyle(
      fontSize: fontSize *0.6,
      color: color,
      fontWeight: FontWeight.w300,
    );
  }

  TextStyle smaller(Color color){
    return TextStyle(
      fontSize: fontSize *0.75,
      color: color,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle lager(Color color){
    return TextStyle(
      fontSize: fontSize *1.25,
      color: color,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle getStyle(String identifier, Color color){
    if (identifier == 'normal'){
      return normal(color);
    }
    else if (identifier == 'title1'){
      return title1(color);
    }
    else if (identifier == 'drawerTitle'){
      return drawerTitle(color);
    }
    else if (identifier == 'drawerChildText'){
      return drawerChildText(color);
    }
    else if (identifier == 'smaller'){
      return smaller(color);
    }
    else if (identifier == 'larger'){
      return lager(color);
    }
  }

  void changeFontSize(double newFontSize){
    fontSize = newFontSize;
    notifyListeners();
  }
}