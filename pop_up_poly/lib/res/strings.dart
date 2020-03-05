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

  Strings(){
    currentStrings = Storage.loadSystemLanguageStrings();
  }

  String get(String identifier){
    print(currentStrings[identifier]);
    return currentStrings[identifier];
  }

  void changeLanguage(String newLanguage){
    currentStrings = Storage.changeLanguage(newLanguage);
    notifyListeners();
  }

}