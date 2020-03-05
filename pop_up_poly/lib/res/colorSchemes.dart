import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> inBuildColorShemes = ['dark', 'light', 'lady'];

final Map<String, Color> lady = {
  'primary': Color(0xfff9858b),
  'secondary': Color(0xffed335f),
  'tertiary': Color(0xff761137),
  'primtext': Colors.black,
  'secondtext': Colors.white,
  'tertitext': Colors.white,
};
final Map<String, List<Color>> ladyGrad = {
  'primary': [Color(0xfff77278), Color(0xfff9858b), Color(0xfffcacb0), Colors.white], //white at the end
  'secondary': [Colors.white, Color(0xffed5377), Color(0xffed335f), Color(0xffe6194a)], //white at the start
  'tertiary': [Color(0xff75042e), Color(0xff761137), Color(0xff78354e), Color(0xff7a5261)],
};

final Map<String, Color> blueProfession = {
  'primary': Color(0xfff2bc94),
  'secondary': Color(0xff00145f),
  'tertiary': Color(0xfff4af1b),
  'primtext': Colors.black,
  'secondtext': Colors.white,
  'tertitext': Colors.black,
};
final Map<String, List<Color>> blueProfessionGrad = {
  'primary': [Color(0xffeb7c2a), Color(0xffed9b5f), Color(0xfff2bc94), Colors.white], //white at the end
  'secondary': [Colors.white, Color(0xff273363), Color(0xff152563), Color(0xff00145f)], //white at the start
  'tertiary': [Color(0xfff5a700), Color(0xfff4af1b), Color(0xfff5bb40), Color(0xfffad17a)],
};

final Map<String, Color> funky = {
  'primary': Color(0xff283350),
  'secondary': Color(0xfff93800),
  'tertiary': Color(0xffffb500),
  'primtext': Colors.white,
  'secondtext': Colors.white,
  'tertitext': Colors.black,
};
final Map<String, List<Color>> funkyGrad = {
  'primary': [Color(0xff283350), Color(0xff4f5975), Color(0xff707a94), Colors.white], //white at the end
  'secondary': [Colors.white, Color(0xfffa724b), Color(0xfff93800), Color(0xffab2802)], //white at the start
  'tertiary': [Color(0xffa17202), Color(0xffffb500), Color(0xffffc63d), Color(0xfffad989)],
};

final Map<String, Color> dark = {
  'primary': Color(0xff3b3a3a),
  'secondary': Color(0xff949494),
  'tertiary': Colors.black,
  'primtext': Colors.white,
  'secondtext': Colors.white,
  'tertitext': Colors.white,
};
final Map<String, List<Color>> darkGrad = {
  'primary': [Color(0xff3b3a3a),Color(0xff949494)],
  'secondary': [Color(0xff949494), Color(0xff3b3a3a)],
  'tertiary': [Color(0xff949494), Colors.black],
};

final Map<String, Color> light = {
  'primary': Colors.white,
  'secondary': Colors.black12,
  'tertiary': Colors.white,
  'primtext': Colors.black,
  'secondtext': Colors.black,
  'tertitext': Colors.black,
};
final Map<String, List<Color>> lightGrad = {
  'primary': [Color(0xffb0b0b0), Colors.white],
  'secondary': [Colors.white,Color(0xffb0b0b0)],
  'tertiary': [Colors.white,Colors.white,Colors.white],
};


class ColorShemes extends ChangeNotifier{
  List<Color> primaryGradient;
  List<Color> secondaryGradient;
  List<Color> tertiaryGradient;

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;

  Color primaryTextColor;
  Color secondaryTextColor;
  Color tertiaryTextColor;

  ColorShemes(){
    changeColor(lady, ladyGrad);
  }


  void changeColor(Map<String, Color> colors, Map<String, List<Color>> gradients) async {
    primaryColor = colors['primary'];
    secondaryColor = colors['secondary'];
    tertiaryColor = colors['tertiary'];

    primaryTextColor = colors['primtext'];
    secondaryTextColor = colors['secondtext'];
    tertiaryTextColor = colors['tertitext'];

    primaryGradient = gradients['primary'];
    secondaryGradient = gradients['secondary'];
    tertiaryGradient = gradients['tertiary'];

    notifyListeners();
  }

  Color getColor(String color){
    if (color == 'primary'){
      return primaryColor;
    }
    else if (color == 'secondary'){
      return secondaryColor;
    }
    else if (color == 'tertiary'){
      return tertiaryColor;
    }
    else{
      return primaryColor;
    }
  }

  Color getTextColor(String color){
    if (color == 'primary'){
      return primaryTextColor;
    }
    else if (color == 'secondary'){
      return secondaryTextColor;
    }
    else if (color == 'tertiary'){
      return tertiaryTextColor;
    }
    else {
      return primaryTextColor;
    }
  }

  List<Color> getGradient(String color){
    if (color == 'primary'){
      return primaryGradient;
    }
    else if (color == 'secondary'){
      return secondaryGradient;
    }
    else if (color == 'tertiary'){
      return tertiaryGradient;
    }
    else{
      return primaryGradient;
    }
  }

}