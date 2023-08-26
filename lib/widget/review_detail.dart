import 'package:flutter/material.dart';
import 'package:prototype/bloc/data_provider/workload_data_provider.dart';
import 'package:provider/provider.dart';

class ReviewDetail extends StatelessWidget{

  TextStyle _detailStyle(BuildContext context, double size){
    return TextStyle(
      fontSize: size,
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    );
  }

  TextStyle _unitStyle(BuildContext context){
    return TextStyle(
      fontSize: 14,
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Title
          Text('More Details:', style: _detailStyle(context, 24),),

          //Duration
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Duration', style: _detailStyle(context, 14),),
                  Text('(Min / Max)', style: _unitStyle(context),),
                  Text(':', style: _detailStyle(context, 14),),
                ],
              ),

              Text('${context.watch<WorkloadDataProvider>().rangeInfo.dailyMinDuration}h / ${context.watch<WorkloadDataProvider>().rangeInfo.dailyMaxDuration}h', style: _detailStyle(context, 14),),
            ],
          ),

          //Low MWL Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Low MWL Time', style: _detailStyle(context, 14),),
                  Text('(hours / %)', style: _unitStyle(context),),
                  Text(':', style: _detailStyle(context, 14),),
                ],
              ),

              Text('${context.watch<WorkloadDataProvider>().rangeInfo.dailyLowMWLTime}h / ${context.watch<WorkloadDataProvider>().rangeInfo.percentageL()}%', style: _detailStyle(context, 14),),
            ],
          ),

          //Medium MWL Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Medium MWL Time', style: _detailStyle(context, 14),),
                  Text('(hours / %)', style: _unitStyle(context),),
                  Text(':', style: _detailStyle(context, 14),),
                ],
              ),

              Text('${context.watch<WorkloadDataProvider>().rangeInfo.dailyMediMWLTime}h / ${context.watch<WorkloadDataProvider>().rangeInfo.percentageM()}%', style: _detailStyle(context, 14),),
            ],
          ),

          //High MWL Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Low MWL Time', style: _detailStyle(context, 14),),
                  Text('(hours / %)', style: _unitStyle(context),),
                  Text(':', style: _detailStyle(context, 14),),
                ],
              ),

              Text('${context.watch<WorkloadDataProvider>().rangeInfo.dailyHighMWLTime} / ${context.watch<WorkloadDataProvider>().rangeInfo.percentageH()}%', style: _detailStyle(context, 14),),
            ],
          ),
        ],
      ),
    );
  }

}