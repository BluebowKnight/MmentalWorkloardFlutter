
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prototype/bloc/selected_date/picked_date_provider.dart';
import 'package:prototype/bloc/data_provider/workload_data_provider.dart';
import 'package:prototype/widget/bubble_chart.dart';
import 'package:prototype/widget/calendar_compare.dart';
import 'package:prototype/widget/calendar_selection.dart';
import 'package:prototype/widget/daily_infomation_widget.dart';
import 'package:prototype/widget/hero_dialog_route.dart';
import 'package:prototype/widget/sleep_rating_widget.dart';
import 'package:prototype/widget/split_line.dart';
import 'package:provider/provider.dart';

class TodayPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Today_Page();
  }
}

class _Today_Page extends State<TodayPage>{
  
  //Date
  DateTime today = DateTime.now();

  //Show Calendar
  bool bShowCalendar = false;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          /*Date*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: (){
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
    
                    Text(
                       context.watch<PickedDate>().FormattedSelectedDate_us,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),

                /*Bubble Chart / Calendar*/
                !bShowCalendar?
                    BubbleChartWidget(date: context.watch<PickedDate>().formattedSelectedDate,):
                    CalendarSelectionWidget(
                      onDateChanged: (DateTime value){
                        context.read<PickedDate>().setSelectedDate(value);
                        context.read<WorkloadDataProvider>().calculateDailyInfo(DateFormat("yyyy-MM-dd").format(value));
                        // setState(() {
                          
                        // });
                      },
                      ),
    
                //Split Line
                /*Container(
                  color: Colors.grey[300],
                  height: 2.0,
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                ),*/

                SplitLine(),
    
                /*Sleeping Rate*/
                SleepRatingWidget(),
    
                //SplitLine
                SplitLine(),
    
                //Daily Information
                DailyInformationWidget(),
    
                //SplitLine
                SplitLine(),

                SizedBox(height: 10.0,),

                //Compaire with
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Compare with ",style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[700]),),

                    Stack(
                      children: [
                        Text(
                          "select data.", 
                          style: TextStyle(
                                    fontWeight: FontWeight.w500, 
                                    decoration: TextDecoration.underline, 
                                    fontStyle: FontStyle.italic, 
                                    color: Colors.black
                                  )
                        ),
                        GestureDetector(
                          child: Hero(
                            tag: 'Compare calendar',
                            child: Container(
                              height: 25.0,
                              width: 85.0,
                              color: Color.fromRGBO(255, 255, 255,0.25),
                            )
                          ),
                          onTap: (){
                            print('tab');
                            Navigator.of(context).push(
                              HeroDialogRoute(
                                builder: (context){
                                  return CalendarCompareWidget();
                                }
                              )
                            );
                            setState(() {
                              
                            });
                          },
                        ),
                        
                      ],
                    ),
                  ],
                )
        ],
      ),
    );
  }

}