import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'customAppBar.dart';
import '../drawer/customDrawer.dart';
import '../drawer/drawerElements.dart';
import '../../res/colorSchemes.dart';

class CustomScaffold extends StatelessWidget {
  int rootID;
  Widget body;
  Widget header;
  GlobalKey<ScaffoldState> scaffoldKey;

  CustomScaffold({this.body, this.header, this.rootID, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
//    Provider.of<ColorShemes>(context).changeColor(lady, ladyGrad);
    return Scaffold(
      backgroundColor: Colors.black38,
      key: scaffoldKey,
      drawer: DiagonalDrawer(
        widthOffset: 100,
        heightOffset: 100,
        child: DrawerElements(
          widthOffset: 100,
          heightOffset: 100,
          rootID: rootID,
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: <Widget>[
              CustomBody(
                child: Container(),
              ),
              CustomAppBar(
//                drawerKey: key,
              ),
//              CustomPaint(
//                painter: AppBarShadowPainter(),
//                child: Container(),
//              ),

              body,
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  Widget child;

  CustomBody({this.child});

  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;
    return ClipPath(
      clipper: BodyClipper(),
      child: Consumer<ColorShemes>(
        builder: (_, colorSheme, __){
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: colorSheme.getGradient('secondary'))),
            child: CustomPaint(
              painter: AppBarShadowPainter(),
              child: child,
            ),
          );
        },
      )
    );
  }
}

class BodyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
//    path.lineTo(0, size.height * 0.8);
//    path.lineTo(size.width * 0.1, size.height * 0.7);
//    path.lineTo(size.width * 0.2, size.height * 0.2);
//    path.lineTo(size.width * 0.9, size.height * 0.1);
//    path.lineTo(size.width, 0);
    Path path = Path();
    double offset = 0;
    path.moveTo(0, size.height * 0.8 + 2 * offset);
    path.lineTo(size.width * 0.1 + offset, size.height * 0.7 + offset);
    path.lineTo(size.width * 0.2 + offset, size.height * 0.2 + offset);
    path.lineTo(size.width * 0.9 + offset, size.height * 0.1 + offset);
    path.lineTo(size.width + offset, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
