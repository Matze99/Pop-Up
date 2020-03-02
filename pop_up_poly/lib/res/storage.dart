import 'dart:core';

import 'strings.dart';
import 'user.dart';
import 'fonts.dart';

class Storage{
  /**
   * methods for storing and loading data
   *
   * should be called to initailize the ressource
   * also will hold methods for connecting to the server side
   *
   * the current implementation is soley for testing purposes
   */

  User loadUser(){
    //TODO implement
    throw UnimplementedError();
  }

  Fonts loadFonts(){
    //TODO implement
    throw UnimplementedError();
  }

  static Map<String, String> loadSystemLanguageStrings(){
    return {
      'helloworld': 'Hello World!',
    };
  }

  static Map<String, String> changeLanguage(String newLanguage){
    if (newLanguage == 'en'){
      return {
        'helloworld': 'Hello World!',
      };
    }
    else if (newLanguage == 'de'){
      return {
        'helloworld': 'Hallo Welt!',
      };
    }
  }
}