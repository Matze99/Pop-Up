import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'customScaffold/customScaffold.dart';
import '../res/user.dart';
import '../smallWidgets/randomOffsetCard.dart';
import '../smallWidgets/textWidget.dart';
import '../res/strings.dart';

class CompetitionScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Widget itemBuilder(BuildContext buildContext, int index){
    var size = MediaQuery.of(buildContext).size;
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

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: scaffoldKey,
      rootID: 1,
      body: Consumer<User>(
        builder: (_, user, __){
          return ListView.builder(
            itemBuilder: itemBuilder,
            itemCount: user.getCompLength()+1,
          );
        },
      ),
    );
  }
}
