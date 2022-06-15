import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

 import '../Components/constants.dart';

class Anounncement extends StatefulWidget {
  const Anounncement({Key? key}) : super(key: key);

  @override
  State<Anounncement> createState() => _AnounncementState();
}

class _AnounncementState extends State<Anounncement> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 14.0),
                child: Icon(Icons.arrow_back, color: kblack),
              ),
            ),
            leadingWidth: 40,
            title: Text(
              "Announcements ",
              style: TextStyle(
                  color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            toolbarHeight: 65,
            backgroundColor: kgolder2,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    kgolder,
                    kgradientYellow,
                    kgolder
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
            ),
          ),
          backgroundColor: kblack,
          body:Container(
            decoration:  BoxDecoration(
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
            child: Column(
              children: [


                Padding(
                  padding: const EdgeInsets.all( 10.0),
                  child: Container(
                    width: Get.width,
                    child:  Column(
                      children: [SizedBox(height: 5,),
                        Container(
                          height: 35,
                          width:
                          Get.width,
                          decoration:
                          BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(
                                  8)),
                              gradient:
                              LinearGradient(colors: [
                                kGray2,kblack,

                              ]),
                              border:
                              Border.all(
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
                                  EdgeInsets.only(left: 10.0),
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
                        Container(height: 40,

                          child: TextFormField(
                              decoration: InputDecoration(

                                filled: true,
                                fillColor:  kgolder,
                                contentPadding: EdgeInsets.only(left: 10, top: 12, bottom: 10),
                                hintText: 'Check',
                                hintStyle: TextStyle(color: kgolder, fontSize: 15),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: kgolder)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kgolder)),
                              )),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          kgolder2,
                          kgradientYellow,
                          kgolder2
                        ]),
                        borderRadius: BorderRadius.all(
                            Radius.circular(8)),
                        border: Border.all(
                          color: kblack,
                          width: 2,
                        )),
                  ),
                ),
              ],
            ),
          ),)
    );
  }
}