import 'package:flutter/material.dart';
import 'package:widget_practice_one/http_services/http.dart';
import 'package:widget_practice_one/http_services/models/users.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  List<Users>? _userData = [];

  Future<void> getData()async{
    _userData = await HttpResponse.getData('https://dummyjson.com/users');
    setState(() {

    });
    print(_userData![0].userAgent);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HTTP Request'),),
      body: _userData!.isNotEmpty && _userData != null? ListView.builder(
        itemCount: _userData?.length ?? 0,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Image.network(_userData![index].image!,height: 40),radius: 40,),
            title: Text(_userData![index].email!),
            subtitle: Text(_userData![index].userAgent!),
          );
        },
      ): Center(child: CircularProgressIndicator(),),
    );
  }
}

