import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DataListener extends ChangeNotifier {


  void getDataListen(String table){
    Hive.box<dynamic>(table).listenable();
    notifyListeners();
  }

}