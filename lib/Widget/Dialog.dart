import 'package:bundle_test/Model/users.dart';
import 'package:bundle_test/Utils/ApiController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialog{



  static Widget success(BuildContext context,Size size,{Function execute}){
  ApiController apiController = Get.put(ApiController());
    if(execute!=null){
      Future.delayed(Duration(seconds: 2),(){
        execute();
      });
    }

    showDialog(
        context:context,
        barrierDismissible:false,
        builder:(BuildContext context){

          Future.delayed(Duration(seconds:2),(){
            Navigator.pop(context);
          });

          return Padding(
              padding:EdgeInsets.only(top:size.height *.30,bottom:size.height *.10,left:35,right:35),
              child:Material(
                  borderRadius:BorderRadius.circular(17),
                  child:Container(
                      height:size.height *.4,
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(30)
                      ),
                      child:Padding(
                        padding:EdgeInsets.symmetric(horizontal: 26.0 , vertical: 2.0,),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children:[

                            Container(
                              child:Padding(
                                  padding:EdgeInsets.all(16.0),
                                  child:Icon(Icons.check, size : 50 , color: Colors.deepPurple,)
                              ),
                              decoration:BoxDecoration(
                                  shape:BoxShape.circle,
                                  border: Border.all(
                                    width:8,
                                    color: Color(0xFFE1D5FF),
                                  )
                              ),
                            ),

                            SizedBox(
                              height:30,
                            ),
                            Text(
                              "Success",
                              style: TextStyle(
                                  fontWeight:FontWeight.w700,
                                  fontSize:19.0
                              ),
                            ),

                            Obx(
                              ()=> Text(
                                "Total Points now : ${apiController.point_result}",
                                style: TextStyle(
                                    fontWeight:FontWeight.w700,
                                    fontSize:19.0
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                  )
              )
          );
        }
    );


  }

  static Widget failure(BuildContext context,Size size,{Function execute}){

    if(execute!=null){
      Future.delayed(Duration(seconds: 5),(){
        execute();
      });
    }

    showDialog(
        context:context,
        barrierDismissible:false,
        builder:(BuildContext context){

          Future.delayed(Duration(seconds:5),(){
            Navigator.pop(context);
          });

          return Padding(
              padding:EdgeInsets.only(top:size.height *.30,bottom:size.height *.10,left:35,right:35),
              child:Material(
                  borderRadius:BorderRadius.circular(17),
                  child:Container(
                      height:size.height *.4,
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(30)
                      ),
                      child:Padding(
                        padding:EdgeInsets.symmetric(horizontal: 26.0 , vertical: 2.0,),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children:[

                            Container(
                              child:Padding(
                                  padding:EdgeInsets.all(16.0),
                                  child:Icon(Icons.sms_failed_outlined, size : 50 , color: Colors.deepPurple,)
                              ),
                              decoration:BoxDecoration(
                                  shape:BoxShape.circle,
                                  border: Border.all(
                                    width:8,
                                    color: Colors.red,
                                  )
                              ),
                            ),

                            SizedBox(
                              height:30,
                            ),
                            Text(
                              "Balance Is Too Low ",
                              style: TextStyle(
                                  fontWeight:FontWeight.w700,
                                  fontSize:19.0
                              ),
                            ),
                            Container(
                              width:MediaQuery.of(context).size.width,
                              height:50.0,
                              decoration:BoxDecoration(
                                  color:Colors.orange,
                                  borderRadius:BorderRadius.circular(10.0)
                              ),
                              child:Center(
                                child:Text(
                                    "Click To Refill Your Wallet Balance Now ",
                                    style:TextStyle(
                                        color:Colors.white,
                                        fontWeight:FontWeight.bold
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                  )
              )
          );
        }
    );


  }


  static Widget progress(BuildContext context,Size size,{Function execute}){

    if(execute!=null){
      Future.delayed(Duration(seconds: 6),(){
        execute();
      });
    }


    showDialog(
        context:context,
        barrierDismissible:false,
        builder:(BuildContext context){

          if(execute!=null){
            Future.delayed(Duration(seconds: 5),(){

              Navigator.pop(context);

            });
          }


          return Padding(
              padding:EdgeInsets.only(top:size.height *.30,bottom:size.height *.10,left:35,right:35),
              child:Material(
                  borderRadius:BorderRadius.circular(17),
                  child:Container(
                      height:size.height *.4,
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(30)
                      ),
                      child:Padding(
                        padding:EdgeInsets.symmetric(horizontal: 26.0 , vertical: 2.0,),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children:[

                            SizedBox(
                              height:30,
                            ),
                            Text(
                              "Please Wait",
                              style: TextStyle(
                                  fontWeight:FontWeight.w700,
                                  fontSize:19.0
                              ),
                            ),
                            Container(
                              child:Padding(
                                  padding:EdgeInsets.all(16.0),
                                  child:Icon(Icons.cached, size : 50 , color: Colors.deepPurple,)
                              ),
                              decoration:BoxDecoration(
                                  shape:BoxShape.circle,
                                  border: Border.all(
                                    width:8,
                                    color: Color(0xFFE1D5FF),
                                  )
                              ),
                            ),

                            SizedBox(
                              height:30,
                            ),
                            Text(
                              "Please Wait...",
                              style: TextStyle(
                                  fontWeight:FontWeight.w700,
                                  fontSize:19.0
                              ),
                            )
                          ],
                        ),
                      )
                  )
              )
          );
        }
    );
  }

  static Widget MoreDetails (BuildContext context,Size size ,Users users ,{Function execute} ){

    showDialog(
        context:context,
        barrierDismissible:false,
        builder:(BuildContext context){

          // if(execute!=null){
          //   Future.delayed(Duration(seconds: 5),(){
          //
          //     Navigator.pop(context);
          //
          //   });
          // }

          return Padding(
              padding:EdgeInsets.only(top:size.height *.10,bottom:size.height *.10,left:35,right:35),
              child:Material(
                  borderRadius:BorderRadius.circular(17),
                  child:Container(
                      height:size.height *.4,
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(30)
                      ),
                      child:Padding(
                        padding:EdgeInsets.symmetric(horizontal: 26.0 , vertical: 2.0,),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children:[
                            Expanded(
                              flex:3,
                              child:Container(
                                child:Column(
                                  children:[
                                    Row(
                                      children: [
                                        Text(
                                          users.name,
                                          style:TextStyle(
                                              color:Colors.black87,
                                              fontSize:13.0,
                                              fontWeight:FontWeight.bold
                                          ),
                                        ),
                                        Icon(Icons.person,size:50,color:Colors.blueAccent,)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          users.phone,
                                          style:TextStyle(
                                              color:Colors.black87,
                                              fontSize:13.0,
                                              fontWeight:FontWeight.bold
                                          ),
                                        ),
                                        Expanded(child: Icon(Icons.add_call,size:50,color: Colors.blueAccent,)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          users.website,
                                          style:TextStyle(
                                              color:Colors.black87,
                                              fontSize:13.0,
                                              fontWeight:FontWeight.bold
                                          ),
                                        ),
                                        Expanded(child: Icon(Icons.http,size:50,color: Colors.blueAccent,))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${users.address.street} ${users.address.city}",
                                          style:TextStyle(
                                              color:Colors.black87,
                                              fontSize:13.0,
                                              fontWeight:FontWeight.bold
                                          ),
                                        ),
                                        Expanded(child: Icon(Icons.location_on_outlined,size:50,color: Colors.blueAccent,))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          users.company.name,
                                          style:TextStyle(
                                              color:Colors.black87,
                                              fontSize:13.0,
                                              fontWeight:FontWeight.bold
                                          ),
                                        ),
                                        Expanded(child: Icon(Icons.work_outline,size:50,color: Colors.blueAccent,))
                                      ],
                                    ),
                                  ]
                                )
                              ),
                            ),
                            // SizedBox(height:10,),
                            Expanded(
                              flex:1,
                              child: Container(
                                padding:EdgeInsets.symmetric(vertical:40) ,
                                child: InkWell(
                                  onTap:execute,
                                  child: Container(
                                    height:100.0,
                                    width:MediaQuery.of(context).size.width,
                                    margin:EdgeInsets.symmetric(horizontal:10),
                                    decoration:BoxDecoration(
                                      border:Border.all(color:Colors.blueAccent ,) ,
                                      borderRadius:BorderRadius.circular(35),
                                    ),
                                    child:Center(
                                      child: Text(
                                        "Select User",
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
                            )
                          ],
                        ),
                      )
                  )
              )
          );
        }
    );
  }


  static Widget legend(BuildContext context,Size size,{Function execute}){
    ApiController apiController = Get.put(ApiController());
    if(execute!=null){
      Future.delayed(Duration(seconds: 2),(){
        execute();
      });
    }

    showDialog(
        context:context,
        barrierDismissible:false,
        builder:(BuildContext context){

          Future.delayed(Duration(seconds:2),(){
            Navigator.pop(context);
          });

          return Padding(
              padding:EdgeInsets.only(top:size.height *.30,bottom:size.height *.10,left:35,right:35),
              child:Material(
                  borderRadius:BorderRadius.circular(17),
                  child:Container(
                      height:size.height *.4,
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(30)
                      ),
                      child:Padding(
                        padding:EdgeInsets.symmetric(horizontal: 26.0 , vertical: 2.0,),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children:[

                            Container(
                              child:Padding(
                                  padding:EdgeInsets.all(16.0),
                                  child:Icon(Icons.check, size : 50 , color: Colors.deepPurple,)
                              ),
                              decoration:BoxDecoration(
                                  shape:BoxShape.circle,
                                  border: Border.all(
                                    width:8,
                                    color: Color(0xFFE1D5FF),
                                  )
                              ),
                            ),

                            SizedBox(
                              height:30,
                            ),
                            Text(
                              "You Are A Postly Legend , Yipeeeeee! ",
                              style: TextStyle(
                                  fontWeight:FontWeight.w700,
                                  fontSize:19.0
                              ),
                            ),

                            Obx(
                                  ()=> Text(
                                "Total Points now : ${apiController.point_result}",
                                style: TextStyle(
                                    fontWeight:FontWeight.w700,
                                    fontSize:19.0
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                  )
              )
          );
        }
    );


  }

}