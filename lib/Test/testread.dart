import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewRead extends StatefulWidget {
  const ReviewRead({Key? key}) : super(key: key);

  @override
  State<ReviewRead> createState() => _ReviewReadState();
}

class _ReviewReadState extends State<ReviewRead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GO TRIP'),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.purple[100],
      ),

      body:

      GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),

        child: SingleChildScrollView(

          scrollDirection: Axis.vertical,

          child: Column(children:<Widget>[

            Center(
              child: Container(
                padding: const EdgeInsets.only(top:20,),
                child: Text(
                    '한번쯤은 가볼만한곳',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20,)
                ),
              ),
            ),

            Container(
                width: 380,
                child: Divider(color: Colors.grey, thickness: 1.0)),

            Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Container(
                      child: Text(
                        '제목: ',
                        style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold,),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Container(
                      child: Text(
                          '작성자: ',
                          style: TextStyle(fontSize: 15, fontWeight:FontWeight.bold,)
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Container(
                      child: Text(
                          '작성날짜: ',
                          style: TextStyle(fontSize: 15, fontWeight:FontWeight.bold,)
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Container(
                      child: Text(
                          '글내용: ',
                          style: TextStyle(fontSize: 15, fontWeight:FontWeight.bold,)
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              width: 380,
              child: TextField(
                readOnly: true,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "내용을 입력해주세요",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 80),
                ),
                style: TextStyle(fontSize: 10),
              ),

            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Container(
                  child: Text(
                      '댓글작성',
                      style: TextStyle(fontSize: 15, fontWeight:FontWeight.bold,)
                  ),
                ),
              ),
            ),

            const SizedBox(
              width: 380,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "내용을 입력해주세요",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                ),
                style: TextStyle(fontSize: 10),
              ),

            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        textStyle: const TextStyle(fontSize: 15)
                    ),
                    onPressed: (){},
                    child: Text('등록')),
              ),
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text('댓글',
                    style:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ),),



            Container(
                width: 380,
                child: Divider(color: Colors.grey, thickness: 1.0)),






          ]),

        ),
      ),

    );
  }
}
