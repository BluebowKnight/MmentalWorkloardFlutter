import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prototype/model/json_decoder.dart';
import 'package:prototype/model/sleep_rating.dart';

class SleepDataProvider extends ChangeNotifier{
  Map<String, SleepRating> _userSleepRating = {};

  SleepDataProvider();

  Future LoadData(String path) async{
    Decoder jsonDecoder = Decoder();
    _userSleepRating = {};
    List<dynamic> json;
    if(path.endsWith('.json')){
      json = await jsonDecoder.decodeFromFile(path);
    }else{
      json = await jsonDecoder.decodeFromUrl(path);
    }

    for(int i=0; i<json.length; i++){
      SleepRating sleepRating = SleepRating.fromJson(json[i]);
      _userSleepRating[sleepRating.Date] = sleepRating;
    }
    notifyListeners();
  }

  SleepRating? selectedDateRating(String date) => _userSleepRating[date];

  SleepRating? previousDayRating(String selectedDate){
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    DateTime today = dateFormat.parse(selectedDate);
    DateTime yesterday = today.subtract(Duration(days: 1));
    print(_userSleepRating[dateFormat.format(yesterday)]);
    return _userSleepRating[dateFormat.format(yesterday)];
  }

  SleepRating? nextDayRating(String selectedDate){
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    DateTime today = dateFormat.parse(selectedDate);
    DateTime tomorrow = today.add(Duration(days: 1));
    print( _userSleepRating[dateFormat.format(tomorrow)]);
    return _userSleepRating[dateFormat.format(tomorrow)];
  }
}