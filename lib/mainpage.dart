// import 'package:flutter/material.dart';
//
//
// class MainPage extends StatefulWidget {
//
//   late final String nick;
//
//   MainPage({required this.nick});
//
//   @override
//   _MainPage createState() => _MainPage();
//
// }
//
// class _MainPage extends State<MainPage> {
//
//   static final storage = FlutterSecureStorage();
//   late String nick;
//
//   @override
//   void initState() {
//     super.initState();
//     nick = widget.nick;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             Text(nick),
//             ElevatedButton(
//                 onPressed: () {
//                   storage.delete(key: "nick");
//                 },
//                 child: Text("로그아웃"))
//           ],
//         ),
//       ),
//     );
//   }
//
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:untitled/Schedule/caledarM.dart';
import 'package:untitled/Test/testupload.dart';
import 'package:untitled/firstpage.dart';
import 'package:untitled/sidebar.dart';
import 'package:untitled/start.dart';

import 'Review/reviewMain.dart';

class MainPage extends StatefulWidget {

  late final String nick;

  MainPage({required this.nick});

  @override
  _MainPage createState() => _MainPage();

}

class _MainPage extends State<MainPage> {

  static final storage = FlutterSecureStorage();
  late String nick;

  @override
  void initState() {
    super.initState();
    nick = widget.nick;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("sss"),
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        endDrawer: SS(nick),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                child:(
                    Image.asset("assets/logo_white.png",)
                ),
              ),
              Column(
                children: [
                  Text('${nick}님', style: TextStyle(fontSize: 16, color: Colors.blueGrey,)),
                  const Text("같이 여행을 준비해볼까요?", style: TextStyle(fontSize: 16,color: Colors.blueGrey)),
                  Row(
                    children: [
                      ClipOval(
                        child: Material(
                          color: Colors.purple[100], // button color
                          child: InkWell(
                            splashColor: Colors.purple[700], // inkwell color
                            child: SizedBox(width: 60, height: 60, child: Icon(Icons.add, size: 60,),),
                            onTap: () {Get.toNamed("/Calendar");},
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: (){Get.to(CalendarP1(nick: nick));},
                        child: Text("나만의 일정 만들기",style: TextStyle(fontSize: 20)),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: (){Get.to(ReviewMain(nick: nick,));},
                    child: Text("사람들이 추천하는 한번쯤은 가볼만한곳",style: TextStyle(fontSize: 20)),
                  ),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 250,
                          child: (Image.asset("assets/busan.jpg",fit: BoxFit.fitHeight)),
                        ),
                        const SizedBox(width: 150,),
                      ],
                    ),
                  ),
                  ListTile(
                    leading:
                    Icon(Icons.photo_album, color: Colors.red),
                    title: Text('나의 추억 기록하기', style: TextStyle(fontSize: 15,)),
                    enabled: true,
                    contentPadding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    onTap: (){
                      // print('1 button clicked');
                      // Get.to(CsUpload());
                    },
                  ),
                  RaisedButton(
                    onPressed: () {
                      //delete 함수를 통하여 key 이름이 login인것을 완전히 폐기 시켜 버린다.
                      //이를 통하여 다음 로그인시에는 로그인 정보가 없어 정보를 불러 올 수가 없게 된다.
                      storage.delete(key: "nick");
                      setState(() {});
                      Get.off(MyApp());
                      // Navigator.pushReplacement(
                      //   context,
                      //   CupertinoPageRoute(
                      //       builder: (context) => MyApp()),
                      // );
                    },
                    child: Text("Logout"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


