import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customDrawer.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _listPlaceholderWidget extends StatelessWidget{
  List<Color> _colors = [Colors.blue.shade50, Colors.blue.shade100, Colors.blue.shade200, Colors.blue.shade300];
  int colorID;
  _listPlaceholderWidget({this.colorID});

  @override
  Widget build(BuildContext context) {
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
        child: Center(child: Text(
          'this is a text',
          style: TextStyle(
            fontSize: 30,
          ),
        ))
      ),
    );
  }
}

class _MainScreenState extends State<MainScreen> {

  Widget listBuilder(BuildContext context, int index){
    int cID;
    index += 2;
    if ((index%6) < 4){
      cID = index%6;
    }
    else{
      cID = 6-index%6;
    }
    return(_listPlaceholderWidget(
      colorID: cID,
    ));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildList(int length){
      List<Widget> list = List(length);
      for (int i = 0; i<length; i++){
        list[i] = listBuilder(context, i);
      }
      return list;
    }

    double height = MediaQuery.of(context).size.height;
    var scaffoldKey = GlobalKey<ScaffoldState>();

//    var shape = RoundedRectangleBorder(
//      borderRadius: BorderRadius.circular(10),
//    );

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      drawer: CustomDrawer(),
//      Drawer(
//        child:
//        ListView(
//          children: <Widget>[
//            Container(
//              child: Text('dfe'),
//            )
//          ],
//        ),
//      ),
      body: Container(
        color: Colors.orangeAccent,
        child: ClipRRect(
//          borderRadius: BorderRadius.only(
//              topLeft: Radius.circular(100)
//          ),
          child: Container(
              child: ListView(
                children: <Widget>[
                  Card(
                    elevation: 5,
                    margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Container(
                      color: Colors.blue.shade50,
                      height: 0.2*height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'your Score:',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '99982348',
                                  style: TextStyle(
                                    fontSize: 40,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Container(
                      height: 0.1*height,
                      color: Colors.blue.shade100,
                      child: Center(
                        child: Text(
                          'Competitions:',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),

                  ),
                  ClipRRect(
//                    borderRadius: BorderRadius.only(
//                        topLeft: Radius.circular(100)
//                    ),
                    child: Container(
//                      color: Colors.white,
                      child: Column(
                          children: _buildList(10),
                        ),
                    )
                  )
                ],
              ),
            ),
        ),
      ),




//      Container(
//        color: Colors.orange,
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[


//          ],
//        ),
//      ),
    );
  }
}
