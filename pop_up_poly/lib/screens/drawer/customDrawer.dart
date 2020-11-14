import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/colorSchemes.dart';

class DiagonalDrawer extends StatelessWidget {
  Widget child;

  double widthOffset;
  double heightOffset;

  DiagonalDrawer({@required this.child, @required this.heightOffset = 100, @required this.widthOffset = 100});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: (){Navigator.pop(context);},
        child: Container(
          color: Color(0x00000000),
          child: ClipPath(
            clipper: DiagClipPath(widthOffset: widthOffset, width: size.width-widthOffset-20, height: size.height-heightOffset-50, heightOffset: heightOffset),
            child: GestureDetector(
              onTap: (){print('pressed in drawer');},
              child: Consumer<ColorShemes>(
                builder: (_, colorSheme, __){
                  return Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: colorSheme.getGradient('tertiary')
                        )
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ClipRRect(
                        child: Container(
                          width: size.width-widthOffset-20,
                          height: size.height-heightOffset-50,
//                        color: Colors.green,
                          child: child,
                        ),
                      ),
                    ),
                  );
                },
              )
            ),
          ),
        ),
      ),
    );
  }
}


class DiagClipPath extends CustomClipper<Path>{
  double widthOffset;
  double heightOffset;
  double width;
  double height;

  DiagClipPath({@required this.widthOffset, @required this.width, @required this.height, @required this.heightOffset});
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, height+heightOffset);
    path.lineTo(width, height);
    path.lineTo(this.widthOffset+width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}