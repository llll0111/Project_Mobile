import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

class ReviewTable extends StatefulWidget {
  const ReviewTable({Key? key}) : super(key: key);

  @override
  State<ReviewTable> createState() => _ReviewTableState();
}

class _ReviewTableState extends State<ReviewTable> {

  final ImagePicker _picker = ImagePicker();
  List<XFile> _pickedImgs = [];

  @override
  void initState(){
    super.initState();
  }



  Future<void> _pickImg() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      setState(() {
        _pickedImgs = images;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    bool isPadMode = MediaQuery.of(context).size.width > 700;

    List<Widget> _boxContents = [
      IconButton(
          onPressed: () {
            _pickImg();
          },
          icon: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6), shape: BoxShape.circle),
              child: Icon(
                CupertinoIcons.camera,
                color: Theme.of(context).colorScheme.primary,
              ))),
     /* Container(),
      Container(),*/
      _pickedImgs.length <= 2
          ? Container()
          : FittedBox(
          child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  shape: BoxShape.circle),
              child: Text(
                '+${(_pickedImgs.length - 2).toString()}',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(fontWeight: FontWeight.w800),
              ))),
    ];

    return Scaffold(
      body: SizedBox(
        width: 2009,
          height: 200,
          child: GridView.count(
            padding: EdgeInsets.all(2),
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: List.generate(
                2, (index) => DottedBorder(
                child: Container(
                  child: Center(child: _boxContents[index]),
                ),
                color: Colors.grey,
                dashPattern: [5,3],
                borderType: BorderType.RRect,
                radius: Radius.circular(10))).toList(),
          )),
    );
  }
}
