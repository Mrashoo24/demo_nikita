import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/constants.dart';

class HrEnrollCourses extends StatefulWidget {
  const HrEnrollCourses({Key? key}) : super(key: key);

  @override
  _HrEnrollCoursesState createState() => _HrEnrollCoursesState();
}

class _HrEnrollCoursesState extends State<HrEnrollCourses> {

  double screenHeight = 0;
  double screenWidth = 0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: DefaultTabController(
      length: 2,
      child: Scaffold(

        body: Container(
          decoration: BoxDecoration(
            gradient:  LinearGradient(
              colors: [kgolder, Colors.yellow.shade100 ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,),

          ),
          child: Column(
            children: [
              Container(
                height: screenHeight / 5.5,
                width: Get.width,
                decoration: BoxDecoration(
                  gradient:  LinearGradient(
                    colors: [Colors.black, Colors.grey.shade600],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,),
                  borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              ),
                child: Container(

                  child: Column(
                    children: [
                    SizedBox(height: 15),
                      Row(
                        children: [
                          SizedBox( width: 10,),
                          Icon(Icons.arrow_back,color: kgolder,),
                          SizedBox(width: 10),
                          Text("Courses",style: TextStyle(color: kgolder,fontSize: screenHeight / 22),)
                        ],
                      ),
                      SizedBox(height: 8,),
                      Padding(
                        padding:   EdgeInsets.all(8.0),
                        child: TabBar(labelStyle: TextStyle(
                            fontSize: 25,
                            fontWeight:FontWeight.w600),
                          labelColor: Colors.black,
                          indicator: BoxDecoration(
                            color: kgolder,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12))
                          ),
                          tabs: [
                          Tab(text: "HR Courses",),
                          Tab(text: "Enroll Courses"),
                        ],
                        ),
                      ),


                    ],
                  ),
                ),

              ),
              Container(

                child: Expanded(

                  child: TabBarView(
                      children: [

                      ListView(
                        children: [
                          buildHRcourses(),
                          buildHRcourses(),
                          buildHRcourses(),
                          buildHRcourses(),
                          buildHRcourses(),
                        ],
                      ),
                        ListView(
                          children: [
                            buildERcourses(),
                            buildERcourses(),
                            buildERcourses(),
                            buildERcourses(),
                            buildERcourses(),
                          ],
                        )

                        
                  ]
                  ),
                ),

              )
            ],
          ),
        ),
      )
      ),
    );
  }

  Padding buildERcourses( ) {
    return Padding(
                        padding:   EdgeInsets.all(8.0),
                        child: Column(

                          children: [
                            InkWell(
                              onTap: (){

                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(
                                          builder: (context, setState1){
                                            return AlertDialog(
                                              contentPadding: EdgeInsets.all(3),
                                              backgroundColor: kgolder,

                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(20)),),

                                              content:SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    Container(

                                                        decoration: BoxDecoration(
                                                          gradient:  LinearGradient(
                                                            colors: [Colors.black, Colors.grey.shade600],
                                                            begin: Alignment.centerRight,
                                                            end: Alignment.centerLeft,),

                                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                                        ),
                                                        child: Padding(
                                                          padding:   EdgeInsets.all(8.0),
                                                          child: Column(
                                                              children: [

                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Text("Title :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kgolder),),
                                                                    Container(
                                                                      height: 35,
                                                                      width: 200,

                                                                      child: Padding(
                                                                        padding:   EdgeInsets.all(4),
                                                                        child: Text("Courses One",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                                      ),
                                                                      decoration: BoxDecoration(
                                                                          color: kgolder,
                                                                          borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                          border: Border.all(width: 3,color: Colors.black)
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(height: 5,),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Text("ID :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kgolder),),
                                                                    Container(
                                                                      height: 35,
                                                                      width: 200,

                                                                      child: Padding(
                                                                        padding:   EdgeInsets.all(4),
                                                                        child: Text("63847",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                                      ),
                                                                      decoration: BoxDecoration(
                                                                          color: kgolder,
                                                                          borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                          border: Border.all(width: 3,color: Colors.black)
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(height: 5,),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Text("Venue :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kgolder),),
                                                                    Container(
                                                                      height: 35,
                                                                      width: 200,

                                                                      child: Padding(
                                                                        padding:   EdgeInsets.all(4),
                                                                        child: Text("Venue One",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                                      ),
                                                                      decoration: BoxDecoration(
                                                                          color: kgolder,
                                                                          borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                          border: Border.all(width: 3,color: Colors.black)
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(height: 5,),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Text("Date :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kgolder),),
                                                                    Container(
                                                                      height: 35,
                                                                      width: 200,

                                                                      child: Padding(
                                                                        padding:   EdgeInsets.all(4),
                                                                        child: Text("2022-01-15- 07:00 AM",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                                      ),
                                                                      decoration: BoxDecoration(
                                                                          color: kgolder,
                                                                          borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                          border: Border.all(width: 3,color: Colors.black)
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(height: 5,),
                                                                Row(
                                                                  children: [
                                                                    Text("Description :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kgolder),),
                                                                  ],
                                                                ),
                                                                Container(

                                                                  width: Get.width,

                                                                  child: Padding(
                                                                    padding:   EdgeInsets.all(4),
                                                                    child: Text("Do more with MultiQRCreate unlimited branded QR codes and start accepting payments for FREE. T&C apply.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                                  ),
                                                                  decoration: BoxDecoration(
                                                                      color: kgolder,
                                                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                      border: Border.all(width: 2,color: Colors.black)
                                                                  ),
                                                                ),
                                                                SizedBox(height : 40,),

                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  children: [
                                                                    Container(
                                                                      child: Padding(
                                                                        padding:   EdgeInsets.all(4),
                                                                        child: Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                                                      ),
                                                                      decoration: BoxDecoration(
                                                                          color: kgolder,
                                                                          borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                          border: Border.all(width: 2,color: Colors.black)
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      onTap: () {
                                                                        Get.back();
                                                                      },
                                                                      child: Padding(
                                                                        padding:   EdgeInsets.all(4.0),
                                                                        child: Text("Cancel",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: kgolder),),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),]
                                                          ),
                                                        )
                                                    )
                                                  ],
                                                ),
                                              ) ,
                                            );
                                          }
                                      );
                                    });
                              },
                              child: Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                    gradient:  LinearGradient(
                                      colors: [Colors.grey, Colors.black  ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,),
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                    border: Border.all(width: 3,color: kgolder)
                                ),
                                child: Padding(
                                  padding:   EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: Get.width,
                                        child: Padding(
                                          padding:   EdgeInsets.only(left: 8,top: 4,right: 8,bottom: 4),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Courses One",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                              GestureDetector(
                                                onTap: (){
                                                  Get.defaultDialog(
                                                    title: "Exit The Course ?",
                                                    backgroundColor: kgolder,
                                                    textCancel: "Exit",
                                                    textConfirm: "Cancel",
                                                    buttonColor: Colors.black,
                                                    middleText: "Are you sure wan to Exit the course ?",
                                                    cancelTextColor: Colors.black,
                                                    confirmTextColor: kgolder,
                                                    barrierDismissible: true,
                                                  );
                                                },
                                                child: Container(

                                                  width: 50,
                                                  child: Center(child: Text("Exit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: kgolder),)),
                                                  decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                                      border: Border.all(width: 3,color: Colors.black)
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            gradient:  LinearGradient(
                                              colors: [Colors.yellow.shade100, kgolder  ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,),
                                            borderRadius: BorderRadius.all(Radius.circular(12)),
                                            border: Border.all(width: 3,color: Colors.black)
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Venue One",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 20 ),),
                                              Text("2022-01-15 07:00 am",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder, fontSize: 20),),
                                            ],
                                          ),
                                          Container(

                                            child: Padding(
                                              padding:   EdgeInsets.only(left: 8,right: 8,top: 3,bottom: 3),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text("In: 11:46 pm",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                                  Text("Out: 11:46 pm",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                                ],
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: kgolder,
                                              borderRadius: BorderRadius.all(Radius.circular(12)),
                                              border: Border.all(width: 3,color: Colors.black),
                                              gradient:  LinearGradient(
                                                colors: [Colors.yellow.shade100, kgolder  ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),


                          ],
                        ),
                      );
  }

  Padding buildHRcourses() {
    return Padding(
                    padding:   EdgeInsets.all(8.0),
                    child: Column(

                      children: [
                        InkWell(
                          onTap: (){

                            showDialog(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                      builder: (context, setState1){
                                        return AlertDialog(
                                          contentPadding: EdgeInsets.all(3),
                                          backgroundColor: kgolder,

                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),),

                                          content:SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Container(

                                                    decoration: BoxDecoration(
                                                      gradient:  LinearGradient(
                                                        colors: [Colors.black, Colors.grey.shade600],
                                                        begin: Alignment.centerRight,
                                                        end: Alignment.centerLeft,),

                                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                                    ),
                                                    child: Padding(
                                                      padding:   EdgeInsets.all(8.0),
                                                      child: Column(
                                                          children: [

                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Text("Title :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kgolder),),
                                                                Container(
                                                                  height: 35,
                                                                  width: 200,

                                                                  child: Padding(
                                                                    padding:   EdgeInsets.all(4),
                                                                    child: Text("Courses One",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                                  ),
                                                                  decoration: BoxDecoration(
                                                                      color: kgolder,
                                                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                      border: Border.all(width: 3,color: Colors.black)
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(height: 5,),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Text("ID :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kgolder),),
                                                                Container(
                                                                  height: 35,
                                                                  width: 200,

                                                                  child: Padding(
                                                                    padding:   EdgeInsets.all(4),
                                                                    child: Text("63847",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                                  ),
                                                                  decoration: BoxDecoration(
                                                                      color: kgolder,
                                                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                      border: Border.all(width: 3,color: Colors.black)
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(height: 5,),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Text("Venue :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kgolder),),
                                                                Container(
                                                                  height: 35,
                                                                  width: 200,

                                                                  child: Padding(
                                                                    padding:   EdgeInsets.all(4),
                                                                    child: Text("Venue One",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                                  ),
                                                                  decoration: BoxDecoration(
                                                                      color: kgolder,
                                                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                      border: Border.all(width: 3,color: Colors.black)
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(height: 5,),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Text("Date :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kgolder),),
                                                                Container(
                                                                  height: 35,
                                                                  width: 200,

                                                                  child: Padding(
                                                                    padding:   EdgeInsets.all(4),
                                                                    child: Text("2022-01-15- 07:00 AM",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                                  ),
                                                                  decoration: BoxDecoration(
                                                                      color: kgolder,
                                                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                      border: Border.all(width: 3,color: Colors.black)
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(height: 5,),
                                                            Row(
                                                              children: [
                                                                Text("Description :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kgolder),),
                                                              ],
                                                            ),
                                                            Container(

                                                              width: Get.width,

                                                              child: Padding(
                                                                padding:   EdgeInsets.all(4),
                                                                child: Text("Do more with MultiQRCreate unlimited branded QR codes and start accepting payments for FREE. T&C apply.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                              ),
                                                              decoration: BoxDecoration(
                                                                  color: kgolder,
                                                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                  border: Border.all(width: 2,color: Colors.black)
                                                              ),
                                                            ),
                                                            SizedBox(height : 40,),

                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              children: [
                                                                Container(
                                                                  child: Padding(
                                                                    padding:   EdgeInsets.all(4),
                                                                    child: Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                                                  ),
                                                                  decoration: BoxDecoration(
                                                                      color: kgolder,
                                                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                      border: Border.all(width: 2,color: Colors.black)
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    Get.back();
                                                                  },
                                                                  child: Padding(
                                                                    padding:   EdgeInsets.all(4.0),
                                                                    child: Text("Cancel",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: kgolder),),
                                                                  ),
                                                                )
                                                              ],
                                                            ),





                                                          ]
                                                      ),
                                                    )
                                                )
                                              ],

                                            ),
                                          ) ,
                                        );
                                      }

                                  );
                                });

                          },
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              gradient:  LinearGradient(
                                colors: [Colors.grey, Colors.black  ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,),
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              border: Border.all(width: 3,color: kgolder)
                            ),
                            child: Padding(
                              padding:   EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35,
                                    width: Get.width,
                                    child: Padding(
                                      padding:   EdgeInsets.only(left: 8.0,top: 6),
                                      child: Text("Courses One",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                    ),
                                    decoration: BoxDecoration(
                                        gradient:  LinearGradient(
                                          colors: [Colors.yellow.shade100, kgolder  ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,),
                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                        border: Border.all(width: 3,color: Colors.black)
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text("Venue One",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 20 ),),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("2022-01-15 07:00 am",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder, fontSize: 20),),

                                      Container(
                                        child: Padding(
                                          padding:   EdgeInsets.only(left: 8,right: 8,top: 3,bottom: 3),
                                          child: Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                        ),
                                        decoration: BoxDecoration(
                                            color: kgolder,
                                            borderRadius: BorderRadius.all(Radius.circular(12)),
                                            border: Border.all(width: 3,color: Colors.black)
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),


                      ],
                    ),
                  );
  }
}
