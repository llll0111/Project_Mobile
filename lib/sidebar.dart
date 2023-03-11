import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/ScheduleMain/ScheduleMainPage.dart';


Widget SS(String nick){
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Column(
            children:[
              Padding(
                padding:  const EdgeInsets.all(0.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.purple[100],),
              ),
              Text("xxxx님",
                style: TextStyle(fontSize: 35,),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color : Colors.purple[100],

            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),

            ),

          ),

        ),
        ListTile(
          leading:
          Icon(Icons.calendar_today,
              color: Colors.red),
          title: Text('내 여행일정',
              style: TextStyle(fontSize: 25,)),
          enabled: true,
          contentPadding: EdgeInsets.fromLTRB(20, 20, 0, 0),
          onTap: (){
            // print('1 button clicked');
            Get.to(ScheduleMainPage(nick: nick));
          },
        ),

        ListTile(
          leading:
          Icon(Icons.star,
              color: Colors.yellow),
          title: Text('찜한 여행지',
              style: TextStyle(fontSize: 25,)),
          contentPadding: EdgeInsets.fromLTRB(20, 20, 0, 0),
          onTap: (){
            print('2 button clicked');
          },
        ),


        ListTile(
          leading:
          Icon(Icons.support_agent,
              color: Colors.black),
          title: Text('고객센터',
              style: TextStyle(fontSize: 25,)),
          contentPadding: EdgeInsets.fromLTRB(20, 20, 0, 0),
          onTap: (){
            if(nick == "admin"){
              Get.toNamed("/AdminService");
            }else{
              Get.toNamed("/ServiceMain");
            }
          },

        ),


        ListTile(
          leading:
          Icon(Icons.person_add,
              color: Colors.purple),
          title: Text('초대내역',style: TextStyle(fontSize: 25,),
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 20, 0, 0),

          onTap: (){
            print('1 button clicked');
          },
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(200, 200, 0, 0),
          child: FlatButton(
            onPressed: (){
            //  Get.to(Delmem());
            },
            child:Text('회원탈퇴',),


          ),
        ),


      ],
    ),
  );
}