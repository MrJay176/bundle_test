import 'dart:async';
import 'dart:convert';
import 'package:bundle_test/Model/users.dart';
import 'package:bundle_test/Utils/Asyncronous.dart';
import 'package:bundle_test/Utils/Constants.dart';
import 'package:bundle_test/Widget/Dialog.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bundle_test/Model/Post/posts.dart';

class ApiController extends GetxController{

  var level = "Beginner".obs;
  var points = 0.obs;
  var user = Users().obs;
  var users = [].obs;
  var posts = [
     Posts(
       userId:1,
       id:2,
       title:"qui est esse",
       body:"est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil"
     ),

  ].obs;
  var postCreated = false.obs;
  var time_check = false.obs;

  String get level_result => level.value;
  int get point_result => points.value;
  bool  get time => time_check.value;
  bool get postCreated_Result => postCreated.value;
  List<Users> get myUsers => users.value;
  List<Posts> get myPosts => posts.value;
  Users get user_result => user.value;

  getListUser() async {
    http.BaseClient client = http.Client();
    try{
     http.Response response = await client.get(Uri.parse("${BASE_URL}/users"), headers: {
       'Content-Type': 'application/json',
       'Accept': 'application/json',
       }
     );
     print("This Is Response from get ${response.body}");
     int status = response.statusCode;
     print("This Is Status Code $status");

     if(status==200){
       var responseBody = jsonDecode(response.body);
       var data = responseBody as List;

       users.value = data.map<Users>((json){
         return Users.fromJson(json);
       }).toList();
       Asyncronous().saveListOfUsersOffline(users.value);
     }else{
       print("There Was An Error In The Http Request $status");
     }

    }finally{
      client.close();
    }
  }

  getListPost() async {
    http.BaseClient client = http.Client();
    try{
      http.Response response = await client.get(Uri.parse("${BASE_URL}/posts"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
       }
      );

      int status = response.statusCode;
      print("This Is Status Code Posts $status");

      if(status==200){
        var responseBody = jsonDecode(response.body);
        var data = responseBody as List;
        if(data!=null) {
          posts.value = data.map<Posts>((json) {
            return Posts.fromJson(json);
          }).toList();
        }
      }else{
        print("There Was An Error In The Http Request $status");
      }
    }finally{
      client.close();
    }
  }

  bool TimerReturn(){
    var _duration = Duration(seconds:5);
    Timer(_duration,()
    async {
      time_check.value = true;
    });
  }

  Future ApisendPost({ String userId,
   int id,
   String title,
   String body,}) async {
   http.BaseClient client = http.Client();
   try{
     http.Response response = await client.post( Uri.parse("${BASE_URL}/posts"),
         body:{'userId':userId, "id":'$id', 'title':title, 'body':body});

     int status = response.statusCode;
     if(status == 201){
       //Post Created
       postCreated.value = true;
     }else{
       //Not Created
       postCreated.value = false;
     }
   }finally {
     client.close();
   }

  }

  getUserDetails() async {
    String json = await Asyncronous().getJson(key:"check");
    user.value = await Asyncronous().converStringToObject(json);

    print("THIS IS uSER ${user.toString()}");
  }

  getUserPoint ({String key}) async {
    int pointer = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    pointer = prefs.getInt(key);
    points.value = pointer;

  }

  checkLevel() async {

    gewtPoint() async {
      String json = await Asyncronous().getJson(key:"check");
      Users user = await Asyncronous().converStringToObject(json);
      getUserPoint(key:'${user.id}');
    }
    await gewtPoint();



    if(points.value<6){
    level.value = "Beginner";
    }else if(points.value>= 6 && points.value<=10){
      level.value = "Intermediate";
    }else if(points.value >= 10 && points.value <= 16){
      level.value = "Professional";
    }else if(points.value >16) {
       level.value = "Above";
    }else{
      level.value = "Beginner";
    }
    print('This Is Your User Value ${level.value}');
  }

}

