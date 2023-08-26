import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class PickedDate with ChangeNotifier{
  DateTime _today = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  DateTime _compareDate = DateTime.now();
  DateTime _rangeStart = DateTime.now().subtract(Duration(days: 1));
  DateTime _rangeEnd = DateTime.now();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  final DateFormat _usFormat = DateFormat.yMMMd('en_US');

  String get formattedSelectedDate => _dateFormat.format(_selectedDate);
  String get FormattedSelectedDate_us => _usFormat.format(_selectedDate);

  String get formattedCompaireDate => _dateFormat.format(_compareDate);
  String get formattedCompaireDate_us => _usFormat.format(_compareDate);

  String get formattedRangeStart => _dateFormat.format(_rangeStart);
  String get formattedRangeStart_us => _usFormat.format(_rangeStart);

  String get formattedRangeEnd => _dateFormat.format(_rangeEnd);
  String get formattedRangeEnd_us => _usFormat.format(_rangeEnd);

  DateTime get selectedDate => _selectedDate;
  DateTime get compareDate => _compareDate;

  DateTime get rangeStart => _rangeStart;
  DateTime get rangeEnd => _rangeEnd;

  set selectedDate(DateTime date){
    _selectedDate = date;
    notifyListeners();
  }

  set compaireDate(DateTime date){
    _compareDate = date;
    notifyListeners();
  }

  void setSelectedDate(DateTime date){
    _selectedDate = date;
    notifyListeners();
  }

  void setCompareDate(DateTime date){
    _compareDate = date;
    notifyListeners();
  }

  void setRangeStart(DateTime date){
    _rangeStart = date;
    notifyListeners();
  }

  void setRangeEnd(DateTime date){
    _rangeEnd = date;
    notifyListeners();
  }

  bool isToday() => (_selectedDate.day == _today.day && _selectedDate.month == _today.month && _selectedDate.year == _today.year);
}