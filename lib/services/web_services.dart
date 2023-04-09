import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:prefs/prefs.dart';
import '../models/user.dart';
import '../utils/API.Data.dart';
import '../utils/commons.dart';
import '../utils/constants.dart';

class WebService {
  static final WebService _singleton = WebService._internal();

  factory WebService() {
    return _singleton;
  }

  WebService._internal();


  Future<AppUser?>  login(String email, String password) async{
    String myUrl = V2APIData.LOGIN;
    String userdetail_url = V2APIData.USER_DETAILS;
    print("---------------requesting $myUrl");
    Map<String, dynamic> _body = {
      "email": email,
      "password": password
    };
    http.Response response = await http.post(
      Uri.parse(myUrl),
      headers: V2APIData.headersWithoutToken(),
      body: json.encode(_body)
    );
    print("response of getMyTransList from webservice is: ");
    var rData = json.decode(response.body);
    print(rData.runtimeType);
    print(rData);
    print("-----------------------------------------------${response.statusCode}");
    if(rData != null && response.statusCode.toString().startsWith("2") && rData["access_token"] != null){
      print(userdetail_url);
      ///récupérer les infos du user
      http.Response response2 = await http.get(
          Uri.parse(userdetail_url),
          headers: V2APIData.headers(rData["access_token"])
      );

      if(response2.statusCode.toString().startsWith("2")){
        Map<String, dynamic> resp = json.decode(response2.body);
        print(resp.runtimeType);
        print(resp);
        if(resp != null && resp["email"] != null){
          resp["access_token"]=rData["access_token"];
          resp["refresh_token"]=rData["refresh_token"];
          AppUser user = AppUser.fromJson(resp);
          await Prefs.init();
          Prefs.setString(APP_USER, json.encode(resp));
          // _dbProvider.insertUser(user);
          Commons.user = user;
          return user;
        }
        else{
          return null;
        }
      }
      else{
        return null;
      }

    }
    else{
      return null;
    }

  }


  Future<bool>  changePass(String oldpass, String newpass) async{
    String myUrl = V2APIData.CHANGE_PASS;
    print("---------------requesting $myUrl");
    Map<String, dynamic> _body = {
      "old_password": oldpass,
      "new_password": newpass
    };
    print(_body);
    http.Response response = await http.put(
      Uri.parse(myUrl),
      headers: V2APIData.headers(Commons.user!.access_token),
      body: json.encode(_body)
    );
    print("----------------------change pass reponse from webservice is: ");
    var rData = json.decode(response.body);
    print(rData.runtimeType);
    print(rData);
    print("-----------------------------------------------${response.statusCode}");
    if(rData != null && response.statusCode.toString().startsWith("2")){
      if(rData["status"] == "success"){
        return true;
      }
      return false;
    }
    else{
      return false;
    }
  }

  Future<bool>  createFcm(String fcm) async{

    Map<String, dynamic> body = {
      "type": "android",
      "registration_id": fcm
    };
    String myUrl = V2APIData.NEW_FCM ;
    print("---------------requesting $myUrl");
    http.Response response = await http.post(Uri.parse(myUrl),
      headers: (Commons.user == null && Commons.user!.access_token != null) ?
      V2APIData.headersWithoutToken()
          :
      V2APIData.headers(Commons.user!.access_token),
      body: json.encode(body),
    );
    print("------res");
    var rData = json.decode(response.body);
    print("--------rdata");
    print(rData.runtimeType);
    print(rData);
    if(response.statusCode.toString().startsWith("2")){
      return true;
    }
    else{
      print("------------signalement nop");
      return false;
    }
  }

  Future<List<AppUser>> getAllUsers() async{
    String myUrl = V2APIData.ALL_USERS;
    print("---------------requesting $myUrl");
    http.Response response = await http.get(Uri.parse(myUrl),
      headers: (Commons.user == null ) ?
      V2APIData.headersWithoutToken()
          :
      V2APIData.headers(Commons.user!.access_token),
    );
    print("----------------response of getEntretiensList from webservice is: ");
    var rData = json.decode(response.body);
    print(rData.runtimeType);
    print(rData);
    if(rData != null && response.statusCode.toString().startsWith("2")){
      List<AppUser> list = List<AppUser>.from(
        rData.map(
              (singleObj) => AppUser.fromJson(singleObj),
        ),
      ) ?? [];
      print("=============================================signalement find: ${list.length}");
      return list;
    }
    else{
      return [];
    }

  }

  Future<bool>  register(AppUser alodoUser, String p1, String p2) async{
    String myUrl = V2APIData.REGISTER ;
    print("---------------requesting $myUrl");
    print(Commons.fcm);
    var request = http.MultipartRequest('POST', Uri.parse(myUrl),);
    request.fields['email'] = alodoUser.email;
    request.fields['password1'] = p1;
    request.fields['password2'] = p2;
    request.fields['gender'] = alodoUser.gender;
    request.fields['first_name'] = alodoUser.first_name;
    request.fields['last_name'] = alodoUser.last_name;
    request.fields['group'] = alodoUser.groups.first;
    if (alodoUser.phone_number != null) {
      request.fields['phone_number'] = alodoUser.phone_number!;
    }
    request.fields['commune'] = alodoUser.commune.toString();
    debugPrint("${request.fields}");
    request.headers.addAll(
        V2APIData.headersWithoutToken()
    );
    print(request.headers);
    print("------res");
    // print(res);
    print("response of createSignalementsList from webservice is: ");
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    var rData = json.decode(response.body);
    print("--------rdata");
    print(rData.runtimeType);
    print(rData);
    if(rData != null && response.statusCode.toString().startsWith("2")){
      return true;
    }
    else{
      print("------------register error");
      return false;
    }
  }


}