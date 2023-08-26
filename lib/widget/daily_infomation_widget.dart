import 'package:flutter/material.dart';
import 'package:prototype/bloc/data_provider/workload_data_provider.dart';
import 'package:provider/provider.dart';

class DailyInformationWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    TextStyle informationStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w500
    );
    TextStyle unitStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    );
    
    return Container(
      height: 180,
      padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Title
          Text('Daily Information:',
            style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 24, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          ),

          //Data
          //Activity Duration
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Activity Duration',style: informationStyle,),
                  Text('(Min / Max)',style: unitStyle,),
                  Text(':',style: informationStyle,),
                ],
              ),
              Text('${context.watch<WorkloadDataProvider>().selectedDateInfo.dailyMinDuration}h / ${context.watch<WorkloadDataProvider>().selectedDateInfo.dailyMaxDuration}h',style: informationStyle,),
            ],
          ),

          //Low MWL Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Low MWL Time',style: informationStyle,),
                  Text('(Hours / %)',style: unitStyle,),
                  Text(':',style: informationStyle,),
                ],
              ),
              Text('${context.watch<WorkloadDataProvider>().selectedDateInfo.dailyLowMWLTime}h'
                ' / ${context.watch<WorkloadDataProvider>().selectedDateInfo.percentageL()}%',
                style: informationStyle,
              ),
            ],
          ),

          //Medium MWL Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Medium MWL Time',style: informationStyle,),
                  Text('(Hours / %)',style: unitStyle,),
                  Text(':',style: informationStyle,),
                ],
              ),
              Text('${context.watch<WorkloadDataProvider>().selectedDateInfo.dailyMediMWLTime}h'
                  ' / ${context.watch<WorkloadDataProvider>().selectedDateInfo.percentageM()}%',
                style: informationStyle,
              ),
            ],
          ),

          //High MWL Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('High MWL Time',style: informationStyle,),
                  Text('(Hours / %)',style: unitStyle,),
                  Text(':',style: informationStyle,),
                ],
              ),
              Text('${context.watch<WorkloadDataProvider>().selectedDateInfo.dailyHighMWLTime}h'
                  ' / ${context.watch<WorkloadDataProvider>().selectedDateInfo.percentageH()}%',
                  style: informationStyle,
                ),
            ],
          ),
        ],
      ),
    );
  }

}