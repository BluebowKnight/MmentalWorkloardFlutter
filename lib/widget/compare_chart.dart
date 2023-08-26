
//import 'dart:js';

import 'package:prototype/bloc/data_provider/workload_data_provider.dart';
import 'package:prototype/model/workload_rating.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';


//Test
class ChartData{
  String date;
  final num x;
  final num y;
  final num? size;
  ChartData(this.date, this.x,this.y,[this.size]);
}
//Test
List<ChartData> chartData = <ChartData>[
  ChartData('',2.2, 3.8, 1.347),
  ChartData('',4, 2.5, 1.241),
  ChartData('',5.5, 5.0, 5),
  ChartData('',1, 1.2, 2),
];

class CompareChartWidget extends StatelessWidget{
  String date;
  String compare;
  CompareChartWidget({super.key, required this.date, required this.compare});

  //final List<UserWorkingData> workingData;
  //Convert to Bubble
  List<ChartData> generateBubbles(List<WorkloadRating>? data, List<WorkloadRating>? data2){
    List<ChartData> bubbleData = [];
    if(data != null){
      for(int i = 0; i < data.length; i++){
        bubbleData.add(ChartData(data[i].Date, data[i].Rating, double.parse(data[i].DurationHours), data[i].Rating*double.parse(data[i].DurationHours)));
      }
      print(bubbleData[0].date);
    }
    if(data2!=null){
      for(int i = 0; i < data2.length; i++){
        bubbleData.add(ChartData(data2[i].Date, data2[i].Rating, double.parse(data2[i].DurationHours), data2[i].Rating*double.parse(data2[i].DurationHours)));
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
                //Activity A
                Row(
                  children: [
                    Text('Activity ($date):',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w500,fontSize: 12.0,letterSpacing: 0.1,),),
                    Icon(Icons.circle,color: Colors.green,size: 18,)
                  ],
                ),

                //Activity B
                Row(
                  children: [
                    Text('Activity ($compare):',style: TextStyle(color: Colors.orange.shade300,fontWeight: FontWeight.w500,fontSize: 12.0,letterSpacing: 0.1,),),
                    Icon(Icons.circle,color: Colors.orange.shade300,size: 18,)
                  ],
                ),
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
                    dataSource: generateBubbles(context.watch<WorkloadDataProvider>().selectedDateRatings(date), context.watch<WorkloadDataProvider>().selectedDateRatings(compare)),
                    sizeValueMapper: (ChartData data, _) =>data.size,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    opacity: 0.7,
                    pointColorMapper: (ChartData data, _){
                      if(data.date == date)
                        {if(data.x*data.y<3){
                          return Colors.lightGreen.shade300;
                        }else if(data.x*data.y>8){
                          return Colors.green;
                        }else{
                          return Colors.lightGreen;
                        }
                      }else{
                        {if(data.x*data.y<3){
                          return Colors.yellow[200];
                        }else if(data.x*data.y>8){
                          return Colors.orange.shade300;
                        }else{
                          return Colors.yellow;
                          }
                        }
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