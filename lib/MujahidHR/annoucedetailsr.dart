import 'dart:io';

import 'package:demo_nikita/Components/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../Components/api.dart';
import '../Components/models.dart';

class AnnouncementDetailHR extends StatefulWidget {

  final AnnounceModel? announceModel;
  const AnnouncementDetailHR({Key? key, this.announceModel}) : super(key: key);

  @override
  _AnnouncementDetailHRState createState() => _AnnouncementDetailHRState();
}

class _AnnouncementDetailHRState extends State<AnnouncementDetailHR> {
  final _allApi = AllApi();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:LinearGradient(
          colors: [
            Colors.grey,
            Colors.black,

            Colors.grey,
            Colors.black,
            //add more colors for gradient
          ],
          begin: Alignment.topRight, //begin of the gradient color
          end: Alignment.bottomLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar:
        AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Icon(Icons.arrow_back, color: kblack),
            ),
          ),
          leadingWidth: 35,
          title: Text(
            widget.announceModel!.text!,
            style: TextStyle(
                color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8))),
          toolbarHeight: 55,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [kgolder2,kgradientYellow,kgolder2]
                ),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15))
            ),
          ),
          backgroundColor: kGray3,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
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
                    Container(
                      height: 300,

                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius
                              .all(
                              Radius
                                  .circular(
                                  8)),
                          gradient:
                          LinearGradient(
                              colors: [
                                kgradientYellow,
                                kgolder
                              ]),
                          border:
                          Border
                              .all(
                            color:
                            kgolder,
                            width:
                            2,
                          )) ,
                      child: ClipRRect(

                          child: Image.file(
                            file as File,width: Get.width,height: 200,
                            fit: BoxFit.fill,
                          )
                      ),
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
                            borderRadius:
                            BorderRadius
                                .all(
                                Radius
                                    .circular(
                                    8)),
                            gradient:
                            LinearGradient(
                                colors: [
                                  kgradientYellow,
                                  kgolder
                                ]),
                            border:
                            Border
                                .all(
                              color:
                              kgolder,
                              width:
                              2,
                            )) ,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.announceModel!.text!,
                                    style: TextStyle(color: kblack,fontWeight: FontWeight.bold,fontSize: 20),
                                  ),
                                  Text(
                                    widget.announceModel!.timestamp!,
                                    style: TextStyle(color: kblack),
                                  ),
                                ],
                              ),
                              Text(
                                'aasdasdasdadadasdasdasdadadadadasdadasdasdasdasdasdasdasdasdadadadadasdasdasdsadsadasdasdadadasdasdsadasdasdasdasdasdadasd',
                                style: TextStyle(color: kblack),
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
      ),
    );
  }
}
