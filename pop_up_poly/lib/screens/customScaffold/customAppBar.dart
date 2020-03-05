import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/colorSchemes.dart';

class CustomAppBar extends StatelessWidget {
//  GlobalKey<ScaffoldState> drawerKey;

//  CustomAppBar({this.drawerKey});

  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;
    return ClipPath(
      clipper: AppBarClipper(),
      child: Consumer<ColorShemes>(
        builder: (_, colorSheme, __){
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: colorSheme.getGradient('primary'))),
            child: Container(
//          child:
            ),
          );
        }
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

//    Path path = Path();
    double offset = 5;
//    path.moveTo(0, size.height * 0.8);
//    path.lineTo(0, size.height * 0.8 + 2 * offset);
//    path.lineTo(size.width * 0.1 + offset, size.height * 0.7 + offset);
//    path.lineTo(size.width * 0.2 + offset, size.height * 0.2 + offset);
//    path.lineTo(size.width * 0.9 + offset, size.height * 0.1 + offset);
//    path.lineTo(size.width, 0);
//    path.lineTo(size.width * 0.9, size.height * 0.1);
//    path.lineTo(size.width * 0.2, size.height * 0.2);
//    path.lineTo(size.width * 0.1, size.height * 0.7);
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    path.lineTo(size.width * 0.1 + offset, size.height * 0.7);
    path.lineTo(size.width * 0.2 + offset, size.height * 0.2);
    path.lineTo(size.width * 0.9 + offset, size.height * 0.1);
    path.lineTo(size.width, 0);
    path.close();
//    canvas.drawPath(path, paint);
    canvas.drawShadow(path, Colors.black, 10, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
