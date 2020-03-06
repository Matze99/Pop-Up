import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../customScaffold/customScaffold.dart';
import '../../smallWidgets/textWidget.dart';
import '../../smallWidgets/randomOffsetCard.dart';
import '../../res/strings.dart';
import '../../res/fonts.dart';
import '../../res/colorSchemes.dart';


class SettingsScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CustomScaffold(
      rootID: 5,
      scaffoldKey: scaffoldKey,
      body: ListView(
        children: <Widget>[
          RandomOffsetCard(
            color: 'tertiary',
            width: size.width,
            height: size.height*0.1,
            child: GestureDetector(
              onTap: () => scaffoldKey.currentState.openDrawer(),
              child: Consumer<Strings>(
                builder: (_, strings, __){
                  return Center(
                    child: TextWidget(
                      strings.get('openmenu'),
                      color: 'tertiary',
                      textStyle: 'normal',
                    ),
                  );
                },
              ),
            ),
          ),
          RandomOffsetCard(
            color: 'tertiary',
            width: size.width,
            height: size.height*0.2,
            child: Consumer2<ColorShemes, Fonts>(
              builder: (_, colorShemes, fonts, __){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ITextWidget(
                      'changefontsize',
                      color: 'tertiary',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          child: Icon(
                            CupertinoIcons.plus_circled,
                            color: colorShemes.getTextColor('tertiary'),
                            size: 35 * (fonts.fontSize/30),
                          ),
                          onTap: (){Provider.of<Fonts>(context, listen: false).increaseFontSize();},
                        ),
                        GestureDetector(
                          child: Icon(
                            CupertinoIcons.minus_circled,
                            color: colorShemes.getTextColor('tertiary'),
                            size: 35 * (fonts.fontSize/30),
                          ),
                          onTap: (){Provider.of<Fonts>(context, listen: false).decreaseFontSize();},
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
