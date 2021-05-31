import 'dart:async';
import 'package:bundle_test/Model/users.dart';
import 'package:bundle_test/Screens/CreatePost.dart';
import 'package:bundle_test/Screens/ListUsers.dart';
import 'package:bundle_test/Utils/ApiController.dart';
import 'package:bundle_test/Utils/Asyncronous.dart';
import 'package:bundle_test/Widget/Dialog.dart';
import 'package:bundle_test/item/PostItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  bool visible = true;
  int flex = 100;
  ApiController apiController = Get.find();


  @override
  void initState() {
    startPostFetch();
    gewtPoint();
    super.initState();
  }

   startPostFetch  () async {
    apiController.TimerReturn();
   await apiController.getListPost();
  }

  gewtPoint() async {
    String json = await Asyncronous().getJson(key:"check");
    Users user = await Asyncronous().converStringToObject(json);
    await apiController.getUserPoint(key:'${user.id}');
    apiController.checkLevel();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading:false,
        centerTitle:true,
        leading:IconButton(
          onPressed: () {
       Get.to(()=>ListUsers());
          }, icon:Icon(Icons.person_add , size: 40, color:Colors.white,),
        ),
        title:Text(
          "Your Post Feed",
          style:TextStyle(
            color:Colors.white,
            fontSize:20.0,
          ),
        ), actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Get.to(()=> CreatePost());
                // do something
              },
            )
          ]
      ),
      body:Container(
        child:Obx(
            () => apiController.time?Column(
              children: [
                 apiController.level_result == "Above"? Visibility(
                  visible:apiController.level_result!="Above"?false:visible,
                  child: Expanded(
                    flex:flex,
                    child: Container(
                      width:MediaQuery.of(context).size.width,
                      height:MediaQuery.of(context).size.height,
                      child:Center(
                        child:Column(
                          mainAxisAlignment:MainAxisAlignment.center ,
                          children: [
                            Text(
                              "You Are a Postly Legend",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize:20,
                                fontWeight:FontWeight.bold
                              ) ,
                            ),

                            Container(
                              padding:EdgeInsets.symmetric(vertical:40) ,
                              child: InkWell(
                                onTap:(){
                                      setState(() {
                                        visible = false;
                                        flex=0;
                                      });
                                },
                                child: Container(
                                  height:80.0,
                                  width:MediaQuery.of(context).size.width,
                                  margin:EdgeInsets.symmetric(horizontal:10),
                                  decoration:BoxDecoration(
                                    border:Border.all(color:Colors.blueAccent ,) ,
                                    borderRadius:BorderRadius.circular(35),
                                  ),
                                  child:Center(
                                    child: Text(
                                      "Proceed",
                                      style:TextStyle(
                                          color:Colors.black87,
                                          fontSize:20,
                                          fontWeight:FontWeight.bold
                                      ) ,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ) ,
                      ),
                    ),
                  ),
                ):Expanded(
                  flex:1,
                  child: Text(
                    "welcome",
                  ),
                ),
              //Save In SharedPreference
                Expanded(
                  flex:15,
                  child: Container(
                  child:apiController.myPosts.length!=null?ListView.builder(
                    itemCount:apiController.myPosts!=null?apiController.myPosts.length:0,
                      itemBuilder:(context , index){
                         return apiController.myPosts!=null?PostItem(post:apiController.myPosts[index],):null;
                      }
                  ):Container(
                    width:MediaQuery.of(context).size.width,
                    height:MediaQuery.of(context).size.height,
                    child:Center(
                      child:Text(
                        "No Posts To Display",
                        style:TextStyle(
                            fontSize:20,
                            color:Colors.black
                        ),
                      ),
                    ) ,
                  ),
          ),
                ),
              ],
            ):Container(
              width:MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height,
              child:Center(
                child:Text(
                  "Loading Posts....",
                  style:TextStyle(
                    fontSize:20,
                    color:Colors.black
                  ),
                ),
              ) ,
            ),
        ),
      ),
    );
  }
}
