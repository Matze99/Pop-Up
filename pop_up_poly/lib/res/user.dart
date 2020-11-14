import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../smallWidgets/textWidget.dart';
import '../res/strings.dart';
import 'storage.dart';

class User extends ChangeNotifier{
  /**
   * for storing user related information, e.g. score, username, usw.
   */
  String _username;
  int _score;
  List<_Competition> _oldCompetitions;

  User(){
    //call storage
    _username = 'Matthias';
    _score = 9239488;
    _oldCompetitions = [
      _Competition('Competition 1', 1000, DateTime(2020), null, _CompetitionType.FirstClick),
      _Competition('Competition 2', 1000, DateTime(2020), null, _CompetitionType.FirstClick),
      _Competition('Competition 3', 1000, DateTime(2020), null, _CompetitionType.FirstClick),
      _Competition('Competition 4', 1000, DateTime(2020), null, _CompetitionType.FirstClick),
      _Competition('Competition 5', 1000, DateTime(2020), null, _CompetitionType.FirstClick),
      _Competition('Competition 6', 1000, DateTime(2020), null, _CompetitionType.FirstClick),
      _Competition('Competition 7', 1000, DateTime(2020), null, _CompetitionType.FirstClick),
      _Competition('Competition 8', 1000, DateTime(2020), null, _CompetitionType.FirstClick),
    ];
  }

  _Competition getComp(int index){
    return _oldCompetitions[index];
  }

  List<Map<String, String>> getRanking(){
    var ret = [
      {
        'username': 'hans',
        'points': '10000000',
      }
    ];
  }

  int getCompLength(){
    return _oldCompetitions.length;
  }

  String getScore(){
    return _score.toString();
  }

  String getUsername(){
    return _username;
  }

}

enum _CompetitionType {
  GoTo,
  Puzzle,
  FirstClick,
}

class _Competition {
  String _name;
  int _gainedPoints;
  DateTime _dateTime;
  Location _location;
  _CompetitionType _competitionType;

  _Competition(this._name, this._gainedPoints, this._dateTime, this._location, this._competitionType);

  Widget getShortDescription(String color){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<Strings>(
            builder: (_, strings, __){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextWidget(
                    CustomDateTime.extractDate(_dateTime, strings.getCurrentLanguage() == 'en'),
                    color: color,
                    textStyle: 'smaller',
                  ),
                  TextWidget(
                    CustomDateTime.extractTime(_dateTime, strings.getCurrentLanguage() == 'en'),
                    color: color,
                    textStyle: 'smaller',
                  )
                ],
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextWidget(
                _name,
                color: color,
              ),
              TextWidget(
                '+ '+_gainedPoints.toString(),
                color: color,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getLongDescription(){
    //TODO implement
    return Container(

    );
  }

}

class CustomDateTime{
  static String extractDate(DateTime date, bool american){
    String day = leadingZero(date.day);
    String month = leadingZero(date.month);
    String year = date.year.toString();
    if (american){
      return month +'/' + day + '/' + year;
    }
    else{
      return day + '.' + month + '.' + year;
    }
  }

  static String extractTime(DateTime date, bool american){
    String hour;
    String ext = '';
    if (american){
      var s = convertHourToAmerican(date.hour);
      hour = s[0] +':';
      ext = ' '+s[1];
    }
    else {
      hour = date.hour.toString() + ':';
    }
    String minute = leadingZero(date.minute);

    return hour + minute +ext;
  }

  static List<String> convertHourToAmerican(int hour){

    if (hour >= 13){
      return [(hour-12).toString(), 'PM'];
    }
    else if (hour == 12){
      return ['12', 'PM'];
    }
    else if (hour == 0){
      return ['12', 'AM'];
    }
    else {
      return [(hour.toString()), 'AM'];
    }
  }

  static String leadingZero(int i){
    String s = i.toString();
    if (s.length < 2){
      s = '0' + s;
    }
    return s;
  }


}

class Location {

}