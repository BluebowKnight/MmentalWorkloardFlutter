import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prototype/bloc/selected_date/picked_date_provider.dart';
import 'package:prototype/bloc/data_provider/workload_data_provider.dart';
import 'package:prototype/pages/compare_page.dart';
import 'package:provider/provider.dart';

class CalendarCompareWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CalendarCompareWidget();

}

class _CalendarCompareWidget extends State<CalendarCompareWidget>{
  final DateTime firstDate = DateTime(1900,1);
  final DateTime lastDate = DateTime(DateTime.now().year,12);

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      );

    return Center(
      //Calendar Picker
      child: Hero(
        tag: 'Compare calendar',
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Material(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Container(
              height: 500.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Compare with: \n${DateFormat.yMMMMd('en_US').format(context.watch<PickedDate>().compareDate)}', style: textStyle,textAlign: TextAlign.center,),
        
                  SizedBox(height: 10.0,),
        
                  CalendarDatePicker(
                    initialDate: context.watch<PickedDate>().compareDate,
                    firstDate: firstDate,
                    lastDate: lastDate,
                    currentDate: context.watch<PickedDate>().selectedDate,
                    onDateChanged: (DateTime value){
                      context.read<PickedDate>().setCompareDate(value);
                      context.read<WorkloadDataProvider>().calculateCompareInfo(DateFormat("yyyy-MM-dd").format(value));
                      setState(() {
        
                      });
                    },
                    
                  ),
        
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ComparePage()));
                    }, 
                    child: Text('Compare'),
        
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}