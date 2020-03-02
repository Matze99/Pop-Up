import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class RessourceManager extends StatelessWidget {
  Widget child;
  RessourceManager({this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

      ],
      child: child,
    );
  }
}
