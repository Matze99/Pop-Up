import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pop_up_poly/smallWidgets/textWidget.dart';
import 'package:provider/provider.dart';

import '../../smallWidgets/randomOffsetCard.dart';
import '../../res/strings.dart';

class LanguageSelector extends StatefulWidget {
  double width;
  double height;
  bool showSelection = false;

  LanguageSelector({this.height, this.width});

  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class LanguageSelection extends StatelessWidget {
  double width;
  double height;
  String language;

  LanguageSelection(this.language, {this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Consumer<Strings>(
      builder: (_, strings, __){
        return RandomOffsetCard(
          color: 'primary',
          width: width * 0.8,
          height: height*0.1,
          child: GestureDetector(
            onTap: (){
              strings.changeLanguage(language);
              },
            child: ITextWidget(
              language,
              color: 'primary',
            ),
          ),
        );
      },
    );
  }
}


class _LanguageSelectorState extends State<LanguageSelector> {


  List<Widget> buildLanguageList(Strings strings, double width, double height){
    List<String> languages = strings.getLanguages();
    List<Widget> selections = List(languages.length-1);
    int j = 0;
    for (int i = 0; i < languages.length; i ++){
      if (strings.getCurrentLanguage() == languages[i]){

      }
      else {
        selections[j] = LanguageSelection(languages[i], width: width,height: height,);
        j += 1;
      }
    }
    return selections;
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<Strings>(
      builder: (_, strings, __){
        return RandomOffsetCard(
          color: 'tertiary',
          width: widget.width,
          height: widget.height*0.1 *(widget.showSelection? 1+strings.getLanguages().length: 1),
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
                  'changelanguage',
                  color: 'tertiary',
                ),
              ),
              widget.showSelection ? Container(
                padding: EdgeInsets.only(
                    left: 10
                ),

                child: Column(
                  children: buildLanguageList(strings, widget.width, widget.height),
                ),
              ) :Container(),
            ],
          ),
        );
      },
    );
  }
}
