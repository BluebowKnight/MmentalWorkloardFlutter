import 'package:flutter/material.dart';
import 'package:prototype/bloc/data_provider/workload_data_provider.dart';
import 'package:prototype/bloc/selected_date/picked_date_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarRange extends StatelessWidget{
  final DateTime firstDate = DateTime(1900,1);
  final DateTime lastDate = DateTime(DateTime.now().year,12);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.0,
      //Calendar Picker
      child: SfDateRangePicker(
        initialSelectedDate: context.watch<PickedDate>().rangeStart,
        selectionMode: DateRangePickerSelectionMode.range,
        initialSelectedRange: PickerDateRange(context.watch<PickedDate>().rangeStart, context.watch<PickedDate>().rangeEnd),

        onSelectionChanged: (DateRangePickerSelectionChangedArgs args){
          if(args.value is PickerDateRange){
            context.read<PickedDate>().setRangeStart(args.value.startDate);
            context.read<PickedDate>().setRangeEnd(args.value.endDate??args.value.startDate);
            context.read<WorkloadDataProvider>().reloadRangeDateRatings(args.value.startDate, args.value.endDate??args.value.startDate);
          }
        },
      ),
    );
  }
}