import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

class WorkRateData{
  String workRate;
  String duration;

  WorkRateData(this.workRate, this.duration);

  factory WorkRateData.fromJson(Map<String, dynamic>json){
    return WorkRateData(json['workRate'], json['duration']);
  }
}

class JavaAnalyzers{
  static const MethodChannel _wrChannel = MethodChannel('com.example.prototype/workRate_Analyzer');
  static const MethodChannel _srChannel = MethodChannel('com.example.prototype/sleepRate_Analyzer');

  Future<List<WorkRateData>> javaAnalyzingWorkRate(String date) async{
    List<WorkRateData> workData = [];
    try{
      final result = await _wrChannel.invokeMethod('WorkingRates',{'date':date});
      final List<dynamic> jsonReceived = jsonDecode(result);
      for (int i = 0; i < jsonReceived.length; i++){
        workData.add(WorkRateData.fromJson(jsonReceived[i]));
      }
      return workData;
    }catch(e){
      print(e);
      return [];
    }
  }
}