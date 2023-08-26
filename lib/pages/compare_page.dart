import 'package:flutter/material.dart';
import 'package:prototype/bloc/selected_date/picked_date_provider.dart';
import 'package:prototype/widget/compare_chart.dart';
import 'package:prototype/widget/compare_detail.dart';
import 'package:prototype/widget/split_line.dart';
import 'package:provider/provider.dart';

class ComparePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  child: IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    }, 
                    icon: Icon(Icons.arrow_back,size: 35,color: Theme.of(context).primaryColor,)
                  ),
                ),
          
                SizedBox(height: 15,),
          
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Dates
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(context.watch<PickedDate>().FormattedSelectedDate_us,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300, color: Theme.of(context).primaryColor, fontStyle: FontStyle.italic),
                        ),
                        Text(' VS ',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Theme.of(context).primaryColor),
                        ),
                        Text(context.watch<PickedDate>().formattedCompaireDate_us,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300, color: Theme.of(context).primaryColor, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
          
                    SizedBox(height: 15,),
          
                    //Chart
                    CompareChartWidget(date: context.watch<PickedDate>().formattedSelectedDate, compare: context.watch<PickedDate>().formattedCompaireDate),
          
                    SplitLine(),
          
                    //Details
                    CompareDetail(),
          
                    SizedBox(height: 5,),
          
                    SplitLine(),
          
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Back to",style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[700]),),
                    
                    
                        GestureDetector(
                          child: Text(
                            " daily information. ", 
                            style: TextStyle(
                                    fontWeight: FontWeight.w500, 
                                    decoration: TextDecoration.underline, 
                                    fontStyle: FontStyle.italic, 
                                    color: Colors.grey[700],
                                  )
                           ),
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                                    ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}