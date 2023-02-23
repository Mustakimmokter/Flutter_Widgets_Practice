
import 'package:flutter/material.dart';
import 'package:widget_practice_one/iu/app_helper/my_ticker_provider.dart';

class WidgetsProvider extends ChangeNotifier {
  WidgetsProvider (){
    _myTickerProvider = MyTickerProvider();
    _myTabController();
  }


  TabController? _tabController;
  MyTickerProvider? _myTickerProvider;
  TimeOfDay? _time;
  DateTime? _date;

  TimeOfDay? get time => _time;
  DateTime? get date => _date;
  TabController? get tabController => _tabController;

  Future<void> getTime(BuildContext context)async{
    final pickTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if(pickTime != null){
      _time = pickTime;
    }
    notifyListeners();
  }


  Future<void> getDate(BuildContext context)async{
    final pickDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2050),
    );
    if(pickDate != null){
      _date = pickDate;
    }
    notifyListeners();
  }


  void _myTabController(){
    _tabController = TabController(length: 3, vsync: _myTickerProvider!,initialIndex: 0);
  }

  
}