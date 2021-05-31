import 'dart:async';
import 'package:bundle_test/Utils/ApiController.dart';
import 'package:get/get.dart';
import 'package:bundle_test/Model/users.dart';
import 'package:bundle_test/Screens/HomePage.dart';
import 'package:bundle_test/Screens/ListUsers.dart';
import 'package:bundle_test/Utils/Asyncronous.dart';
import 'package:flutter/material.dart';


class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:Scaffold(
        body:SplashBody(),
      ),
    );
  }
}

class SplashBody extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashState();
  }
}

class SplashState extends State<SplashBody>{
  Logic logic;
  ApiController apiController = Get.put(ApiController());

  checkTimer()async{
    logic.waitSec(time:6);
  }

  @override
  Widget build(BuildContext context) {
    logic = Logic(context);
    apiController.getListUser();
    checkTimer();
    return Container(
      decoration: BoxDecoration(
        color:Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height,
      child:Center(
        child:Text(
          'Welcome',
          style:TextStyle(
            color:Colors.black,
            fontSize: 20
          ) ,
        )
      ),
    );
  }

}


class Logic {

  BuildContext context;

  Logic(BuildContext con){
    context = con;
  }

  Future<void> waitSec({int time}) async {
    Timer timer;
    var _duration = Duration(seconds: time);
    timer = Timer(_duration,()
    async {
      try{
        String json = await Asyncronous().getJson(key:"check");
        Users user = await Asyncronous().converStringToObject(json);
        print("Splash Screen Check User  ${user.toJson()}");
        if(user==null){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context )=> ListUsers()));
        }else{
          print("Splash Screen Check User  ${user.toJson()}");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context )=> HomePage()));
        }
      }catch (e){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context )=>ListUsers()));
      }

    });
  }

}

