import 'package:flutter/material.dart';

import 'screens/mainScreen.dart';
import 'screens/drawer/customDrawer.dart';
import 'res/ressourceManager.dart';
import 'screens/drawer/drawerElements.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RessourceManager(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home:  MainScreen(),
      ),
    );
  }
}

//class MyAppWidget extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    var scaffoldKey = GlobalKey<ScaffoldState>();
//
//    return RessourceManager(
//      child: Scaffold(
//        key: scaffoldKey,
//        drawer: SafeArea(
//          child: DiagonalDrawer(
//            child: DrawerElements(),
//            heightOffset: 200,
//            widthOffset: 100,
//          ),
//        ),
//        body: MainScreen(
//          drawerKey: scaffoldKey,
//        ),
//      ),
//    );
//  }
//}
