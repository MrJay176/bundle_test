import 'package:bundle_test/Model/users.dart';
import 'package:bundle_test/Screens/HomePage.dart';
import 'package:bundle_test/Utils/ApiController.dart';
import 'package:bundle_test/Utils/Asyncronous.dart';
import 'package:bundle_test/Widget/Dialog.dart';
import 'package:bundle_test/item/UserItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ListUsers extends StatefulWidget {

  @override
  _ListUsersState createState()=>_ListUsersState();

}

class _ListUsersState extends State<ListUsers> {

  ApiController apiController = Get.put(ApiController());

  @override
  void initState() {
    apiController.getListUser();
    apiController.getUserDetails();
    apiController.checkLevel();
    gewtPoint();
    super.initState();
  }

  gewtPoint() async {
    String json = await Asyncronous().getJson(key:"check");
    Users user = await Asyncronous().converStringToObject(json);
    apiController.getUserPoint(key:'${user.id}');
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Choose a User",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Obx(
            () =>
            Container(
              height:Get.height,
              width:Get.width,
              child: Column(
                children: [
                  Expanded(
                    flex:1,
                    child: Text(
                      "Your current userName: ${apiController.user_result.username}",
                      style:TextStyle(
                        color:Colors.black,
                        fontSize:17.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Text(
                      "Your current point: ${apiController.point_result}",
                      style:TextStyle(
                        color:Colors.black,
                        fontSize:17.0,
                      ),
                    ),
                  ),

                  Expanded(
                    flex:1,
                    child: Text(
                      "Your current Posting Level : ${apiController.level_result}",
                      style:TextStyle(
                        color:Colors.black,
                        fontSize:17.0,
                      ),
                    ),
                  ),

                  Expanded(
                    flex:7,
                    child: ListView.builder(
                        itemCount: apiController.myUsers.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                MyDialog.MoreDetails(context, MediaQuery
                                    .of(context)
                                    .size, apiController.myUsers[index], execute: () {
                                  //Save In SharedPreference
                                  Asyncronous().saveUserInOffline(apiController
                                      .myUsers[index]);
                                  setState(() {
                                    SystemNavigator.pop();
                                  });
                                });
                              }, child: UserItem(users: apiController.myUsers[index],)
                          );
                        }
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
