import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter/painting.dart';

import '../res/colorSchemes.dart';
import '../smallWidgets/textWidget.dart';

class RandomOffsetCard extends StatelessWidget {
  double width;
  double height;
  String color;
  Widget child;

  RandomOffsetCard({this.child, this.color, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorShemes>(
      builder: (_, colorSheme, __) {
        return Container(
          margin: EdgeInsets.all(15),
          child: CustomPaint(
            painter:
            RandomOffsetCardBackgroundPainter(colorSheme.getColor(color), width*0.9, height*0.9, 0, 0, width*0.03),//colorSheme.getColor(color)
            child: GestureDetector(
              onTap: (){print('pressed');},
              child: Container(
                width: width,
                height: height,
                child: child == null ? Center(child: TextWidget('random offset card', textStyle: 'normal', color: color,)):child,
              ),
            ),
          ),
        );
      },
    );
  }
}

class RandomOffsetCardBackgroundPainter extends CustomPainter {
  Color color;
  double width;
  double height;
  double widthOffset;
  double heightOffset;
  double maxOffset = 15;
  double widthCentering;

  RandomOffsetCardBackgroundPainter(
      this.color, this.width, this.height, this.widthOffset, this.heightOffset, this.widthCentering);

  @override
  void paint(Canvas canvas, Size size) {
    var rand = Random();

    Paint paint = Paint()..color = color;
    paint.strokeWidth = 100;

    Path path = Path();
    path.moveTo(widthCentering + widthOffset - rand.nextDouble() * maxOffset,
        heightOffset - rand.nextDouble() * maxOffset);
    path.lineTo(width + rand.nextDouble() * maxOffset,
        0 + rand.nextDouble() * maxOffset);
    path.lineTo(width + rand.nextDouble() * maxOffset,
        height + rand.nextDouble() * maxOffset);
    path.lineTo(widthCentering - rand.nextDouble() * maxOffset,
        height + rand.nextDouble() * maxOffset);
    path.close();
//    Path shadowPath = path.shift(Offset(0,10));
    canvas.drawShadow(path, Colors.black, 10, false);
    canvas.drawPath(path, paint);
//    canvas.

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ShadowPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}
