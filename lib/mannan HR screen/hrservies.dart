import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/constants.dart';

class HRServices extends StatefulWidget {
  const HRServices({Key? key}) : super(key: key);

  @override
  State<HRServices> createState() => HRServicesState();
}

class HRServicesState extends State<HRServices> {
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: kGray3,
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
              "Services",
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
          body: Container(

            child: DefaultTabController(
              length: 1,
              child: Scaffold(
                backgroundColor: kGray2,
                body: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          kGray3,
                          kblack,
                        ],
                      )),
                  child: Column(
                    children: [
                      // Container(
                      //
                      //   width: Get.width,
                      //   decoration: BoxDecoration(
                      //     gradient:  LinearGradient(
                      //       colors: [Colors.black, Colors.grey.shade600],
                      //       begin: Alignment.topCenter,
                      //       end: Alignment.bottomCenter,),
                      //     borderRadius: BorderRadius.only(
                      //         bottomLeft: Radius.circular(10),
                      //         bottomRight: Radius.circular(10)),
                      //   ),
                      //   child: Container(
                      //     child: Column(
                      //       children: [
                      //         // Padding(
                      //         //   padding:   EdgeInsets.only(left: 15.0),
                      //         //   child: Row(
                      //         //     children: [
                      //         //       Icon(Icons.keyboard_backspace,color: kgolder),
                      //         //       SizedBox(width: 5),
                      //         //       Text("Leaves Request",style: TextStyle(color: kgolder,fontSize: 18),),
                      //         //     ],
                      //         //   ),
                      //         // ),////
                      //         ///old///leave
                      //         SizedBox(height: 8,),
                      //         Container(
                      //           height: 50,
                      //
                      //         ),///request/history//tapbar
                      //       ],
                      //     ),
                      //   ),
                      // ),///request/history//tapbar
                      SizedBox(height: 10),
                      Container(
                        child: Expanded(
                          child: TabBarView(
                            children: [
                              Container(
                                child: DefaultTabController(
                                    length: 3,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 45,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [kgolder2,kgradientYellow,kgolder2]
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                                border: Border.all(
                                                  color: kblack,
                                                  width: 2,
                                                )
                                            ),

                                            child: Padding(
                                              padding:   EdgeInsets.all(1.0),
                                              child: TabBar(
                                                labelStyle: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight
                                                        .w600),
                                                labelColor: kgolder,
                                                unselectedLabelColor: kblack,
                                                indicator: BoxDecoration(
                                                  color: kGray2,
                                                  borderRadius: BorderRadius
                                                      .all(
                                                      Radius.circular(8)),
                                                  // border: Border.all(
                                                  //   color: kgolder,
                                                  //   width: 2,
                                                  // ),
                                                ),
                                                tabs: [
                                                  Tab(
                                                    child: Text(
                                                      "Pending",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontFamily: 'Typo Round',
                                                          fontWeight:
                                                          FontWeight.w400),
                                                    ),
                                                  ),
                                                  Tab(
                                                    child: Text(
                                                      "Accepted",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontFamily: 'Typo Round',
                                                          fontWeight:
                                                          FontWeight.w400),
                                                    ),
                                                  ),
                                                  Tab(
                                                    child: Text(
                                                      "Rejected",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontFamily: 'Typo Round',
                                                          fontWeight:
                                                          FontWeight.w400),),),],),),),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          child: Expanded(
                                            child: TabBarView(
                                              children: [
                                                DefaultTabController(
                                                    length: 1,
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.all(10),
                                                          child: Container(
                                                            width: Get.width,
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
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsets.all(8),
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
                                                                  SizedBox(
                                                                      height: 10),
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
                                                                                                Container(
                                                                                                  height: 30,
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.all(Radius.circular(10)),


                                                                                                  ),
                                                                                                  child:Padding(
                                                                                                    padding:  EdgeInsets.only(left: 8,right: 8),
                                                                                                    child: Center(child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),)),
                                                                                                  ) ,
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
                                                                                              Container(
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
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                                DefaultTabController(
                                                    length: 1,
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.all(10),
                                                          child: Container(
                                                            width: Get.width,
                                                            decoration:
                                                            BoxDecoration(
                                                                gradient:
                                                                LinearGradient(
                                                                    colors: [
                                                                      kgradientYellow,kgolder2
                                                                    ]),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                    .circular(
                                                                    8)),
                                                                border:
                                                                Border.all(
                                                                  color:
                                                                  kgolder,
                                                                  width: 2,
                                                                )),
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsets.all(8),
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
                                                                  SizedBox(
                                                                      height: 10),
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
                                                                            "User employee",
                                                                            style: TextStyle(
                                                                                color:
                                                                                kblack,
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                          Text(
                                                                            "121213",
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
                                                                            "Replacement name:",
                                                                            style: TextStyle(
                                                                                color:
                                                                                kblack,
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                          Text(
                                                                            "fahad shaik",
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
                                                                            "Replacement employee ID:",
                                                                            style: TextStyle(
                                                                                color:
                                                                                kblack,
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                          Text(
                                                                            "25136",
                                                                            style: TextStyle(
                                                                                color:
                                                                                kblack,
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                        ],
                                                                      ), Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            "Replacment phone: ",
                                                                            style: TextStyle(
                                                                                color:
                                                                                kblack,
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                          Text(
                                                                            "862559693",
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
                                                                            "Replacment type: ",
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
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            "Status:",
                                                                            style: TextStyle(
                                                                                color:
                                                                                kblack,
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                          Text(
                                                                            "Accepted",
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
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                                DefaultTabController(
                                                    length: 1,
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.all(10),
                                                          child: Container(
                                                            width: Get.width,
                                                            decoration:
                                                            BoxDecoration(
                                                                gradient:
                                                                LinearGradient(
                                                                    colors: [
                                                                      kgradientYellow,kgolder2
                                                                    ]),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                    .circular(
                                                                    8)),
                                                                border:
                                                                Border.all(
                                                                  color:
                                                                  kgolder,
                                                                  width: 2,
                                                                )),
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsets.all(8),
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
                                                                  SizedBox(
                                                                      height: 10),
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
                                                                            "User employee",
                                                                            style: TextStyle(
                                                                                color:
                                                                                kblack,
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                          Text(
                                                                            "121213",
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
                                                                            "Replacement name:",
                                                                            style: TextStyle(
                                                                                color:
                                                                                kblack,
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                          Text(
                                                                            "fahad shaik",
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
                                                                            "Replacement employee ID:",
                                                                            style: TextStyle(
                                                                                color:
                                                                                kblack,
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                          Text(
                                                                            "25136",
                                                                            style: TextStyle(
                                                                                color:
                                                                                kblack,
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                        ],
                                                                      ), Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            "Replacment phone: ",
                                                                            style: TextStyle(
                                                                                color:
                                                                                kblack,
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                          Text(
                                                                            "862559693",
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
                                                                            "Replacment type: ",
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
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            "Status:",
                                                                            style: TextStyle(
                                                                                color:
                                                                                kblack,
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                          Text(
                                                                            "Accepted",
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
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ),

                              ///tapbar
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}