import 'package:flutter/material.dart';
import 'package:prototype/bloc/selected_date/picked_date_provider.dart';
import 'package:prototype/widget/calendar_range.dart';
import 'package:prototype/widget/review_chart.dart';
import 'package:prototype/widget/review_detail.dart';
import 'package:prototype/widget/split_line.dart';
import 'package:provider/provider.dart';

class ReviewPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ReviewPage();
  }

}

class _ReviewPage extends State<ReviewPage>{
  
  //final DateTime firstDate = DateTime(1900,1);
  //final DateTime lastDate = DateTime(DateTime.now().year,12);
  //Show Calendar
  bool bShowCalendar = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text('${context.watch<PickedDate>().formattedRangeStart_us}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Theme.of(context).primaryColor, letterSpacing: 0.1),),

              IconButton(
                        onPressed: (){
                          // DateTimeRange? range = await showDateRangePicker(context: context, firstDate: firstDate, lastDate: lastDate);
                          // if(range != null){
                          //   context.read<PickedDate>().setRangeStart(range.start);
                          //   context.read<PickedDate>().setRangeEnd(range.end);
                          // }
                          bShowCalendar = !bShowCalendar;
                          setState(() {
                            
                          });
                        },
                        icon: !bShowCalendar?
                          Icon(
                            Icons.calendar_month_outlined,
                            color: Theme.of(context).colorScheme.primary,
                            size: 35.0,
                          ):
                          Icon(
                            Icons.check_box_outlined,
                            color: Theme.of(context).colorScheme.primary,
                            size: 35.0,
                          ),
              ),

              Text('${context.watch<PickedDate>().formattedRangeEnd_us}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Theme.of(context).primaryColor, letterSpacing: 0.1),),
            ],
          ),

          SizedBox(height: 5.0,),

          bShowCalendar?
          CalendarRange():
          ReviewChartWidget(start: context.watch<PickedDate>().rangeStart, end: context.watch<PickedDate>().rangeEnd,),

          SplitLine(),

          ReviewDetail(),
        ]
      ),
    );
  }

}