import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerElement extends StatelessWidget{
  List<Color> _colors = [Colors.blue.shade50, Colors.blue.shade100, Colors.blue.shade200, Colors.blue.shade300];
  int colorID;
  DrawerElement({this.colorID});

  @override
  Widget build(BuildContext context) {
//    return Container(
//      child: ClipPath(
//        child: Container(
//          width: MediaQuery.of(context).size.width,
//          height: MediaQuery.of(context).size.height,
//          color: Colors.blue,
//        ),
//        clipper: CustomClipPath(),
//      ),
//    );
    return Card(
//      shape: ,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      elevation: 5,
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      color: _colors[colorID],
      child: Container(
        height: 100,
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget{

  Widget listBuilder(BuildContext context, int index){
    int cID;
    index += 2;
    if ((index%6) < 4){
      cID = index%6;
    }
    else{
      cID = 6-index%6;
    }
    return(DrawerElement(
      colorID: cID,
    ));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildList(int length){
      List<Widget> list = List(length+1);
      list[0] = DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.orange,
        ),
        child: Center(
          child: Text('header'),
        ),
      );
      for (int i = 0; i<length; i++){
        list[i+1] = listBuilder(context, i);
      }
      return list;
    }

    return Drawer(
      child: Container(
        color: Colors.orangeAccent,
        child: ListView(
          children: _buildList(10),
        ),
      ),
    );
  }
}