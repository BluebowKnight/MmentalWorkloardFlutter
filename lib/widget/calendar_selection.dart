import 'package:flutter/material.dart';
import 'package:prototype/bloc/selected_date/picked_date_provider.dart';
import 'package:provider/provider.dart';

// class CalendarSelectionWidget extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() => _CalendarSelectionWidget();

// }

// class _CalendarSelectionWidget extends State<CalendarSelectionWidget>{
//   final DateTime firstDate = DateTime(1900,1);
//   final DateTime lastDate = DateTime(DateTime.now().year,12);

//   Function(DateTime) onDateChanged;
//   _CalendarSelectionWidget({required this.onDateChanged});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 340.0,
//       //Calendar Picker
//       child: CalendarDatePicker(
//         initialDate: context.watch<PickedDate>().selectedDate,
//         firstDate: firstDate,
//         lastDate: lastDate,
//         onDateChanged: (DateTime value) {
//           setState(() {
//             context.read<PickedDate>().setSelectedDate(value);
//             context.read<WorkloadDataProvider>().calculateDailyInfo(DateFormat("yyyy-MM-dd").format(value));
//           });
//         },),
//     );
//   }

// }

class CalendarSelectionWidget extends StatelessWidget{
  final DateTime firstDate = DateTime(1900,1);
  final DateTime lastDate = DateTime(DateTime.now().year,12);

  Function(DateTime) onDateChanged;
  CalendarSelectionWidget({required this.onDateChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.0,
      //Calendar Picker
      child: CalendarDatePicker(
        initialDate: context.watch<PickedDate>().selectedDate,
        firstDate: firstDate,
        lastDate: lastDate,
        onDateChanged: (DateTime value) {
          onDateChanged(value);
        },),
    );
  }

}