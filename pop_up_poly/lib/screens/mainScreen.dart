import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/ressourceManager.dart';
import '../res/strings.dart';
import '../res/user.dart';
import 'customScaffold/customScaffold.dart';
import '../smallWidgets/randomOffsetCard.dart';
import '../smallWidgets/textWidget.dart';

class MainScreen extends StatelessWidget {

  MainScreen();



  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();

    Widget _listBuilder(BuildContext context, int index){
      var size = MediaQuery.of(context).size;
      if (index == 0){
        return Container(
          height: 10,
        );
      }
      else if (index == 1){
        return RandomOffsetCard(
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
        );
      }
      else if (index == 2){
        return RandomOffsetCard(
          color: 'tertiary',
          width: size.width,
          height: size.height*0.2,
          child: ScoreCard(),
//          color: Colors.white,
//          ),
        );
      }
      else{
        return RandomOffsetCard(
            color: 'tertiary',
//          color: Colors.white,
          width: size.width,
          height: size.height*0.15,
          child: Consumer<User>(
            builder: (_, user, __){
              return user.getComp(index-2).getShortDescription('tertiary');
            },
          ),
        );
      }
    }

    return CustomScaffold(
        scaffoldKey: scaffoldKey,
        rootID: 0,
        header: Text('header'),
        body: GestureDetector(
          child: Consumer<User>(
            builder: (_, user,__){
              return Container(
                child: ListView.builder(
                  itemCount: user.getCompLength()+2,
                  itemBuilder: _listBuilder,
                ),
              );
            },
          ),
          onTap: (){print('tapped body');},
        ),
      );
  }
}

class ScoreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<Strings, User>(
      builder: (_, strings, user, __){
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextWidget(
                strings.get('yourscore'),
                color: 'tertiary',
                textStyle: 'smaller',
              ),
              TextWidget(
                user.getScore(),
                color: 'tertiary',
                textStyle: 'larger',
              )
            ],
          ),
        );
      },
    );
  }
}
