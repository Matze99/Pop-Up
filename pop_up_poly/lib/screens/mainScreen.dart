import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MainScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> drawerKey;

  MainScreen({this.drawerKey});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: Colors.black38,
        child: Stack(
          children: <Widget>[
            CustomBody(),
            CustomPaint(
              painter: AppBarShadowPainter(),
              child: Container(),
            ),
            CustomAppBar(
              drawerKey: drawerKey,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;
    return ClipPath(
      clipper: BodyClipper(),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.orangeAccent,
                  Colors.orange,
                  Colors.deepOrangeAccent
                ])),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  GlobalKey<ScaffoldState> drawerKey;
  CustomAppBar({this.drawerKey});
  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;
    return ClipPath(
      clipper: AppBarClipper(),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.green, Colors.lightGreenAccent, Colors.white])),
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap:  () => drawerKey.currentState.openDrawer(),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    path.lineTo(size.width * 0.1, size.height * 0.7);
    path.lineTo(size.width * 0.2, size.height * 0.2);
    path.lineTo(size.width * 0.9, size.height * 0.1);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class AppBarShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.black38;

    Path path = Path();
    double offset = 5;
    path.lineTo(0, size.height * 0.8 + 2 * offset);
    path.lineTo(size.width * 0.1 + offset, size.height * 0.7 + offset);
    path.lineTo(size.width * 0.2 + offset, size.height * 0.2 + offset);
    path.lineTo(size.width * 0.9 + offset, size.height * 0.1 + offset);
    path.lineTo(size.width + offset, 0);
    path.close();
//    canvas.drawPath(path, paint);
    canvas.drawShadow(path, Colors.black38, 0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BodyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.6);
    path.lineTo(size.width * 0.1, size.height * 0.5);
    path.lineTo(size.width * 0.2, size.height * 0.2);
    path.lineTo(size.width * 0.9, size.height * 0.1);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
