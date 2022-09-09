import 'package:demo_nikita/Components/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/constants.dart';
import '../Components/models.dart';

class HrEnrollCourses extends StatefulWidget {
  final UserModel? userModel;

  const HrEnrollCourses({Key? key, this.userModel}) : super(key: key);

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
        appBar:
        AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: kblack
            ),
          ),
          title: Container(margin:EdgeInsets.only(left: 15),child: Text("Courses",style: TextStyle(color: kgolder),)),
          titleSpacing: 5,
          shadowColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Container(
              height: screenHeight,
              width: screenWidth,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bg.jpg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    gradient:  LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,

                        colors: [
                          kblack,
                          kGray
                        ]
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight:  Radius.circular(20)
                    ),
                  ),
                  child: TabBar(
                    labelColor: Colors.black,
                    indicator: BoxDecoration(
                        color: kgolder,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kblack,width: 2)
                    ),
                    unselectedLabelColor: kgolder,
                    tabs: [
                      Text("HR Courses",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),
                      Text("Enrolled Courses",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),
                    ],
                  ),
                ),
                // Container(
                //   height: screenHeight / 5.5,
                //   width: Get.width,
                //   decoration: BoxDecoration(
                //     gradient:  LinearGradient(
                //       colors: [Colors.black, Colors.grey.shade600],
                //       begin: Alignment.topCenter,
                //       end: Alignment.bottomCenter,),
                //     borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(15),
                //     bottomRight: Radius.circular(15)),
                // ),
                //   child: Container(
                //
                //     child: Column(
                //       children: [
                //       SizedBox(height: 15),
                //         Row(
                //           children: [
                //             SizedBox( width: 10,),
                //             Icon(Icons.arrow_back,color: kgolder,),
                //             SizedBox(width: 10),
                //             Text("Courses",style: TextStyle(color: kgolder),)
                //           ],
                //         ),
                //         SizedBox(height: 8,),
                //         Padding(
                //           padding:   EdgeInsets.all(8.0),
                //           child: TabBar(labelStyle: TextStyle(
                //               fontSize: 25,
                //               fontWeight:FontWeight.w600),
                //             labelColor: Colors.black,
                //             indicator: BoxDecoration(
                //               color: kgolder,
                //               borderRadius: BorderRadius.only(
                //                 bottomRight: Radius.circular(12),
                //               bottomLeft: Radius.circular(12))
                //             ),
                //             tabs: [
                //             Tab(text: "HR Courses",),
                //             Tab(text: "Enroll Courses"),
                //           ],
                //           ),
                //         ),
                //
                //
                //       ],
                //     ),
                //   ),
                //
                // ),
                Expanded(

                  child: TabBarView(
                      children: [

                      Column(
                        children: [
                          Expanded(
                            child: FutureBuilder<List<CoursesModel>?>(
                                future: AllApi().getCourses(widget.userModel!.companyId!),
                              builder: (context, snapshot) {

                                if (!snapshot.hasData) {
                                  return kprogressbar;
                                }

                                var courseList = snapshot.data;

                                return ListView.builder(
                                  itemCount: courseList!.length,
                                  itemBuilder: (context,index){
                                    return AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration: const Duration(milliseconds: 700),
                                      child: SlideAnimation(
                                        duration: Duration(milliseconds: 500),
                                        horizontalOffset: 200.0,
                                        child: FadeInAnimation(
                                          child:buildHRcourses(courseList[index]),
                                        ),
                                      ),
                                    );
                                  },

                                );
                              }
                            ),
                          ),
                          SizedBox(height: 80,),
                        ],
                      ),
                        Column(
                          children: [
                            Expanded(
                              child: FutureBuilder<List<PresentCoursesModel>?>(
                                  future: AllApi().getPresentCourses(
                                    companyId: widget.userModel!.companyId,
                                    empId: widget.userModel!.empId,
                                  ),
                                  builder: (context, snapshot) {

                                    if (!snapshot.hasData) {
                                      return kprogressbar;
                                    }

                                    var courseList = snapshot.data;

                                    return ListView.builder(
                                      itemCount: courseList!.length,
                                      itemBuilder: (context,index){
                                        return AnimationConfiguration.staggeredList(
                                          position: index,
                                          duration: const Duration(milliseconds: 700),
                                          child: SlideAnimation(
                                            duration: Duration(milliseconds: 500),
                                            horizontalOffset: 200.0,
                                            child: FadeInAnimation(
                                              child:buildERcourses(courseList[index],index),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }
                              ),
                            ),
                            SizedBox(height: 80,),
                          ],
                        ),


                  ]
                  ),
                )
              ],
            ),
          ],
        ),
      )
      ),
    );
  }

  Padding buildERcourses(PresentCoursesModel presentCoursesModel ,index) {
    return Padding(
                        padding:   EdgeInsets.all(8.0),
                        child: Column(

                          children: [
                            InkWell(
                              onTap: (){


                              },
                              child: Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                    gradient:  LinearGradient(
                                      colors: [kGray7, kblack ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    stops: [
                                      0.2,
                                      1.3
                                    ]
                                    ),
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
                                              Text(presentCoursesModel.title!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
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
                                                    onCancel: () async {

                                                      await AllApi()
                                                          .removeRegisteration(
                                                          courseId:
                                                          presentCoursesModel.courseId,
                                                          empId: widget.userModel!.empId)
                                                          .then((value) {
                                                        Fluttertoast.showToast(msg: value);

                                                        Get.back();
                                                        setState(() {});
                                                      });
                                                    },
                                                    onConfirm: (){
                                                      Get.back();
                                                    }
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
                                              colors: [kgradientYellow, kgolder  ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            stops: [
                                              0.1,
                                              1.3
                                            ]
                                            ),
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
                                              Text(presentCoursesModel.venue!,style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 16 ),),
                                              Text(presentCoursesModel.date!,style: TextStyle(fontWeight: FontWeight.bold,color: kgolder, fontSize: 16),),
                                            ],
                                          ),
                                          Container(

                                            child: Padding(
                                              padding:   EdgeInsets.only(left: 8,right: 8,top: 3,bottom: 3),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    presentCoursesModel.checkIn == ''
                                                        ? 'IN: -----'
                                                        : 'IN: ' + presentCoursesModel.checkIn!,
                                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),

                                                  Text(
                                                    presentCoursesModel.checkOut == ''
                                                        ? 'OUT: -----'
                                                        : 'OUT: ' + presentCoursesModel.checkOut!,
                                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
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

  Padding buildHRcourses(CoursesModel coursesModel) {
    return Padding(
                    padding:   EdgeInsets.all(8.0),
                    child:
                    Column(

                      children: [
                        InkWell(
                          onTap: (){

                            showDialog(
                                context: context,
                                builder: (context) {

                                  bool isLoading = false;
                                  return StatefulBuilder(
                                      builder: (context, setStateDialog){
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
                                                        colors: [Colors.black, kGray7],
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
                                                                    child: Text(coursesModel.venue!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
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
                                                                    child: Text(coursesModel.courseId!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
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
                                                                    child: Text(coursesModel.venue!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
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
                                                                    child: Text(coursesModel.date!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                                  ),
                                                                  decoration: BoxDecoration(
                                                                      color: kgolder,
                                                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                      border: Border.all(width: 3,color: Colors.black)
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            // SizedBox(height: 5,),
                                                            // Row(
                                                            //   children: [
                                                            //     Text("Description :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kgolder),),
                                                            //   ],
                                                            // ),
                                                            // Container(
                                                            //
                                                            //   width: Get.width,
                                                            //
                                                            //   child: Padding(
                                                            //     padding:   EdgeInsets.all(4),
                                                            //     child: Text(coursesModel.,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                            //   ),
                                                            //   decoration: BoxDecoration(
                                                            //       color: kgolder,
                                                            //       borderRadius: BorderRadius.all(Radius.circular(12)),
                                                            //       border: Border.all(width: 2,color: Colors.black)
                                                            //   ),
                                                            // ),
                                                            SizedBox(height : 40,),

                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              children: [
                                                                InkWell(
                                                                  onTap:() async {

                                                                    setStateDialog(() {
                                                                      isLoading = true;
                                                                    });
                                                                    var isRegistered =
                                                                        await AllApi().checkIfRegisteredCourse(
                                                                      courseId: coursesModel.courseId,
                                                                      empId: widget.userModel!.empId,
                                                                    );
                                                                    if (isRegistered == 'not registered') {
                                                                      var result = await AllApi().registerCourse(
                                                                          coursesModel: coursesModel,
                                                                          empName: widget.userModel!.name,
                                                                          empId: widget.userModel!.empId,
                                                                          empPhone: widget.userModel!.phoneNumber,
                                                                          hr_id: widget.userModel!.hrId,
                                                                          manager_id: widget.userModel!.managerid);
                                                                      setStateDialog(() {
                                                                        isLoading = false;
                                                                      });
                                                                      Navigator.of(context).pop();
                                                                      if (result == 'registered') {
                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                          const SnackBar(
                                                                            content: Text('Registered successfully.'),
                                                                          ),
                                                                        );
                                                                        setState(() {});
                                                                      } else {
                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                          const SnackBar(
                                                                            content: Text('Failed to register.'),
                                                                          ),
                                                                        );
                                                                      }
                                                                    } else {
                                                                      setStateDialog(() {
                                                                        isLoading = false;
                                                                      });
                                                                      Navigator.of(context).pop();
                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                        const SnackBar(
                                                                          content: Text(
                                                                            'You have already registered.',
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }

                                                    },
                                                                  child: Container(
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

                                    width: Get.width,
                                    child: Padding(
                                      padding:   EdgeInsets.only(left: 8.0,top: 6,bottom: 6),
                                      child: Text(coursesModel.title!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
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
                                      Text(coursesModel.venue!,style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 15 ),),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(coursesModel.date!,style: TextStyle(fontWeight: FontWeight.bold,color: kgolder, fontSize: 15),),

                                      Container(
                                        child: Padding(
                                          padding:   EdgeInsets.only(left: 8,right: 8,top: 3,bottom: 3),
                                          child: Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
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
