import 'package:bundle_test/Utils/Asyncronous.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bundle_test/Model/Post/posts.dart';

class PostItem extends StatefulWidget {

  PostItem({
    this.post,
  });

  Posts post;

  @override
  _PostItemState createState() => _PostItemState();

}

class _PostItemState extends State<PostItem> {

  Asyncronous asyncronous = Get.put(Asyncronous());

  @override
  Widget build(BuildContext context) {
    return Container(
      height:280 ,
      padding: EdgeInsets.all(8),
      margin:EdgeInsets.all(5),
      decoration:BoxDecoration(
        color:Colors.blueAccent,
        borderRadius:BorderRadius.circular(20),
      ),
      child:Expanded(
        child: Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[
            Expanded(
              child:Column(
                mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                  FutureBuilder(
                    future:Asyncronous().getUserName(id:widget.post.userId),
                    builder: (context , snapshot)=> Container(
                      margin:EdgeInsets.all(10.0),
                      width:Get.width,
                      child: Text(
                        "Posted by ${snapshot.data}",
                        style:TextStyle(
                            color:Colors.white,
                            fontSize:13.0,
                            fontWeight:FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Text(
                    widget.post.title,
                    style:TextStyle(
                        color:Colors.white,
                        fontSize:13.0,
                        fontWeight:FontWeight.bold
                    ),
                  ),
                  Text(
                    widget.post.body,
                    style:TextStyle(
                        color:Colors.white,
                        fontSize:16.0,
                        fontWeight:FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }




}
