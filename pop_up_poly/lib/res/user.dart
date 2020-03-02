import 'package:flutter/cupertino.dart';

import 'storage.dart';

class User extends ChangeNotifier{
  /**
   * for storing user related information, e.g. score, username, usw.
   */
  String username;
  int score;

  User(){
    //call storage
    username = 'Matthias';
    score = 9239488;

  }

}