import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:untitled/Review/reviewread.dart';
import 'package:untitled/Review/reviewupload.dart';
import 'package:untitled/ScheduleMain/ScheduleMain.dart';

class ScheduleMainPage extends StatefulWidget {
  late String nick = "";

  ScheduleMainPage({required this.nick});

  @override
  _ScheduleMainPageState createState() => _ScheduleMainPageState();
}

class _ScheduleMainPageState extends State<ScheduleMainPage> {
  late String nick = "";

  @override
  void initState() {
    super.initState();
    nick = widget.nick;
  }

  late final Stream<QuerySnapshot> cstableStream =
  FirebaseFirestore.instance.collection('Schedule')
      .where("nick",isEqualTo: nick)
      .snapshots();



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: cstableStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storedocs = [];
          List<String> listmap = [];
          List<String> listmap2 = [];
          String re = "";
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            a['id'] = document.id;
            storedocs.add(a);
            re = a["map"];
            listmap2 = re.split(" ");
            if(listmap2.isEmpty){
              listmap.add(re);
            }else{
              listmap.add(listmap2[0]);
            }
            // print(storedocs[0]);
            // print(storedocs);
          }).toList();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Go Trip'),
              foregroundColor: Colors.black,
              centerTitle: true,
              backgroundColor: Colors.purple[100],
            ),
            body: SafeArea(
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 12)),
                    Center(
                      child: Text(
                        "나의 일정",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 12)),
                    Expanded(
                      child: ListView.builder(
                          itemCount: storedocs.length,
                          itemBuilder: (context, index) {
                            //return Card(
                            //child:
                            return Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 12, 0, 0)),
                                TextButton(
                                  onPressed: () {
                                    Get.to(ScheduleMain(nick: nick, start: storedocs[index]['startdate'],
                                        end: storedocs[index]['enddate'], city: storedocs[index]['map']+" "));
                                    print(storedocs[index]['id']);
                                  },
                                  child: Text(
                                    "${storedocs[index]['startdate']}\n ${listmap[index]}",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            );
                            //);
                          }),
                    ),
                  ],
                )),
          );
        });
  }
}
