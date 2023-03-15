
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:widget_practice_one/http_services/models/user_data.dart';

import 'models/users.dart';

class HttpResponse {
  
  static Future<List<Users>> getData(String url)async{
    http.Response response = await http.get(Uri.parse(url),);
    print(response.statusCode);
    if(response.statusCode == 200){
      final data = response.body;
      final userData = UserData.fromJson(json.decode(data));
      List<Users>? users = userData.users;
      return users!;
    }else{
      return [];
    }

  }
}