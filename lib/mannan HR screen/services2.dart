import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/constants.dart';

class Services2 extends StatefulWidget {
  const Services2({Key? key}) : super(key: key);

  @override
  _Services2State createState() => _Services2State();
}

class _Services2State extends State<Services2> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
            "Servies ",
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

          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.only(left: 85.0),
                    child: Row(
                      children: [
                        InkWell(onTap: () {

                        },
                          child: Container(
                            height: 30,
                            width: 80,
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

                            child: Center(
                              child: Text("Pending",style: TextStyle(
                                  fontSize: 15
                              ),),
                            ),
                          ),
                        ),
                        SizedBox(width: 30,),
                        InkWell(onTap: () {

                        },
                          child: Container(
                            height: 30,
                            width: 80,
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

                            child: Center(
                              child: Text("Sent",style: TextStyle(
                                  fontSize: 15
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),




                  Container(
                    height: 180,
                    width: Get.width,
                    child: Column(
                      children: [

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
                                  "Emp_Name:",
                                  style: TextStyle(
                                      color:
                                      kblack,
                                      fontWeight:
                                      FontWeight
                                          .bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "Arsalan khan",
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
                            SizedBox(height: 5,),




                            Text(
                              "Cerficate.Name:",
                              style: TextStyle(
                                  color:
                                  kblack,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                  fontSize: 18),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "certificate withoutsalary",
                              style: TextStyle(
                                  color:
                                  kblack,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                  fontSize: 18),
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text(
                                  "Date ",
                                  style: TextStyle(
                                      color:
                                      kblack,
                                      fontWeight:
                                      FontWeight
                                          .bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "2022-06-06",
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
                                width: 150,
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
                                        "Complete certificate",
                                        style: TextStyle(
                                            color: kgolder,
                                            fontSize: 14),
                                      )),
                                ),
                              ),
                            ),


                          ],
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
                  SizedBox(height: 20,),Container(
                    height: 180,
                    width: Get.width,
                    child: Column(
                      children: [

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
                                  "Emp_Name:",
                                  style: TextStyle(
                                      color:
                                      kblack,
                                      fontWeight:
                                      FontWeight
                                          .bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "Arsalan khan",
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
                            SizedBox(height: 5,),




                            Text(
                              "Cerficate.Name:",
                              style: TextStyle(
                                  color:
                                  kblack,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                  fontSize: 18),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "certificate withoutsalary",
                              style: TextStyle(
                                  color:
                                  kblack,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                  fontSize: 18),
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text(
                                  "Date ",
                                  style: TextStyle(
                                      color:
                                      kblack,
                                      fontWeight:
                                      FontWeight
                                          .bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "2022-06-06",
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
                                width: 150,
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
                                        "Complete certificate",
                                        style: TextStyle(
                                            color: kgolder,
                                            fontSize: 14),
                                      )),
                                ),
                              ),
                            ),


                          ],
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
                  ),  SizedBox(height: 20,),Container(
                    height: 180,
                    width: Get.width,
                    child: Column(
                      children: [

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
                                  "Emp_Name:",
                                  style: TextStyle(
                                      color:
                                      kblack,
                                      fontWeight:
                                      FontWeight
                                          .bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "Arsalan khan",
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
                            SizedBox(height: 5,),




                            Text(
                              "Cerficate.Name:",
                              style: TextStyle(
                                  color:
                                  kblack,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                  fontSize: 18),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "certificate withoutsalary",
                              style: TextStyle(
                                  color:
                                  kblack,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                  fontSize: 18),
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text(
                                  "Date ",
                                  style: TextStyle(
                                      color:
                                      kblack,
                                      fontWeight:
                                      FontWeight
                                          .bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "2022-06-06",
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
                                width: 150,
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
                                        "Complete certificate",
                                        style: TextStyle(
                                            color: kgolder,
                                            fontSize: 14),
                                      )),
                                ),
                              ),
                            ),


                          ],
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
                  )
                ]



                ,
              ),
            ),
          ),

        ),
      ),
    );
  }
}
