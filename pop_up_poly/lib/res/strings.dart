import 'package:flutter/widgets.dart';

import 'storage.dart';

class Strings extends ChangeNotifier{
  /**
   * for sotring strings in different languages
   *
   *
   */

  Map<String,String> currentStrings = {

  };

  Strings(Map<String, String> strings){
    currentStrings = Storage.loadSystemLanguageStrings();
  }

  String get(String identifier){
    return currentStrings[identifier];
  }

  void changeLanguage(String newLanguage){
    currentStrings = Storage.changeLanguage(newLanguage);
    notifyListeners();
  }

}