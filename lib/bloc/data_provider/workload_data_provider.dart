import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:prototype/model/json_decoder.dart';
import 'package:prototype/model/workload_rating.dart';

class DailyInfo{
  double _totalDailyDuration = 0;
  double _dailyMinDuration = 0;
  double _dailyMaxDuration = 0;
  double _dailyLowMWLTime = 0;
  double _dailyMediMWLTime = 0;
  double _dailyHighMWLTime = 0;
  double _averageMWLRating = 0;
  double _averageDuration = 0;

  double get totalDailyDuration => (this._totalDailyDuration*100).round()/100;
  set totalDailyDuration(double value) => this._totalDailyDuration = value;

  double get dailyMinDuration => (this._dailyMinDuration*100).round()/100;
  set dailyMinDuration( value) => this._dailyMinDuration = value;

  double get dailyMaxDuration => (this._dailyMaxDuration*100).round()/100;
  set dailyMaxDuration( value) => this._dailyMaxDuration = value;

  double get dailyLowMWLTime => (this._dailyLowMWLTime*100).round()/100;
  set dailyLowMWLTime( value) => this._dailyLowMWLTime = value;

  double get dailyMediMWLTime => (this._dailyMediMWLTime*100).round()/100;
  set dailyMediMWLTime( value) => this._dailyMediMWLTime = value;

  double get dailyHighMWLTime => (this._dailyHighMWLTime*100).round()/100;
  set dailyHighMWLTime( value) => this._dailyHighMWLTime = value;

  double get averageMWLRating => (this._averageMWLRating*100).round()/100;
  set averageMWLRating(double value) => this._averageMWLRating = value;

  double get averageDuration => (this._averageDuration*100).round()/100;
  set averageDuration( value) => this._averageDuration = value;

  void reset(){
    _totalDailyDuration = 0;
    _dailyMinDuration = 0;
    _dailyMaxDuration = 0;
    _dailyLowMWLTime = 0;
    _dailyMediMWLTime = 0;
    _dailyHighMWLTime = 0;
  }

  String percentageL() => (_dailyLowMWLTime/totalDailyDuration*100).toStringAsFixed(2);
  String percentageM() => (_dailyMediMWLTime/totalDailyDuration*100).toStringAsFixed(2);
  String percentageH() => (_dailyHighMWLTime/totalDailyDuration*100).toStringAsFixed(2);
}

class WorkloadDataProvider with ChangeNotifier{
  Map<String,List<WorkloadRating>> _userWorkloadData = {};
  
  DailyInfo selectedDateInfo = DailyInfo();
  DailyInfo compareDateInfo = DailyInfo();
  DailyInfo rangeInfo = DailyInfo();

  List<WorkloadRating> _rangeRatings = [];

  WorkloadDataProvider();

  Future LoadData(String path) async{
    Decoder jsonDecoder = Decoder();
    _userWorkloadData = {};
    List<dynamic> json;
    if(path.endsWith('.json')){
      json = await jsonDecoder.decodeFromFile(path);
    }else{
      json = await jsonDecoder.decodeFromUrl(path);
    }
    String date_index = '';

    for (int i = 0; i < json.length; i++){
      WorkloadRating workload = WorkloadRating.fromJson(json[i]); // create new data class

      if(json[i]["Date"] != date_index){ //if new day
        date_index = json[i]["Date"];
        _userWorkloadData[date_index] = [workload];
      }else{
        _userWorkloadData[date_index]?.add(workload);
      }

      
    }
    notifyListeners();
    //print(userWorkloadData);
  }

  List<WorkloadRating>? selectedDateRatings (String date) => _userWorkloadData[date];

  List<WorkloadRating> get rangeRating => _rangeRatings;

  void reloadRangeDateRatings(DateTime start, DateTime end){
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    DateTime index = start;
    String day = '';
    _rangeRatings = [];
    do {
      day = dateFormat.format(index);
      if(_userWorkloadData[day]!=null){
        _rangeRatings += _userWorkloadData[day]!;
      }
      index = index.add(Duration(days: 1));
    } while (!index.isAfter(end));
    calculateRangeInfo();
  }

  void calculateDailyInfo(String date){
    //reset
    selectedDateInfo.reset();
    
    //check null
    if(_userWorkloadData[date] == null){
      return;
    }

    double durationIndex = 0;
    double totalRating = 0;
    //calculation
    for(int i=0; i<_userWorkloadData[date]!.length; i++){
      durationIndex = double.parse(_userWorkloadData[date]![i].DurationHours);
      if(i == 1) selectedDateInfo.dailyMinDuration = durationIndex;
      selectedDateInfo.totalDailyDuration += durationIndex;

      if(durationIndex < selectedDateInfo.dailyMinDuration){
        selectedDateInfo.dailyMinDuration = durationIndex;
      }
      if(durationIndex > selectedDateInfo.dailyMaxDuration){
        selectedDateInfo.dailyMaxDuration = durationIndex;
      }

      switch(_userWorkloadData[date]![i].Rating){
        case 1:
        case 2:
          selectedDateInfo.dailyLowMWLTime += durationIndex;
          break;
        case 3:
          selectedDateInfo.dailyMediMWLTime += durationIndex;
          break;
        case 4:
        case 5:
          selectedDateInfo.dailyHighMWLTime += durationIndex;
          break;
        default:

      }
      totalRating += _userWorkloadData[date]![i].Rating;
    }

    selectedDateInfo.averageMWLRating = totalRating/_userWorkloadData[date]!.length;
    selectedDateInfo.averageDuration = selectedDateInfo.totalDailyDuration/_userWorkloadData[date]!.length;

    notifyListeners();
  }

  void calculateCompareInfo(String date){
    //reset
    compareDateInfo.reset();
    
    //check null
    if(_userWorkloadData[date] == null){
      return;
    }

    double durationIndex = 0;
    double totalRating = 0;
    //calculation
    for(int i=0; i<_userWorkloadData[date]!.length; i++){
      durationIndex = double.parse(_userWorkloadData[date]![i].DurationHours);
      if(i == 1) compareDateInfo.dailyMinDuration = durationIndex;
      compareDateInfo.totalDailyDuration += durationIndex;

      if(durationIndex < compareDateInfo.dailyMinDuration){
        compareDateInfo.dailyMinDuration = durationIndex;
      }
      if(durationIndex > compareDateInfo.dailyMaxDuration){
        compareDateInfo.dailyMaxDuration = durationIndex;
      }

      switch(_userWorkloadData[date]![i].Rating){
        case 1:
        case 2:
          compareDateInfo.dailyLowMWLTime += durationIndex;
          break;
        case 3:
          compareDateInfo.dailyMediMWLTime += durationIndex;
          break;
        case 4:
        case 5:
          compareDateInfo.dailyHighMWLTime += durationIndex;
          break;
        default:

      }
      totalRating += _userWorkloadData[date]![i].Rating;
    }

    compareDateInfo.averageMWLRating = totalRating/_userWorkloadData[date]!.length;
    compareDateInfo.averageDuration = compareDateInfo.totalDailyDuration/_userWorkloadData[date]!.length;

    notifyListeners();
  }

  void calculateRangeInfo(){
    //reset
    rangeInfo.reset();

    //Check empty
    if(_rangeRatings.isNotEmpty){
      double durationIndex = 0;
      double totalRating = 0;
      //calculation
      for(int i=0; i<_rangeRatings.length; i++){
        durationIndex = double.parse(_rangeRatings[i].DurationHours);
        if(i == 1) rangeInfo.dailyMinDuration = durationIndex;
        rangeInfo.totalDailyDuration += durationIndex;

        if(durationIndex < rangeInfo.dailyMinDuration){
          rangeInfo.dailyMinDuration = durationIndex;
        }
        if(durationIndex > rangeInfo.dailyMaxDuration){
          rangeInfo.dailyMaxDuration = durationIndex;
        }

        switch(_rangeRatings[i].Rating){
          case 1:
          case 2:
            rangeInfo.dailyLowMWLTime += durationIndex;
            break;
          case 3:
            rangeInfo.dailyMediMWLTime += durationIndex;
            break;
          case 4:
          case 5:
            rangeInfo.dailyHighMWLTime += durationIndex;
            break;
          default:

        }
        totalRating += _rangeRatings[i].Rating;
      }

      rangeInfo.averageMWLRating = totalRating/_rangeRatings.length;
      rangeInfo.averageDuration = rangeInfo.totalDailyDuration/_rangeRatings.length;

      notifyListeners();
    }
  }
}