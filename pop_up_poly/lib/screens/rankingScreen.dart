import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../smallWidgets/randomOffsetCard.dart';
import 'customScaffold/customScaffold.dart';
import '../res/user.dart';
import '../res/storage.dart';
import '../smallWidgets/textWidget.dart';
import '../res/strings.dart';

class _RankingEntry extends StatelessWidget {
  bool self;
  int ranking;
  int score;
  String username;
  double width;
  double height;

  _RankingEntry({this.width, this.height, this.score, this.username, this.ranking, this.self});

  @override
  Widget build(BuildContext context) {
    return RandomOffsetCard(
      color: self ? 'primary': 'tertiary',
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextWidget(
              ranking.toString(),
              color: self ? 'primary': 'tertiary',
              textStyle: 'larger',
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              self ? ITextWidget('you', color: 'primary'): TextWidget(username, color: 'tertiary',),
              TextWidget(
                score.toString(),
                color: self ? 'primary': 'tertiary',
              )
            ],
          )
        ],
      ),
    );
  }
}


class RankingScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var rankings = Storage.getRanking();

  Widget buildList(var size, int index, ){
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
    else{
      var current = rankings[index-2];
      return Consumer<User>(
        builder: (_, user, __){
          return _RankingEntry(
            width: size.width,
            height: size.height*0.2,
            ranking: current.ranking,
            username: current.username,
            self: current.username == user.getUsername(),
            score: current.score,
          );
        },
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return CustomScaffold(
      rootID: 2,
      scaffoldKey: scaffoldKey,
      body: Column(
        children: <Widget>[
          Container(
            child: ListView.builder(
            itemBuilder: (BuildContext context, int index){
              return buildList(size, index);
            },
            itemCount: rankings.length+2,
            ),
          ),
//          RandomOffsetCard(
//            height: size.height* 0.1,
//            width: size.width,
//            color: 'primary',
//          )
        ],
      ),
    );
  }
}
