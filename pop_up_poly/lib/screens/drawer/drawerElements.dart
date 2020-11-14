import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/strings.dart';
import '../mainScreen.dart';
import '../competitionScreen.dart';
import 'drawerElement.dart';
import '../rankingScreen.dart';
import '../settingsScreen/settingsScreen.dart';

class DrawerElements extends StatelessWidget {
  int rootID;
  double widthOffset;
  double heightOffset;

  DrawerElements({this.rootID, this.widthOffset, this.heightOffset});

  void navigate(int id, BuildContext context){
    if (id == rootID){
      Navigator.pop(context);
    }
    else if (id == 0){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    }
    else if (id == 1){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CompetitionScreen()),
      );
    }
    else if (id == 2){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RankingScreen()),
      );
    }
    else if (id == 5){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsScreen()),
      );
    }
    else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<Strings>(
      builder: (_, strings, __){
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
//                padding: EdgeInsets.all(10),
                height: size.height-heightOffset - 50,
//                width: size.width - widthOffset - 20,
                child: ListView(
                  children: <Widget>[
                    DrawerElement(
                      title: strings.get('home'),
                      iconData: CupertinoIcons.home,
                      onTab: (){navigate(0, context);},
                      children: DrawerElementChildren(
                        children: [
                          DrawerElementChild(
                            strings.get('oldcomp'),
                            onTab: (){navigate(1, context);},
                          ),
                          DrawerElementChild(
                            strings.get('ranking'),
                            onTab: (){navigate(2, context);},
                          ),
                        ],
                      ),
                    ),
                    DrawerElement(
                      title: strings.get('settings'),
                      iconData: CupertinoIcons.settings,
                      onTab: (){navigate(5, context);},
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
