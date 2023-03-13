import 'package:hive/hive.dart';
import 'package:widget_practice_one/db/table.dart';

class DbHelper {

  static Future<void> createTable()async{
    await Hive.openBox<dynamic>(DbTables.userInfo);
    await Hive.openBox(DbTables.userData);
  }


 static void saveData(String table,String key, dynamic data){
    final box = Hive.box<dynamic>(table);
    box.put(key, data);
 }

 static void deleteDataOne(String table,String key){
    final box = Hive.box(table);
    box.delete(key);
 }

 static dynamic getDataOne(String table,String key){
    final box = Hive.box<dynamic>(table);
    final dynamic data = box.get(key);
    return data ?? '';
 }


 // As a index

 static void addData(String table,String value){
    final box = Hive.box<dynamic>(table);
    box.add(value);
 }

 static dynamic getDataTwo(String table,int index){
    final box = Hive.box<dynamic>(table);
    final data = box.getAt(index);
    return data ?? '';
 }

 static int getDataLength(String table){
    final box = Hive.box<dynamic>(table);
    return box.isNotEmpty ? box.length : 0;
 }

 static void deleteDataTwo(String table,int index){
    final box = Hive.box<dynamic>(table);
    box.deleteAt(index);
 }

}