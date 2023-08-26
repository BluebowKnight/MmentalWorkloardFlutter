
//import 'dart:js';

import 'package:prototype/bloc/data_provider/workload_data_provider.dart';
import 'package:prototype/model/workload_rating.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';


//Test
class ChartData{
  final num x;
  final num y;
  final num? size;
  ChartData(this.x,this.y,[this.size]);
}
//Test
List<ChartData> chartData = <ChartData>[
  ChartData(2.2, 3.8, 1.347),
  ChartData(4, 2.5, 1.241),
  ChartData(5.5, 5.0, 5),
  ChartData(1, 1.2, 2),
];

class BubbleChartWidget extends StatelessWidget{

  //final List<UserWorkingData> workingData;
  final String date;
  const BubbleChartWidget({
    super.key,
    //required this.workingData,
    required this.date
  });

  //Convert to Bubble
  List<ChartData> generateBubbles(List<WorkloadRating>? data){
    List<ChartData> bubbleData = [];
    if(data != null){
      for(int i = 0; i < data.length; i++){
        bubbleData.add(ChartData(data[i].Rating, double.parse(data[i].DurationHours), data[i].Rating*double.parse(data[i].DurationHours)));
      }
    }
  
    return bubbleData;
  }

  @override
  Widget build(BuildContext context) {

    //JavaAnalyzers analyzers = JavaMethod_Provider.of(context);
    return Container(
      height: 320.0,
      child:Column(
        children: [
          /*label*/
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Average Rating
                Text('Average Rating: ${context.watch<WorkloadDataProvider>().selectedDateInfo.averageMWLRating}',style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.w500,fontSize: 12.0,letterSpacing: 0.1,),),

                //Activity
                Row(
                  children: [
                    Text('Activity:',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w500,fontSize: 12.0,letterSpacing: 0.1,),),
                    Icon(Icons.circle,color: Colors.green,size: 18,)
                  ],
                ),

                //Average Duration
                Text('Average Duration: ${context.watch<WorkloadDataProvider>().selectedDateInfo.averageDuration}',style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.w500,fontSize: 12.0,letterSpacing: 0.1,),),
              ],
            ),
          ),

          /*Chart*/
          Container(
              child: SfCartesianChart(
                selectionType: SelectionType.series,
                primaryXAxis: NumericAxis(
                  title: AxisTitle(text: 'Working Rate'),
                  majorGridLines: const MajorGridLines(width: 0),
                  minimum: 0,
                  maximum: 6,
                ),
                primaryYAxis: NumericAxis(
                  title: AxisTitle(text: 'Duration'),
                  majorGridLines: const MajorGridLines(width: 0),
                  minimum: 0,
                  maximum: 6,
                ),
                series: <BubbleSeries<ChartData, num>>[
                  BubbleSeries<ChartData,num>(
                    dataSource: generateBubbles(context.watch<WorkloadDataProvider>().selectedDateRatings(date)),
                    sizeValueMapper: (ChartData data, _) =>data.size,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    pointColorMapper: (ChartData data, _){
                      if(data.x*data.y<3){
                        return Colors.lightGreen.shade300;
                      }else if(data.x*data.y>8){
                        return Colors.green;
                      }else{
                        return Colors.lightGreen;
                      }
                    },
                  )
                ],
              )
          ),
        ],
      )
    );
  }
}