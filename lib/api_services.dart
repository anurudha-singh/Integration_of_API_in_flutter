import 'dart:convert';
import 'package:api_demo/user_model.dart';
import 'package:http/http.dart' as http;

class API_Service {
  static var client = http.Client();

  static Future<ListUserModel?> getUsers() async{
    Map<String,String> requestHeaders={
      'Content-Type':'application/json'
    };
    var url=Uri.https('reqres.in','/api/users');

    var response=await client.get(url,headers: requestHeaders);//here you can use various requests

    if(response.statusCode==200) {
      var data = jsonDecode(response.body);//string format data has been converted into json format
      return ListUserModel.fromJson(data);
      print(response.body);//print(data["data"]);
    }
    else
      return null;
  }
}

