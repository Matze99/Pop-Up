import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pop_up_poly/smallWidgets/textWidget.dart';
import 'package:provider/provider.dart';

import '../../smallWidgets/randomOffsetCard.dart';
import '../../res/strings.dart';
import '../../res/colorSchemes.dart';

class ColorShemeSelector extends StatefulWidget {
  double width;
  double height;
  bool showSelection = false;

  ColorShemeSelector({this.height, this.width});

  @override
  _ColorShemeSelectorState createState() => _ColorShemeSelectorState();
}

class ColorShemeSelection extends StatelessWidget {
  double width;
  double height;
  int colorShemeName;

  ColorShemeSelection(this.colorShemeName, {this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorShemes>(
      builder: (_, colorSheme, __){
        return RandomOffsetCard(
          color: 'primary',
          width: width * 0.8,
          height: height*0.1,
          child: GestureDetector(
            onTap: (){
              colorSheme.changeColor(colorShemeName);
            },
            child: ITextWidget(
              colorSheme.colorShemeNames[colorShemeName],
              color: 'primary',
            ),
          ),
        );
      },
    );
  }
}


class _ColorShemeSelectorState extends State<ColorShemeSelector> {


  List<Widget> buildLanguageList(ColorShemes colorScheme, double width, double height){
    List<String> colorShemeNames = colorScheme.getColorShemes();
    List<Widget> selections = List(colorShemeNames.length-1);
    int j = 0;
    for (int i = 0; i < colorShemeNames.length; i ++){
      if (colorScheme.currentColorSheme == i){

      }
      else {
        selections[j] = ColorShemeSelection(i, width: width,height: height,);
        j += 1;
      }
    }
    return selections;
  }


  @override
  Widget build(BuildContext context) {
    return Consumer2<Strings, ColorShemes>(
      builder: (_, strings, colorSheme, __){
        return RandomOffsetCard(
          color: 'tertiary',
          width: widget.width,
          height: widget.height*0.12 *(widget.showSelection? 1+colorSheme.getColorShemes().length: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  setState(() {
                    widget.showSelection = !widget.showSelection;
                  });
                },
                child: ITextWidget(
                  'changecolorsheme',
                  color: 'tertiary',
                ),
              ),
              widget.showSelection ? Container(
                padding: EdgeInsets.only(
                    left: 10
                ),

                child: Column(
                  children: buildLanguageList(colorSheme, widget.width, widget.height),
                ),
              ) :Container(),
            ],
          ),
        );
      },
    );
  }
}
