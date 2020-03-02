import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AnimatedCard extends StatefulWidget {
  Widget child;
  List<Widget> children;
  bool alwaysVisible;
  AnimatedCard({this.child, this.children, this.alwaysVisible});
  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    void hideShowChildren (){
      setState(() {
        visible = !visible;
      });
    }
    Widget header = Container(
      child: widget.alwaysVisible ?
      HeaderRow(
        child: widget.child,
        noChildren: true,
      )
          : visible ? HeaderRow(
        child: widget.child,
        iconData: Icons.minimize,
        onIconTap: hideShowChildren,
        noChildren: false,
      ) :(HeaderRow(
        child: widget.child,
        iconData: Icons.add,
        onIconTap: hideShowChildren,
        noChildren: false,
      )
      ),
    );


    return Container(
      decoration: BoxDecoration(

          color: Colors.blue[100],
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(4,4),
          )
        ]
      ),
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        child: Column(
          children: visible ? <Widget>[
            header,
            Column(
              children: widget.children,
            ),
          ]: [
            header
          ],
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  Widget child;
  IconData iconData;
  bool noChildren = false;
  Function onIconTap;
  Function onChildTap;
  HeaderRow({this.child, this.iconData, this.noChildren, this.onChildTap, this.onIconTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: onChildTap,
            child: child,
          ),
          this.noChildren ? Container() : GestureDetector(
            onTap: onIconTap,
            child: Icon(iconData),
          )
        ],
      ),
    );
  }
}

