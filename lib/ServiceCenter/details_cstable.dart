import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CsDetails extends StatelessWidget {
  CsDetails(this.id, {Key? key}) : super(key: key) {
    _reference = FirebaseFirestore.instance.collection('Posts').doc(id);
    _futureData = _reference.get();
  }

  final String id;
  late DocumentReference _reference;
  late Future<DocumentSnapshot> _futureData;
  late Map data;

  Future addComment(BuildContext context, String admin, String comment) async {
    
    await FirebaseFirestore.instance
        .collection('Admin')
        .doc(admin)
        .collection('Comments')
        .doc(comment)
        .set({
      'comment': comment,
      'time': Timestamp.now()
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Trip'),
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: Colors.purple[100],
      ),

      bottomNavigationBar: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 150.0),
                        child: Divider(
                          thickness: 4.0,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        child: const Center(
                          child: Text('Comments', style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                          )),
                        ),
                      ),
                    ],
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0)
                    ),
                  ),
                );
              });
        },
        child: Container(
          height: 100,
          color: Colors.blueGrey,
          child: const Center(
            child: Text('댓글 남기기', style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            )),
          ),
        ),
      ),

      body: FutureBuilder<DocumentSnapshot>(
        future: _futureData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text('Some error occurred ${snapshot.error}'));
          }
          if (snapshot.hasData) {
            DocumentSnapshot documentSnapshot = snapshot.data;
            data = documentSnapshot.data() as Map;

            return Column(
              children: <Widget>[
                Align(
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(top:30),
                    child: const Text(
                        '고객센터',
                        style: TextStyle(fontSize: 25,)
                    ),
                  ),
                ),
                Column(
                  children: [
                    Align(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(top:50, left: 20),
                        child: Text(
                          '제목 : ${data['postTitle']}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0),
                        ),
                      ),
                    ),
                    Align(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(top:50, left: 20),
                        child: const Text(
                            '글내용',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0
                            ),
                        ),
                      ),
                    ),
                    Align(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(top:15, left: 20, right: 20),
                        child: Text(
                          '${data['content']}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

