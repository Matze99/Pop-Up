import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../smallWidgets/randomOffsetCard.dart';
import '../../res/strings.dart';

class LanguageSelector extends StatefulWidget {
  double width;
  double height;
  int numLanguages;
  double factor;
  bool showSelection = false;

  LanguageSelector({this.height, this.width});

  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  List<Widget> buildLanguageList(Strings strings){

  }


  @override
  Widget build(BuildContext context) {
    return RandomOffsetCard(
      width: widget.width,
      height: widget.height *(widget.showSelection? 1+widget.factor*widget.numLanguages: 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(

          ),
          widget.showSelection ? Container(
            padding: EdgeInsets.only(
              left: 10
            ),
            child: Column(
              children: <Widget>[],
            ),
          ) :Container(),
        ],
      ),
    );
  }
}
