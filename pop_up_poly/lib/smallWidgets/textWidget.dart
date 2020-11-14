import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../res/colorSchemes.dart';
import '../res/fonts.dart';
import '../res/strings.dart';

class TextWidget extends StatelessWidget {
  String text;
  String textStyle;
  String color;

  TextWidget(this.text, {this.textStyle, this.color});

  @override
  Widget build(BuildContext context) {
    return Consumer2<Fonts, ColorShemes>(
      builder: (_, fonts, colorSheme, __){
        return Center
              (
              child: Container(
                child: Text(
                  text,
                  overflow: TextOverflow.clip,
                  style: fonts.getStyle(textStyle == null ? 'normal' :textStyle, colorSheme.getTextColor(color)),
                ),
              ),
        );
      }
    );
  }
}

class ITextWidget extends StatelessWidget {
  String str_identifier;
  String textStyle;
  String color;

  ITextWidget(this.str_identifier, {this.color, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Consumer3<Fonts, ColorShemes, Strings>(
        builder: (_, fonts, colorSheme, strings, __){
          return Center
            (
            child: Container(
              child: Text(
                strings.get(str_identifier),
                overflow: TextOverflow.clip,
                style: fonts.getStyle(textStyle == null ? 'normal' :textStyle, colorSheme.getTextColor(color)),
              ),
            ),
          );
        }
    );
  }
}

