import 'package:flutter/material.dart';
import 'package:widget_practice_one/widgets/custom_header.dart';
import 'package:widget_practice_one/widgets/index.dart';

class TableAndDatatable extends StatefulWidget {
  const TableAndDatatable({Key? key}) : super(key: key);

  @override
  State<TableAndDatatable> createState() => _TableAndDatatableState();
}

class _TableAndDatatableState extends State<TableAndDatatable> {

  final List<DataModel> _tableData = [
    const DataModel(name: '', address: '', profession: ''),
    const DataModel(name: 'Saddam', address: 'Narsingdi', profession: 'Teacher'),
    const DataModel(name: 'Jowel', address: 'Malaysia', profession: 'Immigrant'),
    const DataModel(name: 'Saiful', address: 'Malaysia', profession: 'Immigrant'),
    const DataModel(name: 'Mishu', address: 'Dhaka', profession: 'Marketer'),
    const DataModel(name: 'Rayhan', address: 'Dhaka', profession: 'Developer'),
    const DataModel(name: 'Kawser', address: 'Narsingdi', profession: 'Unemployed'),
    const DataModel(name: 'Khairul', address: 'Malaysia', profession: 'Immigrant'),
  ];

  final List<String> _tableHeader = ['ID','Name','Address','Profession'];
  bool _isTrueFalse = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            const CustomHeader(title: 'Table and Datatable'),
            const SizedBox(height: 20),
            Table(
              textDirection: TextDirection.ltr,
              border: TableBorder.all(),
              children: List.generate(_tableData.length, (index) {
                final _data = _tableData[index];
                return TableRow(
                    children: [
                      CustomText(text: index == 0? 'ID' : '$index',size: index == 0?17:15,),
                      CustomText(text: index == 0? 'Name' : _data.name,size: index == 0?17:15,),
                      CustomText(text: index == 0? 'Address' : _data.address,size: index == 0?17:15,),
                      CustomText(text: index == 0? 'Profession' : _data.profession,size: index == 0?17:15,),
                    ]
                );
              }),
            ),
            SizedBox(height: 30),
            DataTable(
              onSelectAll: (value){
                setState(() {
                  _isTrueFalse = value!;
                });
              },
              columnSpacing: 14,
              border: TableBorder.all(),
              columns: List.generate(_tableHeader.length, (index){
                return DataColumn(label: CustomText(text: _tableHeader[index],));
              }),
              rows: List.generate(_tableData.length - 1, (index){
                return DataRow(
                  color: _isTrueFalse? MaterialStatePropertyAll(Colors.blue.shade200) : null,
                  // selected: _isTrueFalse,
                  // onSelectChanged: (value){
                  //  setState(() {
                  //    _isTrueFalse = value!;
                  //  });
                  // },
                  cells: [
                    DataCell(CustomText(text: '${index + 1}',size: 15,)),
                    DataCell(CustomText(text: _tableData[index + 1].name,size: 15,)),
                    DataCell(CustomText(text: _tableData[index + 1].address,size: 15,)),
                    DataCell(CustomText(text: _tableData[index +1].profession,size: 15,)),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}







class DataModel {
  const DataModel({
    required this.name,
    required this.address,
    required this.profession,
    this.isTrueFalse = false,
  });

  final String name, address, profession;
  final bool? isTrueFalse;
}
