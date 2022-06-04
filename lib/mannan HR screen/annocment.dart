import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/constants.dart';

class Annoncment extends StatefulWidget {
  const Annoncment({Key? key}) : super(key: key);

  @override
  _AnnoncmentState createState() => _AnnoncmentState();
}

class _AnnoncmentState extends State<Annoncment> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kGray2,
          appBar: AppBar(
          leading: InkWell(
          onTap: () {
    Get.back();
    },
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Icon(Icons.arrow_back, color: kgradientYellow),
      ),
    ),
    leadingWidth: 35,
    title: Text(
    "Annoncment ",
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
    colors: [kgolder2,kgradientYellow]
    ),
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15))
    ),
    ),
    backgroundColor: kGray3,
    ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [kGray3,kblack]
              ),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15))
          ),

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Container(
                  height: 80,
                  width: Get.width,
                  child: Column(
                    children: [
                      Container(
                        height: 35,
                        width:
                        Get.width,
                        decoration:
                        BoxDecoration(
                            borderRadius:
                            BorderRadius
                                .all(
                                Radius
                                    .circular(
                                    8)),
                            gradient:
                            LinearGradient(
                                colors: [
                                  kGray2,
                                  kblack
                                ]),
                            border:
                            Border
                                .all(
                              color:
                              kgolder,
                              width:
                              2,
                            )),
                        child: Row(
                          children: [
                            Center(
                              child:
                              Padding(
                                padding:
                                EdgeInsets
                                    .only(
                                    left: 10.0),
                                child:
                                Text(
                                  "Fahad kharadi",
                                  style: TextStyle(
                                      color: kgolder,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        height: 35,
                        width:
                        Get.width,
                        child: TextField(

                        ),
                        decoration:
                        BoxDecoration(
                            borderRadius:
                            BorderRadius
                                .all(
                                Radius
                                    .circular(
                                    8)),
                            gradient:
                            LinearGradient(
                                colors: [
                                  kGray2,
                                  kblack
                                ]),
                            border:
                            Border
                                .all(
                              color:
                              kgolder,
                              width:
                              2,
                            )),
                      ),


                    ],
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [ kgradientYellow,kgolder2]
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(
                        color:kgolder,
                        width: 2,
                      )
                  ),
                ),
              )
            ]



            ,
          ),

        ),
      ),
    );
  }
}
