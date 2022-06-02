import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Components/constants.dart';

class AdminLeavesss extends StatefulWidget {
  const AdminLeavesss({Key? key}) : super(key: key);

  @override
  _NewAdminState createState() => _NewAdminState();
}

class _NewAdminState extends State<AdminLeavesss> {

  var _isLoading = false;
  var _employeeName = 'Select Employee';
  var _jobDescription = '';
  var _selectedValue = 0;
  var _fromDate = '';
  var _toDate = '';
  String _selectedFilter = 'Pending';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(

          leading:  InkWell(
          onTap: (){
            Get.back();
          },
          child: Padding(
            padding:   EdgeInsets.only(left: 10.0),
            child: Icon(Icons.arrow_back,color: kblack),
          ),
        ),
          leadingWidth: 25,
          title: Text('Administrative Leave',style: TextStyle(color:kblack,fontWeight: FontWeight.bold),),


          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [ kgolder2,kgradientYellow,kgolder2]
              ),
            ),
          ),

          toolbarHeight: 55,
          elevation: 0,
        ),

        body:

//       Container(
//       decoration: BoxDecoration(
//       gradient: LinearGradient(
//       begin: Alignment.topCenter,
//
//       end: Alignment.center,
//       colors: [
//         Colors.white,
//         kgolder,
//       ],
//     )
//     ),
//
// )
        DefaultTabController(
          length: 2,
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(

                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [kGray3, kblack, kGray3,  kblack,]
                  ),

              ),
              child: Column(
                children: [
                  Container(

                    width: Get.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [ kgolder2,kgradientYellow,kgolder2]
                      ),

                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                    child: Container(
                      child: Column(
                        children: [

                          TabBar(
                            labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight:FontWeight.w600),
                            labelColor: kgolder2,
                            unselectedLabelColor:  kblack,
                            indicator: BoxDecoration(
                                color: kgolder,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(14),
                                    bottomLeft: Radius.circular(14)),
                              border: Border.all(
                                color:kgolder,
                                width: 2,
                              ),
                              gradient: LinearGradient(

                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [   kblack, kGray3,]
                              ),
                            ),
                            tabs: [
                              Tab(child: Text("Search",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),),
                              // Tab(child: Text("Request",style: TextStyle(fontSize: 16),),),
                              Tab(child: Text("Alloted",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding:   EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // Container(
                        //   height: 45,
                        //
                        //   decoration: BoxDecoration(
                        //     border: Border.all(
                        //       width: 2,
                        //         color: kgolder),
                        //     gradient: LinearGradient(
                        //         colors: [ kgradientYellow,kgolder2]
                        //     ),
                        //     borderRadius: BorderRadius.all(Radius.circular(9),),
                        //   ),
                        //   child: Padding(
                        //     padding:  EdgeInsets.all(8.0),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Text('Select Employee',style: TextStyle(color: kblack,fontSize: 19,fontWeight:FontWeight.bold),),
                        //         Icon(Icons.keyboard_arrow_down,color: kblack,)
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 10,),
                        InkWell(
                          child: Column(
                            children: [
                              Container(

                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(

                                        decoration: BoxDecoration(
                                          // border: Border.all(
                                          //     width: 2,
                                          //     color: kgolder),

                                          borderRadius: BorderRadius.all(Radius.circular(9),),
                                        ),
                                        child: ExpansionTile(
                                          // tilePadding: EdgeInsets.only(left: 16),
                                          trailing:  SizedBox.shrink(),
                                          expandedCrossAxisAlignment: CrossAxisAlignment.center,
                                          collapsedIconColor: kblack,
                                          iconColor: kblack,
                                          collapsedBackgroundColor:Colors.transparent,
                                          backgroundColor: Colors.transparent,

                                          title:  SingleChildScrollView(
                                            child: Container(
                                              height: 42,

                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2,
                                                    color: kgolder),
                                                gradient: LinearGradient(
                                                    colors: [ kgradientYellow,kgolder2]
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(9),),
                                              ),
                                              child: Padding(
                                                padding:  EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text('Select Employee',style: TextStyle(color: kblack,fontSize: 19,fontWeight:FontWeight.bold),),
                                                    Icon(Icons.keyboard_arrow_down,color: kblack,)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          tilePadding: EdgeInsets.only(left: 25),

                                          // Container(
                                          //   width: Get.width,
                                          //
                                          //   decoration: BoxDecoration(
                                          //       gradient: LinearGradient(
                                          //           colors: [ kgradientYellow,kgolder2]
                                          //       ),
                                          //       borderRadius: BorderRadius.all(Radius.circular(8)),
                                          //       border: Border.all(
                                          //         color:kgolder,
                                          //         width: 2,
                                          //       )
                                          //   ),
                                          //   child: Padding(
                                          //     padding:   EdgeInsets.all(5),
                                          //     child: Column(
                                          //       children: [
                                          //         Container(
                                          //           height: 35,
                                          //
                                          //           width: Get.width,
                                          //           decoration: BoxDecoration(
                                          //               borderRadius: BorderRadius.all(Radius.circular(8)),
                                          //               gradient: LinearGradient(
                                          //                   colors: [ kGray3,kblack]
                                          //               ),
                                          //               border: Border.all(
                                          //                 color:kgolder,
                                          //                 width: 2,
                                          //               )
                                          //           ),
                                          //           child: Row(
                                          //             children: [
                                          //               Center(
                                          //                 child: Padding(
                                          //                   padding:   EdgeInsets.only(left: 10.0),
                                          //                   child: Text("Personal Leave",style: TextStyle(color: kgolder,fontSize:20),),
                                          //                 ),
                                          //               ),
                                          //             ],
                                          //           ),
                                          //         ),
                                          //         SizedBox(height: 10),
                                          //         Column(
                                          //           children: [
                                          //             Row(
                                          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //               crossAxisAlignment: CrossAxisAlignment.start,
                                          //               children: [
                                          //                 Text("Date :",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                          //                 Text("16/04/2022",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                          //               ],
                                          //             ),
                                          //             Row(
                                          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //               crossAxisAlignment: CrossAxisAlignment.start,
                                          //               children: [
                                          //                 Text("From :",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                          //                 Text("12:00 AM",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                          //               ],
                                          //             ),
                                          //             Row(
                                          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //               crossAxisAlignment: CrossAxisAlignment.start,
                                          //               children: [
                                          //                 Text("To :",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                          //                 Text("12:00 AM",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                          //               ],
                                          //             ),
                                          //             SizedBox(height: 15),
                                          //
                                          //             Row(
                                          //               mainAxisAlignment: MainAxisAlignment.end,
                                          //               children: [
                                          //                 InkWell(
                                          //                   onTap: () {
                                          //
                                          //                     Get.defaultDialog(
                                          //                         title: "",
                                          //
                                          //                         titleStyle: TextStyle(color: kgolder),
                                          //                         titlePadding: EdgeInsets.only(right: 100,top: 5),
                                          //                         backgroundColor: Colors.transparent,
                                          //
                                          //                         content: Container(
                                          //                           width: Get.width,
                                          //                           decoration: BoxDecoration(
                                          //                             borderRadius: BorderRadius.all(Radius.circular(8)),
                                          //                             gradient: LinearGradient(
                                          //                                 colors: [ kGray3,kblack]
                                          //                             ),
                                          //                             border: Border.all(
                                          //                               color:kgolder,
                                          //                               width: 2,
                                          //                             ),
                                          //                           ),
                                          //                           child: Padding(
                                          //                             padding:   EdgeInsets.all(10),
                                          //                             child: SingleChildScrollView(
                                          //                               child: Column(
                                          //                                 children: [
                                          //                                   Row(
                                          //                                     mainAxisAlignment: MainAxisAlignment.start,
                                          //                                     children: [
                                          //                                       Column(
                                          //                                         crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                         children: [
                                          //                                           Text("Fahad Kharadi",style: TextStyle(color:kgolder ),),
                                          //                                           SizedBox(height: 15),
                                          //                                           Text("Emp ID: ",style: TextStyle(color:kgolder ),),
                                          //                                           Text("Designation: ",style: TextStyle(color:kgolder ),),
                                          //                                           Text("Phone: ",style: TextStyle(color:kgolder ),),
                                          //                                           Text("Email : ",style: TextStyle(color:kgolder ),),
                                          //                                           SizedBox(height: 15),
                                          //                                           Text("Request Details: \nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc",
                                          //                                             style: TextStyle(color:kgolder ),),
                                          //
                                          //                                         ],
                                          //                                       ),
                                          //                                     ],
                                          //                                   ),
                                          //                                   SizedBox(height: 15),
                                          //                                   Row(
                                          //                                     mainAxisAlignment: MainAxisAlignment.end,
                                          //                                     children: [
                                          //                                       Container(
                                          //                                         height: 30,
                                          //                                         decoration: BoxDecoration(
                                          //                                           borderRadius: BorderRadius.all(Radius.circular(10)),
                                          //                                           color: kgolder,
                                          //
                                          //                                         ),
                                          //                                         child:Padding(
                                          //                                           padding:  EdgeInsets.only(left: 8,right: 8),
                                          //                                           child: Center(child: Text("Approve",style: TextStyle(color: kblack,fontSize:18),)),
                                          //                                         ) ,
                                          //                                       ),
                                          //                                       Container(
                                          //                                         height: 30,
                                          //                                         decoration: BoxDecoration(
                                          //                                           borderRadius: BorderRadius.all(Radius.circular(10)),
                                          //
                                          //
                                          //                                         ),
                                          //                                         child:Padding(
                                          //                                           padding:  EdgeInsets.only(left: 8,right: 8),
                                          //                                           child: Center(child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),)),
                                          //                                         ) ,
                                          //                                       ),
                                          //                                     ],
                                          //                                   ),
                                          //                                 ],
                                          //                               ),
                                          //                             ),
                                          //                           ),
                                          //                         ),
                                          //                         radius: 50
                                          //                     );
                                          //                   },
                                          //                   child: Container(
                                          //                     height: 30,
                                          //                     decoration: BoxDecoration(
                                          //                         borderRadius: BorderRadius.all(Radius.circular(10)),
                                          //                         color: kGray2,
                                          //                         border: Border.all(
                                          //                           color:kblack,
                                          //                           width: 2,
                                          //                         )
                                          //                     ),
                                          //                     child:Padding(
                                          //                       padding:   EdgeInsets.only(left: 8,right: 8),
                                          //                       child: Center(child: Text("Approve",style: TextStyle(color: kgolder,fontSize:18),)),
                                          //                     ) ,
                                          //                   ),
                                          //                 ),
                                          //                 SizedBox(width: 10,),
                                          //                 InkWell(
                                          //                   onTap: () {
                                          //                     Get.defaultDialog(
                                          //                         title: "",
                                          //
                                          //                         titleStyle: TextStyle(color: kgolder),
                                          //                         titlePadding: EdgeInsets.only(right: 100,top: 5),
                                          //                         backgroundColor: Colors.transparent,
                                          //
                                          //                         content: Container(
                                          //                           width: Get.width,
                                          //                           decoration: BoxDecoration(
                                          //                             borderRadius: BorderRadius.all(Radius.circular(8)),
                                          //                             gradient: LinearGradient(
                                          //                                 colors: [ kGray3,kblack]
                                          //                             ),
                                          //                             border: Border.all(
                                          //                               color:kgolder,
                                          //                               width: 2,
                                          //                             ),
                                          //                           ),
                                          //                           child: Padding(
                                          //                             padding:   EdgeInsets.all(10),
                                          //                             child: Column(
                                          //                               children: [
                                          //                                 Row(
                                          //                                   mainAxisAlignment: MainAxisAlignment.start,
                                          //                                   children: [
                                          //                                     Column(
                                          //                                       crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                       children: [
                                          //                                         Text("Fahad Kharadi",style: TextStyle(color:kgolder ),),
                                          //                                         SizedBox(height: 15),
                                          //                                         Text("Emp ID: ",style: TextStyle(color:kgolder ),),
                                          //                                         Text("Designation: ",style: TextStyle(color:kgolder ),),
                                          //                                         Text("Phone: ",style: TextStyle(color:kgolder ),),
                                          //                                         Text("Email : ",style: TextStyle(color:kgolder ),),
                                          //                                         SizedBox(height: 15),
                                          //                                         Text("Request Details: \nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc",
                                          //                                           style: TextStyle(color:kgolder ),),
                                          //
                                          //                                       ],
                                          //                                     ),
                                          //                                   ],
                                          //                                 ),
                                          //                                 SizedBox(height: 15),
                                          //                                 Container(
                                          //                                   width: Get.width,
                                          //                                   decoration: BoxDecoration(
                                          //                                     borderRadius: BorderRadius.all(Radius.circular(8)),
                                          //                                     gradient: LinearGradient(
                                          //                                         colors: [ kgradientYellow,kgolder2]
                                          //                                     ),
                                          //                                     border: Border.all(
                                          //                                       color:kgolder,
                                          //                                       width: 2,
                                          //                                     ),
                                          //                                   ),
                                          //                                   child: Padding(
                                          //                                     padding:   EdgeInsets.all(10.0),
                                          //                                     child: Text("Reason:\nLoremipsum dola sit \namet connector adsipising elit "),
                                          //                                   ),
                                          //                                 ),
                                          //                                 SizedBox(height: 15),
                                          //                                 Row(
                                          //                                   mainAxisAlignment: MainAxisAlignment.end,
                                          //                                   children: [
                                          //                                     Container(
                                          //                                       height: 30,
                                          //                                       decoration: BoxDecoration(
                                          //                                         borderRadius: BorderRadius.all(Radius.circular(10)),
                                          //                                         color: kgolder,
                                          //
                                          //                                       ),
                                          //                                       child:Padding(
                                          //                                         padding:  EdgeInsets.only(left: 8,right: 8),
                                          //                                         child: Center(child: Text("Reject",style: TextStyle(color: kblack,fontSize:18),)),
                                          //                                       ) ,
                                          //                                     ),
                                          //                                     Container(
                                          //                                       height: 30,
                                          //                                       decoration: BoxDecoration(
                                          //                                         borderRadius: BorderRadius.all(Radius.circular(10)),
                                          //
                                          //
                                          //                                       ),
                                          //                                       child:Padding(
                                          //                                         padding:  EdgeInsets.only(left: 8,right: 8),
                                          //                                         child: Center(child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),)),
                                          //                                       ) ,
                                          //                                     ),
                                          //                                   ],
                                          //                                 ),
                                          //                               ],
                                          //                             ),
                                          //                           ),
                                          //                         ),
                                          //                         radius: 50
                                          //                     );
                                          //                   },
                                          //                   child: Container(
                                          //                     height: 30,
                                          //                     decoration: BoxDecoration(
                                          //                         borderRadius: BorderRadius.all(Radius.circular(10)),
                                          //                         color: kGray2,
                                          //                         border: Border.all(
                                          //                           color:kblack,
                                          //                           width: 2,
                                          //                         )
                                          //                     ),
                                          //                     child:Padding(
                                          //                       padding:  EdgeInsets.only(left: 8,right: 8),
                                          //                       child: Center(child: Text("Reject",style: TextStyle(color: kgolder,fontSize:18),)),
                                          //                     ) ,
                                          //                   ),
                                          //                 ),
                                          //               ],
                                          //             )
                                          //           ],
                                          //         ),
                                          //       ],
                                          //     ),
                                          //   ),
                                          // ),

                                          children:  [

                                            Container(
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
                                                padding:   EdgeInsets.all(5),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 35,

                                                      width: Get.width,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                                          gradient: LinearGradient(
                                                              colors: [ kGray3,kblack]
                                                          ),
                                                          border: Border.all(
                                                            color:kgolder,
                                                            width: 2,
                                                          )
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Center(
                                                            child: Padding(
                                                              padding:   EdgeInsets.only(left: 10.0),
                                                              child: Text("Arsalan Khan ",style: TextStyle(color: kgolder,fontSize:20),),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text("Date :",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                            Text("16/04/2022",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text("From :",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                            Text("12:00 AM",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text("To :",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                            Text("12:00 AM",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                          ],
                                                        ),
                                                        SizedBox(height: 15),

                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {

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
                                                              child: Container(
                                                                height: 30,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                    color: kGray2,
                                                                    border: Border.all(
                                                                      color:kblack,
                                                                      width: 2,
                                                                    )
                                                                ),
                                                                child:Padding(
                                                                  padding:   EdgeInsets.only(left: 8,right: 8),
                                                                  child: Center(child: Text("Approve",style: TextStyle(color: kgolder,fontSize:18),)),
                                                                ) ,
                                                              ),
                                                            ),
                                                            SizedBox(width: 10,),
                                                            InkWell(
                                                              onTap: () {
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
                                                                            Container(
                                                                              width: Get.width,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                                gradient: LinearGradient(
                                                                                    colors: [ kgradientYellow,kgolder2]
                                                                                ),
                                                                                border: Border.all(
                                                                                  color:kgolder,
                                                                                  width: 2,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding:   EdgeInsets.all(10.0),
                                                                                child: Text("Reason:\nLoremipsum dola sit \namet connector adsipising elit "),
                                                                              ),
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
                                                                                    child: Center(child: Text("Reject",style: TextStyle(color: kblack,fontSize:18),)),
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
                                                                    radius: 50
                                                                );
                                                              },
                                                              child: Container(
                                                                height: 30,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                    color: kGray2,
                                                                    border: Border.all(
                                                                      color:kblack,
                                                                      width: 2,
                                                                    )
                                                                ),
                                                                child:Padding(
                                                                  padding:  EdgeInsets.only(left: 8,right: 8),
                                                                  child: Center(child: Text("Reject",style: TextStyle(color: kgolder,fontSize:18),)),
                                                                ) ,
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
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text('To',style: TextStyle(color: kgolder2,fontSize: 19,fontWeight:FontWeight.bold),),
                                              ],
                                            ),
                                            Container(
                                              height: 45,

                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2,
                                                    color: kgolder),
                                                gradient: LinearGradient(
                                                    colors: [ kgradientYellow,kgolder2]
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(9),),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text('DD/MM/YYY',style: TextStyle(color: kblack,fontSize: 19,fontWeight:FontWeight.bold),),
                                                    Icon(Icons.keyboard_arrow_down,color: kblack,)
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text('From',style: TextStyle(color: kgolder2,fontSize: 19,fontWeight:FontWeight.bold),),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Container(
                                              height: 45,

                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2,
                                                    color: kgolder),
                                                gradient: LinearGradient(
                                                    colors: [ kgradientYellow,kgolder2]
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(9),),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text('DD/MM/YYY',style: TextStyle(color: kblack,fontSize: 19,fontWeight:FontWeight.bold),),
                                                    Icon(Icons.keyboard_arrow_down,color: kblack,)
                                                  ],
                                                ),
                                              ),
                                            ),SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text('No of Days',style: TextStyle(color: kgolder2,fontSize: 19,fontWeight:FontWeight.bold),),
                                              ],
                                            ),
                                            Container(
                                              height: 45,

                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2,
                                                    color: kgolder),
                                                gradient: LinearGradient(
                                                    colors: [ kgradientYellow,kgolder2]
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(9),),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text('DD/MM/YYY',style: TextStyle(color: kblack,fontSize: 19,fontWeight:FontWeight.bold),),
                                                    Icon(Icons.keyboard_arrow_down,color: kblack,)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height: 40,
                            width: 100,

                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: kblack,
                                  width: 2),
                              color:kgolder,borderRadius: BorderRadius.all(Radius.circular(12),),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Search',style: TextStyle(color: kblack,fontSize: 18,fontWeight: FontWeight.bold),),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
        )


    );
  }
}