import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'strings.dart';
import 'user.dart';
import 'fonts.dart';
import 'colorSchemes.dart';

class RessourceManager extends StatefulWidget {
  Widget child;
  RessourceManager({this.child});

  @override
  _RessourceManagerState createState() => _RessourceManagerState();
}

class _RessourceManagerState extends State<RessourceManager> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Strings(),
        ),
        ChangeNotifierProvider(
          create: (context) => User(),
        ),
        ChangeNotifierProvider(
          create: (context) => Fonts(),
        ),
        ChangeNotifierProvider(
          create: (context) => ColorShemes(),
        )
      ],
      child: widget.child,
    );
  }
}
