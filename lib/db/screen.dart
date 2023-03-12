import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:widget_practice_one/db/local_db.dart';
import 'package:widget_practice_one/db/table.dart';
import 'package:widget_practice_one/widgets/custom_header.dart';
import 'package:widget_practice_one/widgets/index.dart';

class LocalDataBase extends StatefulWidget {
  const LocalDataBase({Key? key}) : super(key: key);

  @override
  State<LocalDataBase> createState() => _LocalDataBaseState();
}

class _LocalDataBaseState extends State<LocalDataBase> {

  final _dataController = TextEditingController();
  int dataIndex = 0;

  @override
  void initState() {
    super.initState();
    print(DbHelper.getDataTwo(DbTables.userData, 0));
    setState(() {
      for(int a = 0; a < Hive.box<dynamic>(DbTables.userData).length; a++){
        print(DbHelper.getDataTwo(DbTables.userData, a));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            const CustomHeader(title: 'Local Data const Base',backgroundColor: Colors.green,),
           Expanded(
             child:  Stack(
               children: [
                 Positioned(
                   left: 20,
                   right: 20,
                   child: TextField(
                     controller: _dataController,
                     decoration: const InputDecoration(
                       contentPadding: EdgeInsets.only(top: 12),
                       hintText: 'Create Data'
                     ),
                     onChanged: (value){
                       value = _dataController.text;
                     },
                   ),
                 ),
                 Positioned(
                   left: 20,
                   right: 20,
                   top: 65,
                   child: CustomButton(
                     title: 'Save Data',
                     onTap: (){
                       DbHelper.addData(DbTables.userData,_dataController.text);
                       _dataController.clear();
                     },
                   ),
                 ),
                 Positioned(
               left: 20,
               right: 20,
               top: 120,
               child: SizedBox(
                 height: size.height / 1.4,
                 child: ListView.builder(
                   padding: const EdgeInsets.symmetric(vertical: 20),
                   itemCount: Hive.box(DbTables.userData).length,
                   itemBuilder: (context, index) {
                     final data = DbHelper.getDataTwo(DbTables.userData, index);
                     return Card(
                       elevation: 5,
                       shadowColor: Colors.grey.shade200,
                       child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 16),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             CustomText(text: '${index + 1}'),
                             CustomText(text: data),
                             Row(
                               children: [
                                 IconButton(
                                     onPressed: (){
                                       showDialog(context: context, builder: (context) {
                                         final updateController = TextEditingController(text: data);
                                         return showDialogBox(
                                           controller: updateController,
                                           onChanged: (value){
                                             value = updateController.text;
                                           },
                                           onTap: (){
                                             Hive.box(DbTables.userData).putAt(index, updateController.text);
                                             Navigator.pop(context);
                                             updateController.clear();
                                           },
                                         );
                                       },);
                                     },
                                   iconSize: 20,
                                   splashRadius: 20,
                                   icon: const Icon(Icons.edit,color: Colors.green,),
                                 ),
                                 IconButton(
                                     onPressed: (){
                                       DbHelper.deleteDataTwo(DbTables.userData, index);
                                     },
                                   iconSize: 20,
                                   splashRadius: 20,
                                   icon: const Icon(Icons.delete,color: Colors.red,),
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ),
                     );
                   },
                 ),
               ),
             ),
               ],
             ),
           ),

          ],
        ),

      ),
    );
  }

  Widget showDialogBox({
    required TextEditingController controller,
    required Function(String) onChanged,
    required VoidCallback onTap,
  }){
    return  AlertDialog(
      title:TextField(
        controller: controller,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(top: 12),
            hintText: 'Create Data'
        ),
        onChanged: onChanged,
      ),
      content: SizedBox(
        height: 45,
        child: CustomButton(
          onTap: onTap,
          title: 'Update Data',
          titleSize: 16,
        ),
      ),
    );
  }
}

