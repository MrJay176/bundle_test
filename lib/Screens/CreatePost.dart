import 'package:bundle_test/Model/users.dart';
import 'package:bundle_test/Utils/ApiController.dart';
import 'package:bundle_test/Utils/Asyncronous.dart';
import 'package:bundle_test/Utils/Colorss.dart';
import 'package:bundle_test/Widget/Dialog.dart';
import 'package:bundle_test/Widget/RTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bundle_test/Model/Post/posts.dart';
class CreatePost extends StatefulWidget {

  @override
  _CreatePostState createState() => _CreatePostState();

}

class _CreatePostState extends State<CreatePost> {

  Users user;
  ApiController apiController = Get.find();
  var editingControllerTitle;
  var editingControllerBody;
  Posts post_model;

  @override
  void initState() {
    apiController.getUserDetails();
    editingControllerTitle = TextEditingController();
    editingControllerBody = TextEditingController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          centerTitle:true,
          title:Text(
            "Write Post",
            style:TextStyle(
              color:Colors.white,
              fontSize:20.0,
            ),
          ), actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                onPressed: () async {
                  String json = await Asyncronous().getJson(key:"check");
                  Users user = await Asyncronous().converStringToObject(json);

                 await apiController.ApisendPost( userId: "${user.id}",
                   id:101,
                   title:editingControllerTitle.text,
                   body:editingControllerBody.text,);
                  //Dialog Pops
                  MyDialog.success(context,MediaQuery.of(context).size, execute:() async {
                    //Save In SharedPreference
                    await Asyncronous().setUserPoint(key:'${user.id}');
                    setState(() {
                      Navigator.pop(context);
                    });
                  });

                },
              )
            ]
        ),
        body:Container(
          child:Column(
            children:[
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex:1,
                      child: Obx(
                        ()=> Container(
                          margin:EdgeInsets.all(5) ,
                          child: Text(
                            "Your current userName: ${apiController.user_result.username}",
                            style:TextStyle(
                              color:Colors.black,
                              fontSize:17,
                              fontWeight:FontWeight.normal
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      flex:1 ,
                      child: RTextField(
                          controller:editingControllerTitle,
                          isPassword: false,
                          hint_text: "Title",
                          label_text: "Title",
                          height_value: 50,
                          borderColor: Colorss().text_color
                      ),
                    ),
                  ],
                ),
              ),
              //One TextField Title
              Expanded(
                flex:2,
                child: Container(
                  margin:EdgeInsets.all(8),
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(45),
                    border:Border.all(
                      color:Colors.black,
                      width:0.5
                    )
                  ),
                  child: RTextField(
                    height_value:MediaQuery.of(context).size.height*0.7,
                      controller:editingControllerBody,
                      isPassword: false,
                      hint_text: "Body",
                      label_text: "Body",
                      borderColor: null
                  ),
                ),
              ),
              //Another TextField Description

            ],
          ),
        )
    );
  }
}
