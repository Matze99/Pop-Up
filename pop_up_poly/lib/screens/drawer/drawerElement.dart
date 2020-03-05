import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../res/colorSchemes.dart';
import '../../res/fonts.dart';
import '../../smallWidgets/textWidget.dart';

class DrawerElement extends StatefulWidget {
  Widget children;
  String title;
  IconData iconData;
  bool childrenVisible = false;
  Function onTab;

  DrawerElement({this.children, @required this.title, this.iconData, this.onTab});

  @override
  _DrawerElementState createState() => _DrawerElementState();
}

class _DrawerElementState extends State<DrawerElement> {
  @override
  Widget build(BuildContext context) {
    void onTab() {
      setState(() {
        widget.childrenVisible = !widget.childrenVisible;
      });
    }

    return Consumer2<Fonts, ColorShemes>(
      builder: (_, fonts, colorSheme, __) {
        return Container(
          child: widget.children == null || !widget.childrenVisible
              ? DrawerElementHeader(
                  childrenVisible: false,
                  hasChildren: widget.children != null,
                  colorSheme: colorSheme,
                  iconData: widget.iconData,
                  title: widget.title,
                  onTabIcon: onTab,
                  onTabTitle: widget.onTab,
                )
              : Column(
                  children: <Widget>[
                    DrawerElementHeader(
                      childrenVisible: true,
                      hasChildren: true,
                      colorSheme: colorSheme,
                      iconData: widget.iconData,
                      title: widget.title,
                      onTabIcon: onTab,
                      onTabTitle: widget.onTab,
                    ),
                    widget.children
                  ],
                ),
        );
      },
    );
  }
}

class DrawerElementHeader extends StatelessWidget {
  bool childrenVisible;
  bool hasChildren;
  ColorShemes colorSheme;
  IconData iconData;
  String title;
  Function onTabIcon;
  Function onTabTitle;

  DrawerElementHeader(
      {this.hasChildren,
      this.childrenVisible,
      this.colorSheme,
      this.iconData,
      this.title,
      this.onTabIcon,
      this.onTabTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: onTabTitle,
          child: Row(
            children: <Widget>[
              iconData == null
                  ? Container()
                  : Icon(
                      CupertinoIcons.home,
                      color: colorSheme.getTextColor('tertiary'),
                    ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    top: 5,
                  ),
                  child: TextWidget(
                    title,
                    color: 'tertiary',
                    textStyle: 'drawerTitle',
                  ),
                ),
              ),
            ],
          ),
        ),
        !hasChildren
            ? Container()
            : GestureDetector(
                onTap: onTabIcon,
                child: Icon(
                  childrenVisible ? Icons.minimize : CupertinoIcons.add,
                  color: colorSheme.getTextColor('tertiary'),
                ),
              )
      ],
    );
  }
}

class DrawerElementChildren extends StatelessWidget {
  List<DrawerElementChild> children;

  DrawerElementChildren({this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Column(
        children: children,
      ),
    );
  }
}

class DrawerElementChild extends StatelessWidget {
  IconData iconData;
  String text;
  Function onTab;

  DrawerElementChild(this.text, {this.iconData, this.onTab});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
          onTap: onTab,
          child: Container(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text,
                  color: 'tertiary',
                  textStyle: 'drawerChildText',
                ),
              ]
            ),
          )),
    );
  }
}
