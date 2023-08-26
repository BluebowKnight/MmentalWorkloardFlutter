import 'package:flutter/material.dart';
import 'package:prototype/bloc/data_provider/sleep_data_provider.dart';
import 'package:prototype/bloc/data_provider/workload_data_provider.dart';
import 'package:prototype/bloc/selected_date/picked_date_provider.dart';
import 'package:provider/provider.dart';

class CompareDetail extends StatelessWidget{

  TextStyle informationStyle(Color color) =>
    TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.w500
    );

  TextStyle unitStyle(Color color) => 
    TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    );

  @override
  Widget build(BuildContext context) {

    String selected = context.watch<PickedDate>().formattedSelectedDate;
    String compare = context.watch<PickedDate>().formattedCompaireDate;

    

    
    return Container(
      height: 270,
      padding: EdgeInsets.symmetric(horizontal: 20.0, ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Title
          Text('Details:',
            style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 24, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          ),

          //Sleep Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sleep Rating:', style: informationStyle(Theme.of(context).primaryColor),),
              Row(
                children: [
                  Text('${context.watch<SleepDataProvider>().selectedDateRating(selected)?.Rating}', style: informationStyle(Colors.green),),
                  Text(' / ', style: informationStyle(Theme.of(context).primaryColor),),
                  Text('${context.watch<SleepDataProvider>().selectedDateRating(compare)?.Rating}', style: informationStyle(Colors.orange.shade300),),
                ],
              ),
            ],
          ),

          //Average MWL Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Average MWL Rating:', style: informationStyle(Theme.of(context).primaryColor),),
              Row(
                children: [
                  Text('${context.watch<WorkloadDataProvider>().selectedDateInfo.averageMWLRating}', style: informationStyle(Colors.green),),
                  Text(' / ', style: informationStyle(Theme.of(context).primaryColor),),
                  Text('${context.watch<WorkloadDataProvider>().compareDateInfo.averageMWLRating}', style: informationStyle(Colors.orange.shade300),),
                ],
              ),
            ],
          ),

          //Average Duration Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Average Duration Rating:', style: informationStyle(Theme.of(context).primaryColor),),
              Row(
                children: [
                  Text('${context.watch<WorkloadDataProvider>().selectedDateInfo.averageDuration}', style: informationStyle(Colors.green),),
                  Text(' / ', style: informationStyle(Theme.of(context).primaryColor),),
                  Text('${context.watch<WorkloadDataProvider>().compareDateInfo.averageDuration}', style: informationStyle(Colors.orange.shade300),),
                ],
              ),
            ],
          ),

          //Low MWL Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Low MWL Time ', style: informationStyle(Theme.of(context).primaryColor),),
                  Text('(%)', style: unitStyle(Theme.of(context).primaryColor),),
                  Text(":", style: informationStyle(Theme.of(context).primaryColor),),
                ],
              ),
              Row(
                children: [
                  Text(context.watch<WorkloadDataProvider>().selectedDateInfo.percentageL(), style: informationStyle(Colors.green),),
                  Text(' / ', style: informationStyle(Theme.of(context).primaryColor),),
                  Text(context.watch<WorkloadDataProvider>().compareDateInfo.percentageL(), style: informationStyle(Colors.orange.shade300),),
                ],
              ),
            ],
          ),

          //Medium MWL Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Meium MWL Time ', style: informationStyle(Theme.of(context).primaryColor),),
                  Text('(%)', style: unitStyle(Theme.of(context).primaryColor),),
                  Text(":", style: informationStyle(Theme.of(context).primaryColor),),
                ],
              ),
              Row(
                children: [
                  Text(context.watch<WorkloadDataProvider>().selectedDateInfo.percentageM(), style: informationStyle(Colors.green),),
                  Text(' / ', style: informationStyle(Theme.of(context).primaryColor),),
                  Text(context.watch<WorkloadDataProvider>().compareDateInfo.percentageM(), style: informationStyle(Colors.orange.shade300),),
                ],
              ),
            ],
          ),

          //High MWL Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('High MWL Time ', style: informationStyle(Theme.of(context).primaryColor),),
                  Text('(%)', style: unitStyle(Theme.of(context).primaryColor),),
                  Text(":", style: informationStyle(Theme.of(context).primaryColor),),
                ],
              ),
              Row(
                children: [
                  Text(context.watch<WorkloadDataProvider>().selectedDateInfo.percentageH(), style: informationStyle(Colors.green),),
                  Text(' / ', style: informationStyle(Theme.of(context).primaryColor),),
                  Text(context.watch<WorkloadDataProvider>().compareDateInfo.percentageH(), style: informationStyle(Colors.orange.shade300),),
                ],
              ),
            ],
          )
        ]
      ),
    );
  }

}