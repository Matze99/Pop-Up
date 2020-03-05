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
      'yourscore': 'your Score:',
      'general': 'General',
      'bottomtext': 'Bottom text',
      'devby': 'Developed by POP-UP Inc.',
      'level': 'Level ',
      'home': 'Home',
      'mainappbar': 'Home',
      'mapappbar': 'Map',
      'changefontsize': 'change font size',
      'changefont': 'change font',
      'changeregion': 'change region',
      'changecomptype': 'change competition type',
      'changelanguage': 'change language',
      'addlanguage': 'add language',
      'accountsettings': 'Account Settings',
      'changeprivacy': 'change privacy settings',
      'logout': 'Log-Out',
      'language': 'English',
      'selectlanguage': 'select language',
      'drawerheader': 'Menu',
      'ranking': 'Ranking',
      'oldcomp': 'Old Competitions',
      'compmap': 'Competitions Map',
      'settings': 'Settings',
      'en': 'English',
      'de': 'German',
      'close': 'Close',
      'cancel': 'Cancel',
      'languagesettings': 'Language Settings',
      'smallest': 'smalles',
      'smaller': 'smaller',
      'small': 'small',

      'standard' : 'standard',

      'large': 'large',
      'larger': 'larger',
      'largest': 'largest',

      'openmenu': 'Open Menu',
    };
  }

  static Map<String, String> changeLanguage(String newLanguage){
    if (newLanguage == 'en'){
      return {
        'yourscore': 'your Score:',
        'general': 'General',
        'bottomtext': 'Bottom text',
        'devby': 'Developed by POP-UP Inc.',
        'level': 'Level',
        'home': 'Home',
        'mainappbar': 'Home',
        'mapappbar': 'Map',
        'changefontsize': 'change font size',
        'changefont': 'change font',
        'changeregion': 'change region',
        'changecomptype': 'change competition type',
        'changelanguage': 'change language',
        'addlanguage': 'add language',
        'accountsettings': 'Account Settings',
        'changeprivacy': 'change privacy settings',
        'logout': 'Log-Out',
        'language': 'English',
        'selectlanguage': 'select language',
        'drawerheader': 'Menu',
        'ranking': 'Ranking',
        'oldcomp': 'Old Competitions',
        'compmap': 'Competitions Map',
        'settings': 'Settings',
        'en': 'English',
        'de': 'German',
        'close': 'Close',
        'cancel': 'Cancel',
        'languagesettings': 'Language Settings',
        'smallest': 'smalles',
        'smaller': 'smaller',
        'small': 'small',

        'standard' : 'standard',

        'large': 'large',
        'larger': 'larger',
        'largest': 'largest',

        'openmenu': 'Open Menu',
      };
    }
    else if (newLanguage == 'de'){
      return {
      'yourscore': 'deine Punktzahl',
      'general': 'Allgemein',
      'bottomtext': 'Fußzeile',
      'devby': 'Entwickelt von POP-UP Inc.',
      'level': 'Level',
      'mainappbar': 'Hauptbildschirm',
      'home': 'Haupbildschirm',
      'mapappbar': 'Karte',
      'changefontsize': 'Schriftgröße ändern',
      'changefont': 'Schriftart ändern',
      'changeregion': 'Region ändern',
      'changecomptype': 'Wettbewerbstyp ändern',
      'changelanguage': 'Sprache ändern',
      'addlanguage': 'Sprache hinzufügen',
      'accountsettings': 'Account Einstellungen',
      'changeprivacy': 'Privatsphäre Einstellungen ändern',
      'logout': 'Ausloggen',
      'language': 'Deutsch',
      'selectlanguage': 'Wähle eine Sprache aus',
      'drawerheader': 'Menü',
      'ranking': 'Rangliste',
      'oldcomp': 'Alte Wettbewerbe',
      'compmap': 'Wettbewerbs Karte',
      'settings': 'Einstellungen',
      'en': 'Englisch',
      'de': 'Deutsch',
      'close': 'Schließen',
      'cancel': 'Abbrechen',
      'languagesettings': 'Spracheinstellungen',
      'smallest': 'am kleinsten',
      'smaller': 'kleiner',
      'small': 'klein',

      'standard' : 'standart',

      'large': 'groß',
      'larger': 'größer',
      'largest': 'am größsten',

      'openmenu': 'Menü Öffnen',
      };
    }
  }
}