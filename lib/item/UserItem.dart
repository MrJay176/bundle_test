import 'package:bundle_test/Model/users.dart';
import 'package:flutter/material.dart';

class UserItem extends StatefulWidget {

  UserItem({
    this.users,
  });

  Users users;

  @override
  _UserItemState createState() => _UserItemState();

}

class _UserItemState extends State<UserItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height:80 ,
      padding: EdgeInsets.all(8),
      margin:EdgeInsets.all(5),
      decoration:BoxDecoration(
        color:Colors.blueAccent,
        borderRadius:BorderRadius.circular(20),
      ),
      child:Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children:[
            Expanded(
             child:Column(
               mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center,
                children:[
                  Text(
                    this.widget.users.name,
                    style:TextStyle(
                      color:Colors.white,
                      fontSize:13.0,
                      fontWeight:FontWeight.bold
                    ),
                  ),
                  Text(
                    this.widget.users.username,
                    style:TextStyle(
                        color:Colors.white,
                        fontSize:13.0,
                        fontWeight:FontWeight.bold
                    ),
                  ),
                  Text(
                    this.widget.users.email,
                    style:TextStyle(
                        color:Colors.white,
                        fontSize:13.0,
                        fontWeight:FontWeight.bold
                    ),
                  ),
                ],
             ),
           ),
        ],
      ),
    );
  }
}
