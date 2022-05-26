import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/constants.dart';

class LeaveRequest1 extends StatefulWidget {
  const LeaveRequest1({Key? key}) : super(key: key);

  @override
  State<LeaveRequest1> createState() => _LeaveRequest1State();
}

class _LeaveRequest1State extends State<LeaveRequest1> {
  double screenHeight = 0;
  double screenWidth = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          leading: InkWell(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.keyboard_backspace,color: kgolder)),
          title:      Text("Leaves Request",style: TextStyle(color: kgolder,fontSize: 18),),

          toolbarHeight: 35,
          backgroundColor: kblack,
        ),
        body: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient:  LinearGradient(
                  colors: [kgolder, kgradientYellow, ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,),
              ),
              child: Column(
                children: [
                  Container(

                    width: Get.width,
                    decoration: BoxDecoration(
                      gradient:  LinearGradient(
                        colors: [Colors.black, Colors.grey.shade600],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          // Padding(
                          //   padding:   EdgeInsets.only(left: 15.0),
                          //   child: Row(
                          //     children: [
                          //       Icon(Icons.keyboard_backspace,color: kgolder),
                          //       SizedBox(width: 5),
                          //       Text("Leaves Request",style: TextStyle(color: kgolder,fontSize: 18),),
                          //     ],
                          //   ),
                          // ),////
                          ///old///leave
                          SizedBox(height: 8,),
                          Container(
                            height: 50,
                            child: Padding(
                              padding:   EdgeInsets.all(2.0),
                              child: TabBar(

                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight:FontWeight.w600),
                                labelColor: Colors.black,
                                unselectedLabelColor:  kgolder,
                                indicator: BoxDecoration(
                                    color: kgolder,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    border: Border.all(
                                      color:kblack,
                                      width: 2,
                                    )

                                ),
                                tabs: [
                                  Tab(child: Text("Request",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),),
                                  // Tab(child: Text("Request",style: TextStyle(fontSize: 16),),),
                                  Tab(child: Text("History",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),),
                                ],
                              ),
                            ),
                          ),///request/history//tapbar
                        ],
                      ),
                    ),
                  ),///request/history//tapbar
                  SizedBox(height: 10),
                  Container(
                    child: Expanded(
                      child: TabBarView(
                        children: [
                          DefaultTabController(
                              length: 1, child: Text("Lovely")
                          ),
                          Container(
                            child: DefaultTabController(
                                length: 3,
                                child:Column(
                                  children: [
                                    Padding(
                                      padding:   EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 45,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                            color: kgolder,
                                            borderRadius: BorderRadius.all(Radius.circular(8)),
                                            border: Border.all(
                                              color:kblack,
                                              width: 2,
                                            )
                                        ),
                                        child: Container(
                                          child: Padding(
                                            padding:  EdgeInsets.all(1.5),
                                            child: TabBar(
                                              labelStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight:FontWeight.w600),
                                              labelColor:kgolder,
                                              unselectedLabelColor:  kblack,
                                              indicator: BoxDecoration(
                                                color: kblack,
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                              ),
                                              tabs: [
                                                Tab(child: Text("Pending",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),),
                                                Tab(child: Text("Accepted",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),),
                                                Tab(child: Text("Rejected",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),),
                                              ],
                                            ),
                                            ///pending
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:5,),
                                    Container(
                                      child:Expanded(
                                        child: TabBarView(
                                          children: [
                                            DefaultTabController(
                                                length: 1, child: Container(
                                              height: 10,
                                              decoration: BoxDecoration(
                                                  color: kgolder,
                                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                                  border: Border.all(
                                                    color:kblack,
                                                    width: 2,
                                                  )
                                              ),
                                              child: Column(
                                                children: [
                                                  Text("Lolpepsi"),
                                                  Text(" ddsfd"),
                                                ],
                                              ),
                                            )
                                            ),
                                            DefaultTabController(
                                                length: 1, child: Text("Fuck ")
                                            ),
                                            DefaultTabController(
                                                length: 1, child: Text("Up")
                                            ),
                                          ],
                                        ),
                                      ),
                                    )


                                  ],
                                )
                            ),
                          ),///tapbar
                        ],
                      ),

                    ),)],),),),
        ),
      )


    );
  }
}
