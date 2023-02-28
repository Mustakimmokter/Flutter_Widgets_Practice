
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_practice_one/widgets/index.dart';

class WidgetsProvider extends ChangeNotifier {


  TimeOfDay? _time;
  DateTime? _date;
  int _selectedIndex = 0;
  bool _isValue = false;
  final List<bool> _isCheck = List.generate(4, (index) => false);

  TimeOfDay? get time => _time;
  DateTime? get date => _date;
  int get selectedIndex => _selectedIndex;
  List<bool> get isCheck => _isCheck;
  bool get isValue => _isValue;

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




  void getExitDialog(BuildContext context){

    final dialog = Dialog(
      backgroundColor: Colors.white.withOpacity(.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          height: 110,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomText(text: 'Are you sure to exit the app',color: Colors.black87,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    titleSize: 16,
                    verticalPadding: 06,
                    horizontalPadding: 14,
                    backgroundColor: Colors.red,
                    onTap: (){
                   _getAppExit();
                  },title: 'Yes',
                  ),
                  CustomButton(
                    titleSize: 16,
                    verticalPadding: 06,
                    horizontalPadding: 14,
                    onTap: (){
                    Navigator.pop(context);
                  },title: 'No',
                  ),
                ],
              ),
            ],
          ),
        ),
    );
    showDialog(context: context, builder: (context) {
      return dialog;
    },);
  }


  void getSelect(int value){
    _selectedIndex = value;
    notifyListeners();

  }

  void _getAppExit(){
    if(Platform.isIOS){
      try{
        exit(0);
      }catch (iosError){
        print(iosError);
      }
    }else if(Platform.isAndroid){
      try{
        SystemNavigator.pop();
      }catch (ardError){
        print(ardError);
      }
    }
  }

  void getToggle(int index){
    _isCheck[index] =! _isCheck[index];
    notifyListeners();
  }

  
}