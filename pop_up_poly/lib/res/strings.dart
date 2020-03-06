import 'package:flutter/widgets.dart';

import 'storage.dart';

class Strings extends ChangeNotifier{
  /**
   * for sotring strings in different languages
   *
   *
   */

  List<String> _languages = ['en', 'de'];
  String _currentLanguage = 'en';

  List<String> getLanguages(){
    return _languages;
  }

  String getCurrentLanguage(){
    return _currentLanguage;
  }

  Map<String,String> currentStrings = {

  };

  Strings(){
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