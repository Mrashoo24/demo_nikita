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
          image: AssetImage('assets/Images/background_image.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: kgolder,
          title: Text(widget.announceModel!.name!),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: _allApi.loadFile(
            url: "http://faizeetech.com/pdf/${widget.announceModel!.image}",
            fileName: widget.announceModel!.image,
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Image.asset("assets/Images/loading.gif"),
              );
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
                          ),
                        ],
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
