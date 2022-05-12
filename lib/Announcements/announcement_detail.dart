import 'dart:io';

import 'package:demo_nikita/Components/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../Components/api.dart';
import '../Components/models.dart';

class AnnouncementDetail extends StatefulWidget {
  final AnnounceModel? announceModel;
  const AnnouncementDetail({Key? key, this.announceModel}) : super(key: key);

  @override
  _AnnouncementDetailState createState() => _AnnouncementDetailState();
}

class _AnnouncementDetailState extends State<AnnouncementDetail> {
  final _allApi = AllApi();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar:
        AppBar(
          automaticallyImplyLeading: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      kblack,
                      kGray
                    ]
                )
            ),
          ),
          title: Text(widget.announceModel!.name!,style: TextStyle(color: kgolder),),
          titleSpacing: 5,
          shadowColor: Colors.transparent,
        ),
        body: FutureBuilder(
          future: _allApi.loadFile(
            url: "http://faizeetech.com/pdf/${widget.announceModel!.image}",
            fileName: widget.announceModel!.image,
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return kprogressbar;
            } else {
              var file = snapshot.data;
              return ListView(
                children: [
                  ClipRRect(

                      child: Image.file(
                        file as File,width: Get.width,height: 200,
                        fit: BoxFit.fill,
                      )
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: kgolder,width: 3),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                kblack ,
                                kGray
                              ]
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.announceModel!.text!,
                              style: TextStyle(color: kgolder,fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.announceModel!.timestamp!,
                              style: TextStyle(color: kgolder),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
