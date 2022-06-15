import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/constants.dart';

class Corses extends StatefulWidget {
  const Corses({Key? key}) : super(key: key);
  @override
  _CorsesState createState() => _CorsesState();
}

class _CorsesState extends State<Corses> {
  DateTime dateTime = DateTime.now();

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
              child: Icon(Icons.arrow_back, color: kblack),
            ),
          ),
          leadingWidth: 35,
          title: Text(
            "Courses",
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: kgolder2,
          onPressed: (){
            Get.defaultDialog(
              title: "Add Courses",
                content: Container(
                height: Get.height*0.4,
                  child: Column(
                    children: [
                      buildTextFormField("Title"),
                      buildTextFormField("Venue"),
                      Expanded(child: builDatePicket()),


                    ],
                  ),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
        body: Container(
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

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25,left: 15,right: 15),
                child: Column(
                  children: [
                    Container(
                      // height: 180,
                      width: Get.width,
                      child: Padding(
                        padding:  EdgeInsets.all(8.0),
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
                                          "Courses 1",
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
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        "Phone:",
                                        style: TextStyle(
                                            color:
                                            kblack,
                                            fontWeight:
                                            FontWeight
                                                .bold,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        "9553439168",
                                        style: TextStyle(
                                            color:
                                            kblack,
                                            fontWeight:
                                            FontWeight
                                                .bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        "From",
                                        style: TextStyle(
                                            color:
                                            kblack,
                                            fontWeight:
                                            FontWeight
                                                .bold,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        "16/08/2022 12.00 am",
                                        style: TextStyle(
                                            color:
                                            kblack,
                                            fontWeight:
                                            FontWeight
                                                .bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        "To",
                                        style: TextStyle(
                                            color:
                                            kblack,
                                            fontWeight:
                                            FontWeight
                                                .bold,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        "25/08/2022 12.00 am",
                                        style: TextStyle(
                                            color:
                                            kblack,
                                            fontWeight:
                                            FontWeight
                                                .bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text(
                                        "Replacment type ",
                                        style: TextStyle(
                                            color:
                                            kblack,
                                            fontWeight:
                                            FontWeight
                                                .bold,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        "Temporary",
                                        style: TextStyle(
                                            color:
                                            kblack,
                                            fontWeight:
                                            FontWeight
                                                .bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                      15),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .end,
                                    children: [
                                      InkWell(
                                        onTap:
                                            () {
                                          Get.defaultDialog(
                                              title: "",

                                              titleStyle: TextStyle(color: kgolder),
                                              titlePadding: EdgeInsets.only(right: 100,top: 5),
                                              backgroundColor: Colors.transparent,

                                              content: Container(
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                                  gradient: LinearGradient(
                                                      colors: [ kGray3,kblack]
                                                  ),
                                                  border: Border.all(
                                                    color:kgolder,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:   EdgeInsets.all(10),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text("Fahad Kharadi",style: TextStyle(color:kgolder ),),
                                                                SizedBox(height: 15),
                                                                Text("Emp ID: ",style: TextStyle(color:kgolder ),),
                                                                Text("Designation: ",style: TextStyle(color:kgolder ),),
                                                                Text("Phone: ",style: TextStyle(color:kgolder ),),
                                                                Text("Email : ",style: TextStyle(color:kgolder ),),
                                                                SizedBox(height: 15),
                                                                Text("Request Details: \nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc",
                                                                  style: TextStyle(color:kgolder ),),

                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 15),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [
                                                            Container(
                                                              height: 30,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                color: kgolder,

                                                              ),
                                                              child:Padding(
                                                                padding:  EdgeInsets.only(left: 8,right: 8),
                                                                child: Center(child: Text("Approve",style: TextStyle(color: kblack,fontSize:18),)),
                                                              ) ,
                                                            ),
                                                            InkWell(
                                                              onTap: (){
                                                                Get.back();
                                                              },
                                                              child: Padding(
                                                                padding:  EdgeInsets.only(left: 8,right: 8),
                                                                child: Center(child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              radius: 50
                                          );
                                        },
                                        child:
                                        Container(
                                          height:
                                          30,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .all(
                                                  Radius
                                                      .circular(
                                                      10)),
                                              color: kGray3,
                                              border: Border
                                                  .all(
                                                color: kblack,
                                                width: 2,
                                              )),
                                          child:
                                          Padding(
                                            padding:
                                            EdgeInsets
                                                .only(
                                                left: 8,
                                                right: 8),
                                            child: Center(
                                                child: Text(
                                                  "Approve",
                                                  style: TextStyle(
                                                      color: kgolder,
                                                      fontSize: 18),
                                                )),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                        10,
                                      ),
                                      InkWell(
                                        onTap:
                                            () {
                                          Get
                                              .defaultDialog(
                                              title: "",
                                              titleStyle: TextStyle(
                                                  color: kgolder),
                                              titlePadding: EdgeInsets
                                                  .only(
                                                  right: 100,
                                                  top: 5),
                                              backgroundColor: Colors
                                                  .transparent,
                                              content: Container(
                                                width: Get
                                                    .width,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .all(
                                                      Radius
                                                          .circular(
                                                          8)),
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        kGray3,
                                                        kblack
                                                      ]),
                                                  border: Border
                                                      .all(
                                                    color: kgolder,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets
                                                      .all(
                                                      10),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .start,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                "Fahad Kharadi",
                                                                style: TextStyle(
                                                                    color: kgolder),
                                                              ),
                                                              SizedBox(
                                                                  height: 15),
                                                              Text(
                                                                "Emp ID: ",
                                                                style: TextStyle(
                                                                    color: kgolder),
                                                              ),
                                                              Text(
                                                                "Designation: ",
                                                                style: TextStyle(
                                                                    color: kgolder),
                                                              ),
                                                              Text(
                                                                "Phone: ",
                                                                style: TextStyle(
                                                                    color: kgolder),
                                                              ),
                                                              Text(
                                                                "Email : ",
                                                                style: TextStyle(
                                                                    color: kgolder),
                                                              ),
                                                              SizedBox(
                                                                  height: 15),
                                                              Text(
                                                                "Request Details: \nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc",
                                                                style: TextStyle(
                                                                    color: kgolder),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                          height: 15),
                                                      Container(
                                                        width: Get
                                                            .width,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .all(
                                                              Radius
                                                                  .circular(
                                                                  8)),
                                                          gradient: LinearGradient(
                                                              colors: [
                                                                kgradientYellow,
                                                                kgolder2
                                                              ]),
                                                          border: Border
                                                              .all(
                                                            color: kgolder,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .all(
                                                              10.0),
                                                          child: Text(
                                                              "Reason:\nLoremipsum dola sit \namet connector adsipising elit "),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: 15),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .end,
                                                        children: [
                                                          Container(
                                                            height: 30,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius
                                                                  .all(
                                                                  Radius
                                                                      .circular(
                                                                      10)),
                                                              color: kgolder,
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  left: 8,
                                                                  right: 8),
                                                              child: Center(
                                                                  child: Text(
                                                                    "Reject",
                                                                    style: TextStyle(
                                                                        color: kblack),
                                                                  )),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: (){
                                                              Get.back();
                                                            },
                                                            child: Container(
                                                              height: 30,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(
                                                                    Radius
                                                                        .circular(
                                                                        10)),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    left: 8,
                                                                    right: 8),
                                                                child: Center(
                                                                    child: Text(
                                                                      "Cancel",
                                                                      style: TextStyle(
                                                                          color: kgolder),
                                                                    )),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              radius: 50);
                                        },
                                        child:
                                        Container(
                                          height:
                                          30,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .all(
                                                  Radius
                                                      .circular(
                                                      10)),
                                              color: kGray3,
                                              border: Border
                                                  .all(
                                                color: kblack,
                                                width: 2,
                                              )),
                                          child:
                                          Padding(
                                            padding:
                                            EdgeInsets
                                                .only(
                                                left: 8,
                                                right: 8),
                                            child: Center(
                                                child: Text(
                                                  "Reject",
                                                  style: TextStyle(
                                                      color: kgolder,
                                                      fontSize: 18),
                                                )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),


                            ],
                          ),
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
                    SizedBox(height: 15,),
                    Container(
                      width: Get.width,
                      child: Padding(
                        padding:  EdgeInsets.all(8.0),
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
                                        "Courses 2",
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
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  children: [
                                    Text(
                                      "Phone:",
                                      style: TextStyle(
                                          color:
                                          kblack,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "9553439168",
                                      style: TextStyle(
                                          color:
                                          kblack,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  children: [
                                    Text(
                                      "From",
                                      style: TextStyle(
                                          color:
                                          kblack,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "16/08/2022 12.00 am",
                                      style: TextStyle(
                                          color:
                                          kblack,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  children: [
                                    Text(
                                      "To",
                                      style: TextStyle(
                                          color:
                                          kblack,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "25/08/2022 12.00 am",
                                      style: TextStyle(
                                          color:
                                          kblack,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      "Replacment type ",
                                      style: TextStyle(
                                          color:
                                          kblack,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "Temporary",
                                      style: TextStyle(
                                          color:
                                          kblack,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height:
                                    15),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .end,
                                  children: [
                                    InkWell(
                                      onTap:
                                          () {
                                        Get.defaultDialog(
                                            title: "",

                                            titleStyle: TextStyle(color: kgolder),
                                            titlePadding: EdgeInsets.only(right: 100,top: 5),
                                            backgroundColor: Colors.transparent,

                                            content: Container(
                                              width: Get.width,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                gradient: LinearGradient(
                                                    colors: [ kGray3,kblack]
                                                ),
                                                border: Border.all(
                                                  color:kgolder,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:   EdgeInsets.all(10),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text("Fahad Kharadi",style: TextStyle(color:kgolder ),),
                                                              SizedBox(height: 15),
                                                              Text("Emp ID: ",style: TextStyle(color:kgolder ),),
                                                              Text("Designation: ",style: TextStyle(color:kgolder ),),
                                                              Text("Phone: ",style: TextStyle(color:kgolder ),),
                                                              Text("Email : ",style: TextStyle(color:kgolder ),),
                                                              SizedBox(height: 15),
                                                              Text("Request Details: \nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc",
                                                                style: TextStyle(color:kgolder ),),

                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 15),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Container(
                                                            height: 30,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              color: kgolder,

                                                            ),
                                                            child:Padding(
                                                              padding:  EdgeInsets.only(left: 8,right: 8),
                                                              child: Center(child: Text("Approve",style: TextStyle(color: kblack,fontSize:18),)),
                                                            ) ,
                                                          ),
                                                          InkWell(
                                                            onTap: (){
                                                              Get.back();
                                                            },
                                                            child: Padding(
                                                              padding:  EdgeInsets.only(left: 8,right: 8),
                                                              child: Center(child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            radius: 50
                                        );
                                      },
                                      child:
                                      Container(
                                        height:
                                        30,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius
                                                .all(
                                                Radius
                                                    .circular(
                                                    10)),
                                            color: kGray3,
                                            border: Border
                                                .all(
                                              color: kblack,
                                              width: 2,
                                            )),
                                        child:
                                        Padding(
                                          padding:
                                          EdgeInsets
                                              .only(
                                              left: 8,
                                              right: 8),
                                          child: Center(
                                              child: Text(
                                                "Approve",
                                                style: TextStyle(
                                                    color: kgolder,
                                                    fontSize: 18),
                                              )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                      10,
                                    ),
                                    InkWell(
                                      onTap:
                                          () {
                                        Get
                                            .defaultDialog(
                                            title: "",
                                            titleStyle: TextStyle(
                                                color: kgolder),
                                            titlePadding: EdgeInsets
                                                .only(
                                                right: 100,
                                                top: 5),
                                            backgroundColor: Colors
                                                .transparent,
                                            content: Container(
                                              width: Get
                                                  .width,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .all(
                                                    Radius
                                                        .circular(
                                                        8)),
                                                gradient: LinearGradient(
                                                    colors: [
                                                      kGray3,
                                                      kblack
                                                    ]),
                                                border: Border
                                                    .all(
                                                  color: kgolder,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets
                                                    .all(
                                                    10),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Text(
                                                              "Fahad Kharadi",
                                                              style: TextStyle(
                                                                  color: kgolder),
                                                            ),
                                                            SizedBox(
                                                                height: 15),
                                                            Text(
                                                              "Emp ID: ",
                                                              style: TextStyle(
                                                                  color: kgolder),
                                                            ),
                                                            Text(
                                                              "Designation: ",
                                                              style: TextStyle(
                                                                  color: kgolder),
                                                            ),
                                                            Text(
                                                              "Phone: ",
                                                              style: TextStyle(
                                                                  color: kgolder),
                                                            ),
                                                            Text(
                                                              "Email : ",
                                                              style: TextStyle(
                                                                  color: kgolder),
                                                            ),
                                                            SizedBox(
                                                                height: 15),
                                                            Text(
                                                              "Request Details: \nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc",
                                                              style: TextStyle(
                                                                  color: kgolder),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                        height: 15),
                                                    Container(
                                                      width: Get
                                                          .width,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .all(
                                                            Radius
                                                                .circular(
                                                                8)),
                                                        gradient: LinearGradient(
                                                            colors: [
                                                              kgradientYellow,
                                                              kgolder2
                                                            ]),
                                                        border: Border
                                                            .all(
                                                          color: kgolder,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .all(
                                                            10.0),
                                                        child: Text(
                                                            "Reason:\nLoremipsum dola sit \namet connector adsipising elit "),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: 15),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .end,
                                                      children: [
                                                        Container(
                                                          height: 30,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius
                                                                .all(
                                                                Radius
                                                                    .circular(
                                                                    10)),
                                                            color: kgolder,
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .only(
                                                                left: 8,
                                                                right: 8),
                                                            child: Center(
                                                                child: Text(
                                                                  "Reject",
                                                                  style: TextStyle(
                                                                      color: kblack),
                                                                )),
                                                          ),
                                                        ),
                                                        InkWell(

                                                          onTap: (){
                                                            Get.back();
                                                          },
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .only(
                                                                left: 8,
                                                                right: 8),
                                                            child: Center(
                                                                child: Text(
                                                                  "Cancel",
                                                                  style: TextStyle(
                                                                      color: kgolder),
                                                                )),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            radius: 50);
                                      },
                                      child:
                                      Container(
                                        height:
                                        30,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius
                                                .all(
                                                Radius
                                                    .circular(
                                                    10)),
                                            color: kGray3,
                                            border: Border
                                                .all(
                                              color: kblack,
                                              width: 2,
                                            )),
                                        child:
                                        Padding(
                                          padding:
                                          EdgeInsets
                                              .only(
                                              left: 8,
                                              right: 8),
                                          child: Center(
                                              child: Text(
                                                "Reject",
                                                style: TextStyle(
                                                    color: kgolder,
                                                    fontSize: 18),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
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
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField(string) {
    return TextFormField(
                      decoration: InputDecoration(
                        hintText: string,
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kgolder2)
                        ),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:kgolder2))
                      ),
                    );
  }
  Widget builDatePicket() => CupertinoDatePicker(initialDateTime: dateTime,
  mode: CupertinoDatePickerMode.date, onDateTimeChanged: (dateTime) =>
    setState(() => this.dateTime=dateTime),
  );
}
