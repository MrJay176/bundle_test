import 'dart:convert';
import 'package:bundle_test/Screens/HomePage.dart';
import 'package:bundle_test/Utils/ApiController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bundle_test/Model/users.dart';
import 'package:get/get.dart';

class Asyncronous{

  ApiController apiController = Get.put(ApiController());

  //Save it in shared Preference
  saveUserInOffline(Users user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = converObjectToString(user);
    prefs.setString("check",jsonString);
    print("USER SAVED OFFLINE");
    Get.to(()=>HomePage());
  }

  saveListOfUsersOffline(List<Users> users) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString =  jsonEncode(users);
    prefs.setString("users",jsonString);
    print("USER SAVED OFFLINE");
   // Get.to(()=>HomePage());
  }

  Future<List<Users>> returnListOfUsers({String jsonList}) async {
    List<Users> user_list;
    var responseBody = jsonDecode(jsonList);
    var data = responseBody as List;
    user_list = data.map<Users>((json){
      return Users.fromJson(json);
    }).toList();
    return user_list;
  }

  Future<String> getUserName({int id}) async {
     String name = "";
      String jsonList = await getListOfUsers(key:"users");
      List<Users> user_list = await returnListOfUsers(jsonList:jsonList);
      for(Users u in user_list){
        if(u.id == id){
           name = u.username;
        }
      }
      return name;
  }

  String converObjectToString(Users user) {
    String json = jsonEncode(user);
    print("This is json ${json}");
    return json;
  }

  Future<Users> updatSharedPrefence({String key , Users user }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = converObjectToString(user);
    prefs.setString("check",jsonString);
    print("User Updated");
  }

  Future<Users> converStringToObject(String json) async {
    Map<String , dynamic> user = jsonDecode(json);
    return Users.fromJson(user);
  }

  Future<String> getListOfUsers({String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("users");
  }

  Future<String> getJson({String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  setUserPoint({String key}) async {
    print("Entered setUserPoint with key $key");
    const reward = 2;
     int total_point = 0;
    total_point =  await calculatePoint(key:key,newPoint:reward);
   if(total_point == 0 || total_point == null) {
     print("This is total point $total_point");
     await AddPoints(key_id: key, point:0);
   }else{
     print("This is total point $total_point");
     await AddPoints(key_id: key, point:total_point);
   }
  }

  Future AddPoints({int point , String key_id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key_id,point);
    apiController.getUserPoint(key:key_id);
    print("Point Added");
  }

  Future<int> calculatePoint({int newPoint , String key}) async {
      print("Calculating Point With calculatePoint $newPoint");
      int oldPoint =0;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      oldPoint = prefs.getInt(key);
      int cal = 0;
      if(oldPoint!=null) {
        if(oldPoint==0){
          print(
              "This Is Point  Old Point : $oldPoint New Point Printing $newPoint");
          cal = newPoint;
        }else{
          print(
              "This Is Point  Old Point : $oldPoint New Point Printing $newPoint");
          cal = oldPoint + newPoint;
        }
      }else{
        setUserPoint(key:key);
      }
      print("Point Calculated $cal");
      return cal;
  }

}