import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        body: Column(
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
              child: Column(
                children: [
                SizedBox(height: 15),
                  Row(
                    children: [
                      SizedBox( width: 10,),
                      Icon(Icons.arrow_back,color: kgolder,),
                      SizedBox(width: 10),
                      Text("Courses",style: TextStyle(color: kgolder,fontSize: screenHeight / 20),)
                    ],
                  ),
                  SizedBox(height: screenHeight / 200,),
                  Padding(
                    padding:   EdgeInsets.all(8.0),
                    child: TabBar(labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight:FontWeight.w600),
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
            Expanded(
              child: TabBarView(children: [
                Padding(
                  padding:   EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
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
                                  child: Text("Courses One",style: TextStyle(fontWeight: FontWeight.bold),),
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
                            ],
                          ),
                        ),

                      ),
                    ],
                  ),
                ),
                Container(
                  child: Card(
                    child: Container(
                      height: 10,
                      width: Get.width,
                      color: Colors.blue,
                    ),
                  )
                ),
              ]),
            )
          ],
        ),
      )
      ),
    );
  }
}
