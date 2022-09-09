import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/api.dart';
import '../Components/constants.dart';
import '../Components/models.dart';

class BenchListNew extends StatefulWidget {
  final UserModel userModel;

  const BenchListNew({Key? key, required this.userModel}) : super(key: key);

  @override
  State<BenchListNew> createState() => _BenchListNewState();
}

class _BenchListNewState extends State<BenchListNew> {
  double screenHeight = 0;
  double screenWidth = 0;
  final _allApi = AllApi();
  final _reasonController = TextEditingController();
  var _reason = '';
  List<BenchListModel>? _listTabRequests;
  List<BenchListModel>? _acceptedTabRequests;
  List<BenchListModel>? _rejectedTabRequests;

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
              "Bench list ",
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
                                                          // fontSize: 18,
                                                          fontFamily: 'Typo Round',
                                                          fontWeight:
                                                          FontWeight.w400),
                                                    ),
                                                  ),
                                                  Tab(
                                                    child: Text(
                                                      "Accepted",
                                                      style: TextStyle(
                                                          // fontSize: 18,
                                                          fontFamily: 'Typo Round',
                                                          fontWeight:
                                                          FontWeight.w400),
                                                    ),
                                                  ),
                                                  Tab(
                                                    child: Text(
                                                      "Rejected",
                                                      style: TextStyle(
                                                          // fontSize: 18,
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
                                                pendingWidget(),
                                                acceptedWidget(),
                                                rejectedWidget(),
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

  DefaultTabController pendingWidget() {
    return DefaultTabController(
        length: 1,
        child: FutureBuilder<List<BenchListModel>?>(
            future: _allApi.getBenchList(
              companyId: widget.userModel.companyId,
              verify: '0',
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return kprogressbar;
              }
              // else if (snapshot.data!.isEmpty) {
              //   return Container(
              //     height: MediaQuery.of(context).size.height,
              //     alignment: Alignment.center,
              //     child: const Text(
              //       'No Records',
              //       style: TextStyle(
              //         fontSize: 22,
              //         color: kgolder
              //       ),
              //     ),
              //   );
              // }
              else {
                var servicesList = snapshot.data;
                _listTabRequests = servicesList;

                return ListView.builder(
                    itemCount:
                    _listTabRequests!.length,
                    itemBuilder: (context, index) {

                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 700),
                          child: SlideAnimation(
                            duration: Duration(milliseconds: 500),
                            horizontalOffset: 200.0,
                            child: FadeInAnimation(
                              child:pendingCard(
                                // BenchListModel( replacementAddress: 'replacement_address',
                                //   replacementAllotedOffice: 'replacement_allotedOffice',
                                //   replacementDesignation: 'replacement_designation',
                                //   benchId: 'benchid',
                                //   replacementManager: 'replacement_manager',
                                //   replacementEmail: 'replacement_email',
                                //   userName: 'user_name',
                                //   from: 'from',
                                //   jobDescription: 'job_description',
                                //   replacementEmpId: 'replacement_empid',
                                //   userEmpId: 'user_empid',
                                //   replacementRefId: 'arsalank28@gmail.com',
                                //   replacementName: 'replacement_name',
                                //   replacementPhone: 'replacement_phone',
                                //   replacementType: 'replacement_type',
                                //   to: 'to',
                                //   userPhone: 'user_phone',
                                //   verify: 'verify',
                                //   companyId: 'companyid',
                                //   timeStamp: 'timestamp',
                                //   reason: 'reason',)
                                  _listTabRequests![index]
                              )
                            ),
                          ),
                        );





                    }
                );
              }

            }));
  }

  DefaultTabController acceptedWidget() {
    return DefaultTabController(
        length: 1,
        child: FutureBuilder<List<BenchListModel>?>(
            future: _allApi.getBenchList(
              companyId: widget.userModel.companyId,
              verify: '1',
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return kprogressbar;
              } else if (snapshot.data!.isEmpty) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: const Text(
                    'No Records',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                );
              } else {
                var servicesList = snapshot.data;
                _listTabRequests = servicesList;


                return ListView.builder(
                    itemCount: _listTabRequests!.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 700),
                        child: SlideAnimation(
                          duration: Duration(milliseconds: 500),
                          horizontalOffset: 200.0,
                          child: FadeInAnimation(
                              child:  acceptedCard(_listTabRequests![index])
                          ),
                        ),
                      );







                    }
                );
              }

            }));
  }

  DefaultTabController rejectedWidget() {
    return DefaultTabController(
        length: 1,
        child: FutureBuilder<List<BenchListModel>?>(
            future: _allApi.getBenchList(
              companyId: widget.userModel.companyId,
              verify: '-1',
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return kprogressbar;
              } else if (snapshot.data!.isEmpty) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: const Text(
                    'No Records',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                );
              } else {
                var servicesList = snapshot.data;
                _listTabRequests = servicesList;

                return ListView.builder(
                    itemCount: _listTabRequests!.length,
                    itemBuilder: (context, index) {
 return AnimationConfiguration.staggeredList(
   position: index,
   duration: const Duration(milliseconds: 700),
   child: SlideAnimation(
     duration: Duration(milliseconds: 500),
     horizontalOffset: 200.0,
     child: FadeInAnimation(
         child:  rejectedCard(  _listTabRequests![index])
     ),
   ),
 );
                    }
                );
              }

            }));
  }



  pendingCard(BenchListModel servicesModel) {
    return FutureBuilder<UserModel>(
        future: _allApi.getUser(servicesModel.replacementRefId!),
        builder: (context, userSnap) {
          if(!userSnap.hasData){
            return SizedBox();
          }

          var userData = userSnap.requireData;

          return Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: (){

                Get.defaultDialog(
                    title: "",
                    titleStyle:
                    TextStyle(color: kgolder),
                    titlePadding: EdgeInsets.only(
                        right: 100, top: 5),
                    backgroundColor: Colors.transparent,
                    content: StatefulBuilder(
                        builder: (context, setStateDialog) {
                          return Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8)),
                              gradient: LinearGradient(
                                  colors: [kGray3, kblack]),
                              border: Border.all(
                                color: kgolder,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            SizedBox(
                                                height: 15),
                                            Text(
                                              "Emp Name: ${userData.name}",
                                              style: TextStyle(
                                                  color:
                                                  kgolder),
                                            ),
                                            Text(
                                              "Emp ID: ${userData.empId}",
                                              style: TextStyle(
                                                  color:
                                                  kgolder),
                                            ),
                                            SizedBox(height: 15,),

                                            Container(
                                              width: 150,
                                              child: Text(
                                                "Replacement Name: ${servicesModel.replacementName}",
                                                style: TextStyle(
                                                    color:
                                                    kgolder),
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              child:Text(
                                                "Replacement Emp Id: ${servicesModel.replacementEmpId}",
                                                style: TextStyle(
                                                    color:
                                                    kgolder),
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              child:Text(
                                                "Replacement Phone: ${servicesModel.replacementPhone}",
                                                style: TextStyle(
                                                    color:
                                                    kgolder),
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              child:Text(
                                                "Replacement Type: ${servicesModel.replacementType}",
                                                style: TextStyle(
                                                    color:
                                                    kgolder),
                                              ),
                                            ),
                                            SizedBox(
                                                height: 15),
                                            Container(
                                              width: 150,
                                              child: Text(
                                                "Request Details: ${servicesModel.jobDescription}",
                                                style: TextStyle(
                                                    color:
                                                    kgolder),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    // isLoadingApproved ? kprogressbar :  Row(
                                    //   mainAxisAlignment:
                                    //   MainAxisAlignment
                                    //       .end,
                                    //   children: [
                                    //     InkWell(
                                    //       onTap:() async {
                                    //         setStateDialog(() {
                                    //           isLoadingApproved = true;
                                    //         });
                                    //         var result = await _allApi.approveService(
                                    //           refId: servicesModel.refid!,
                                    //           certificateName:
                                    //           servicesModel.serviceid,
                                    //         );
                                    //         setStateDialog(() {
                                    //           isLoadingApproved = false;
                                    //         });
                                    //         Navigator.of(context).pop();
                                    //
                                    //         if (result == 'approved') {
                                    //           ScaffoldMessenger.of(context).showSnackBar(
                                    //             const SnackBar(
                                    //               content: Text('Request Approved'),
                                    //             ),
                                    //           );
                                    //         } else {
                                    //           ScaffoldMessenger.of(context).showSnackBar(
                                    //             const SnackBar(
                                    //               content: Text(
                                    //                 'Failed to approve request.',
                                    //               ),
                                    //             ),
                                    //           );
                                    //         }
                                    //         setState(() {});
                                    //       },
                                    //       child: Container(
                                    //         height: 30,
                                    //         decoration:
                                    //         BoxDecoration(
                                    //           borderRadius: BorderRadius
                                    //               .all(Radius
                                    //               .circular(
                                    //               10)),
                                    //           color: kgolder,
                                    //         ),
                                    //         child: Padding(
                                    //           padding: EdgeInsets
                                    //               .only(
                                    //               left: 8,
                                    //               right: 8),
                                    //           child: Center(
                                    //               child: Text(
                                    //                 "Approve",
                                    //                 style: TextStyle(
                                    //                     color:
                                    //                     kblack,
                                    //                     fontSize:
                                    //                     18),
                                    //               )),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Padding(
                                    //       padding:
                                    //       EdgeInsets.only(
                                    //           left: 8,
                                    //           right: 8),
                                    //       child: Center(
                                    //           child: InkWell(
                                    //               onTap: () {
                                    //                 Get.back();
                                    //               },
                                    //               child: Text(
                                    //                 "Cancel",
                                    //                 style: TextStyle(
                                    //                     color:
                                    //                     kgolder,
                                    //                     fontSize:
                                    //                     18),
                                    //               ))),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                    radius: 50);
              },
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [kgradientYellow, kgolder2]),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: kgolder,
                      width: 2,
                    )),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Container(
                        height: 35,
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8)),
                            gradient:
                            LinearGradient(colors: [kGray3, kblack]),
                            border: Border.all(
                              color: kgolder,
                              width: 2,
                            )),
                        child: Row(
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  servicesModel.userName!,
                                  style: TextStyle(
                                      color: kgolder, fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Phone: ",
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                servicesModel.userPhone!,
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "From:",
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                servicesModel.from!,
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "To:",
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                servicesModel.to!,
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Replacement type:",
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                servicesModel.replacementType!,
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  bool    isLoadingApproved = false;
                                  Get.defaultDialog(
                                      title: "",
                                      titleStyle:
                                      TextStyle(color: kgolder),
                                      titlePadding: EdgeInsets.only(
                                          right: 100, top: 5),
                                      backgroundColor: Colors.transparent,
                                      content: StatefulBuilder(
                                          builder: (context, setStateDialog) {
                                            return Container(
                                              width: Get.width,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                                gradient: LinearGradient(
                                                    colors: [kGray3, kblack]),
                                                border: Border.all(
                                                  color: kgolder,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                userData.name!,
                                                                style: TextStyle(
                                                                    color:
                                                                    kgolder),
                                                              ),
                                                              SizedBox(
                                                                  height: 15),
                                                              Text(
                                                                "Emp ID: ${userData.empId}",
                                                                style: TextStyle(
                                                                    color:
                                                                    kgolder),
                                                              ),
                                                              Text(
                                                                "Designation: ${userData.designation}",
                                                                style: TextStyle(
                                                                    color:
                                                                    kgolder),
                                                              ),
                                                              Text(
                                                                "Phone: ${userData.phoneNumber}",
                                                                style: TextStyle(
                                                                    color:
                                                                    kgolder),
                                                              ),
                                                              Text(
                                                                "Email : ${userData.email}",
                                                                style: TextStyle(
                                                                    color:
                                                                    kgolder),
                                                              ),
                                                              SizedBox(
                                                                  height: 15),
                                                              Container(
                                                                width: 150,
                                                                child: Text(
                                                                  "Request Details: ${servicesModel.jobDescription}",
                                                                  style: TextStyle(
                                                                      color:
                                                                      kgolder),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 15),
                                                      isLoadingApproved ? kprogressbar :  Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .end,
                                                        children: [
                                                          InkWell(
                                                            onTap:() async {
                                                              setStateDialog(() {
                                                                isLoadingApproved = true;
                                                              });
                                                              var result = await _allApi.approveBenchList(
                                                                benchId: servicesModel.benchId,
                                                              );
                                                              setStateDialog(() {
                                                                isLoadingApproved = false;
                                                              });
                                                              Navigator.of(context).pop();
                                                              setState(() {});
                                                              if (result == 'approved') {
                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                  const SnackBar(
                                                                    content: Text('Request Approved'),
                                                                  ),
                                                                );
                                                              } else {
                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                  const SnackBar(
                                                                    content: Text(
                                                                      'Failed to approve request.',
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                            child: Container(
                                                              height: 30,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
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
                                                                      "Approve",
                                                                      style: TextStyle(
                                                                          color:
                                                                          kblack,
                                                                          fontSize:
                                                                          18),
                                                                    )),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                            EdgeInsets.only(
                                                                left: 8,
                                                                right: 8),
                                                            child: Center(
                                                                child: InkWell(
                                                                    onTap: () {
                                                                      Get.back();
                                                                    },
                                                                    child: Text(
                                                                      "Cancel",
                                                                      style: TextStyle(
                                                                          color:
                                                                          kgolder,
                                                                          fontSize:
                                                                          18),
                                                                    ))),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                      ),
                                      radius: 50);
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                      color: kGray2,
                                      border: Border.all(
                                        color: kblack,
                                        width: 2,
                                      )),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Center(
                                        child: Text(
                                          "Approve",
                                          style: TextStyle(
                                              color: kgolder, fontSize: 18),
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  bool isLoadingReject = false;
                                  Get.defaultDialog(
                                      title: "",
                                      titleStyle:
                                      TextStyle(color: kgolder),
                                      titlePadding: EdgeInsets.only(
                                          right: 100, top: 5),
                                      backgroundColor: Colors.transparent,
                                      content: StatefulBuilder(
                                          builder: (context, setStateDialog) {
                                            return Container(
                                              height: Get.height*0.7,
                                              width: Get.width,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                                gradient: LinearGradient(
                                                    colors: [kGray3, kblack]),
                                                border: Border.all(
                                                  color: kgolder,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                        children: [
                                                          SingleChildScrollView(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                  servicesModel.userName!,
                                                                  style: TextStyle(
                                                                      color:
                                                                      kgolder),
                                                                ),
                                                                SizedBox(
                                                                    height: 15),
                                                                Text(
                                                                  "Emp ID: ${userData.empId}",
                                                                  style: TextStyle(
                                                                      color:
                                                                      kgolder),
                                                                ),
                                                                Text(
                                                                  "Designation: ${userData.designation}",
                                                                  style: TextStyle(
                                                                      color:
                                                                      kgolder),
                                                                ),
                                                                Text(
                                                                  "Phone: ${userData.phoneNumber}",
                                                                  style: TextStyle(
                                                                      color:
                                                                      kgolder),
                                                                ),
                                                                Text(
                                                                  "Email : ${userData.email}",
                                                                  style: TextStyle(
                                                                      color:
                                                                      kgolder),
                                                                ),
                                                                SizedBox(
                                                                    height: 15),
                                                                Container(
                                                                  width: 150,
                                                                  child: Text(
                                                                    "Request Details: ${servicesModel.jobDescription}",
                                                                    style: TextStyle(
                                                                        color:
                                                                        kgolder),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 15),
                                                      Container(
                                                        width: Get.width,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                          gradient:
                                                          LinearGradient(
                                                              colors: [
                                                                kgradientYellow,
                                                                kgolder2
                                                              ]),
                                                          border: Border.all(
                                                            color: kgolder,
                                                            width: 2,
                                                          ),
                                                        ),
                                                        child: TextFormField(
                                                          controller: _reasonController,
                                                          decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: Colors.transparent,
                                                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                                                          ),

                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                        children: [
                                                          InkWell(
                                                            onTap:() async {
                                                              if (_reasonController.text.isNotEmpty ) {
                                                                setStateDialog(() {
                                                                  isLoadingReject = true;
                                                                });
                                                                var result = await _allApi.rejectBenchList(
                                                                  benchId: servicesModel.benchId,
                                                                  reason: _reasonController.text,
                                                                );
                                                                setStateDialog(() {
                                                                  isLoadingReject = false;
                                                                });
                                                                Navigator.of(context).pop();
                                                                setState(() {});
                                                                if (result == 'rejected') {
                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                    const SnackBar(
                                                                      content: Text('Request Rejected'),
                                                                    ),
                                                                  );
                                                                } else {
                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                    const SnackBar(
                                                                      content: Text(
                                                                        'Failed to reject request.',
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                              } else {
                                                                Fluttertoast.showToast(
                                                                  msg: 'Please write reason for rejection.',
                                                                );
                                                              }
                                                            },
                                                            child: Container(
                                                              height: 30,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                    .circular(
                                                                    10)),
                                                                color: kgolder,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                EdgeInsets.only(
                                                                    left: 8,
                                                                    right: 8),
                                                                child: Center(
                                                                    child: Text(
                                                                      "Reject",
                                                                      style: TextStyle(
                                                                          color: kblack,
                                                                          fontSize: 18),
                                                                    )),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 30,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .all(Radius
                                                                  .circular(
                                                                  10)),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsets.only(
                                                                  left: 8,
                                                                  right: 8),
                                                              child: Center(
                                                                  child: InkWell(
                                                                      onTap: () {
                                                                        Get.back();
                                                                      },
                                                                      child: Text(
                                                                        "Cancel",
                                                                        style: TextStyle(
                                                                            color:
                                                                            kgolder,
                                                                            fontSize:
                                                                            18),
                                                                      ))),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                      ),
                                      radius: 50);
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                      color: kGray2,
                                      border: Border.all(
                                        color: kblack,
                                        width: 2,
                                      )),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Center(
                                        child: Text(
                                          "Reject",
                                          style: TextStyle(
                                              color: kgolder, fontSize: 18),
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
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
          );
        }
    );
  }

  acceptedCard(BenchListModel servicesModel) {
    return FutureBuilder<UserModel>(
        future: _allApi.getUser(servicesModel.replacementRefId!),
        builder: (context, userSnap) {
          if(!userSnap.hasData){
            return SizedBox();
          }

          var userData = userSnap.requireData;

          return Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: (){

                Get.defaultDialog(
                    title: "",
                    titleStyle:
                    TextStyle(color: kgolder),
                    titlePadding: EdgeInsets.only(
                        right: 100, top: 5),
                    backgroundColor: Colors.transparent,
                    content: StatefulBuilder(
                        builder: (context, setStateDialog) {
                          return Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8)),
                              gradient: LinearGradient(
                                  colors: [kGray3, kblack]),
                              border: Border.all(
                                color: kgolder,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            SizedBox(
                                                height: 15),
                                            Text(
                                              "Emp Name: ${userData.name}",
                                              style: TextStyle(
                                                  color:
                                                  kgolder),
                                            ),
                                            Text(
                                              "Emp ID: ${userData.empId}",
                                              style: TextStyle(
                                                  color:
                                                  kgolder),
                                            ),
                                            SizedBox(height: 15,),

                                            Container(
                                              width: 150,
                                              child: Text(
                                                "Replacement Name: ${servicesModel.replacementName}",
                                                style: TextStyle(
                                                    color:
                                                    kgolder),
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              child:Text(
                                                "Replacement Emp Id: ${servicesModel.replacementEmpId}",
                                                style: TextStyle(
                                                    color:
                                                    kgolder),
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              child:Text(
                                                "Replacement Phone: ${servicesModel.replacementPhone}",
                                                style: TextStyle(
                                                    color:
                                                    kgolder),
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              child:Text(
                                                "Replacement Type: ${servicesModel.replacementType}",
                                                style: TextStyle(
                                                    color:
                                                    kgolder),
                                              ),
                                            ),
                                            SizedBox(
                                                height: 15),
                                            Container(
                                              width: 150,
                                              child: Text(
                                                "Request Details: ${servicesModel.jobDescription}",
                                                style: TextStyle(
                                                    color:
                                                    kgolder),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    // isLoadingApproved ? kprogressbar :  Row(
                                    //   mainAxisAlignment:
                                    //   MainAxisAlignment
                                    //       .end,
                                    //   children: [
                                    //     InkWell(
                                    //       onTap:() async {
                                    //         setStateDialog(() {
                                    //           isLoadingApproved = true;
                                    //         });
                                    //         var result = await _allApi.approveService(
                                    //           refId: servicesModel.refid!,
                                    //           certificateName:
                                    //           servicesModel.serviceid,
                                    //         );
                                    //         setStateDialog(() {
                                    //           isLoadingApproved = false;
                                    //         });
                                    //         Navigator.of(context).pop();
                                    //
                                    //         if (result == 'approved') {
                                    //           ScaffoldMessenger.of(context).showSnackBar(
                                    //             const SnackBar(
                                    //               content: Text('Request Approved'),
                                    //             ),
                                    //           );
                                    //         } else {
                                    //           ScaffoldMessenger.of(context).showSnackBar(
                                    //             const SnackBar(
                                    //               content: Text(
                                    //                 'Failed to approve request.',
                                    //               ),
                                    //             ),
                                    //           );
                                    //         }
                                    //         setState(() {});
                                    //       },
                                    //       child: Container(
                                    //         height: 30,
                                    //         decoration:
                                    //         BoxDecoration(
                                    //           borderRadius: BorderRadius
                                    //               .all(Radius
                                    //               .circular(
                                    //               10)),
                                    //           color: kgolder,
                                    //         ),
                                    //         child: Padding(
                                    //           padding: EdgeInsets
                                    //               .only(
                                    //               left: 8,
                                    //               right: 8),
                                    //           child: Center(
                                    //               child: Text(
                                    //                 "Approve",
                                    //                 style: TextStyle(
                                    //                     color:
                                    //                     kblack,
                                    //                     fontSize:
                                    //                     18),
                                    //               )),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Padding(
                                    //       padding:
                                    //       EdgeInsets.only(
                                    //           left: 8,
                                    //           right: 8),
                                    //       child: Center(
                                    //           child: InkWell(
                                    //               onTap: () {
                                    //                 Get.back();
                                    //               },
                                    //               child: Text(
                                    //                 "Cancel",
                                    //                 style: TextStyle(
                                    //                     color:
                                    //                     kgolder,
                                    //                     fontSize:
                                    //                     18),
                                    //               ))),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                    radius: 50);
              },
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [kgradientYellow, kgolder2]),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: kgolder,
                      width: 2,
                    )),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Container(
                        height: 35,
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8)),
                            gradient:
                            LinearGradient(colors: [kGray3, kblack]),
                            border: Border.all(
                              color: kgolder,
                              width: 2,
                            )),
                        child: Row(
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  servicesModel.userName!,
                                  style: TextStyle(
                                      color: kgolder, fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Employee Id: ",
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                servicesModel.userEmpId!,
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Replacement Name:",
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                servicesModel.replacementName!,
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Replacement employee id:",
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                servicesModel.replacementEmpId!,
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Replacement phone:",
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                servicesModel.replacementPhone!,
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Replacement type:",
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                servicesModel.replacementType!,
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Replacement status:",
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Accepted',
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }

  rejectedCard(BenchListModel servicesModel) {
    return FutureBuilder<UserModel>(
        future: _allApi.getUser(servicesModel.replacementRefId!),
        builder: (context, userSnap) {
          if(!userSnap.hasData){
            return SizedBox();
          }

          var userData = userSnap.requireData;

          return Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: (){

                Get.defaultDialog(
                    title: "",
                    titleStyle:
                    TextStyle(color: kgolder),
                    titlePadding: EdgeInsets.only(
                        right: 100, top: 5),
                    backgroundColor: Colors.transparent,
                    content: StatefulBuilder(
                        builder: (context, setStateDialog) {
                          return Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8)),
                              gradient: LinearGradient(
                                  colors: [kGray3, kblack]),
                              border: Border.all(
                                color: kgolder,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            SizedBox(
                                                height: 15),
                                            Text(
                                              "Emp Name: ${userData.name}",
                                              style: TextStyle(
                                                  color:
                                                  kgolder),
                                            ),
                                            Text(
                                              "Emp ID: ${userData.empId}",
                                              style: TextStyle(
                                                  color:
                                                  kgolder),
                                            ),
                                            SizedBox(height: 15,),

                                            Container(
                                              width: 150,
                                              child: Text(
                                                "Replacement Name: ${servicesModel.replacementName}",
                                                style: TextStyle(
                                                    color:
                                                    kgolder),
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              child:Text(
                                                "Replacement Emp Id: ${servicesModel.replacementEmpId}",
                                                style: TextStyle(
                                                    color:
                                                    kgolder),
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              child:Text(
                                                "Replacement Phone: ${servicesModel.replacementPhone}",
                                                style: TextStyle(
                                                    color:
                                                    kgolder),
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              child:Text(
                                                "Replacement Type: ${servicesModel.replacementType}",
                                                style: TextStyle(
                                                    color:
                                                    kgolder),
                                              ),
                                            ),
                                            SizedBox(
                                                height: 15),
                                            Container(
                                              width: 150,
                                              child: Text(
                                                "Request Detailasdass: ${servicesModel.jobDescription}",
                                                style: TextStyle(
                                                    color:
                                                    kgolder),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    // isLoadingApproved ? kprogressbar :  Row(
                                    //   mainAxisAlignment:
                                    //   MainAxisAlignment
                                    //       .end,
                                    //   children: [
                                    //     InkWell(
                                    //       onTap:() async {
                                    //         setStateDialog(() {
                                    //           isLoadingApproved = true;
                                    //         });
                                    //         var result = await _allApi.approveService(
                                    //           refId: servicesModel.refid!,
                                    //           certificateName:
                                    //           servicesModel.serviceid,
                                    //         );
                                    //         setStateDialog(() {
                                    //           isLoadingApproved = false;
                                    //         });
                                    //         Navigator.of(context).pop();
                                    //
                                    //         if (result == 'approved') {
                                    //           ScaffoldMessenger.of(context).showSnackBar(
                                    //             const SnackBar(
                                    //               content: Text('Request Approved'),
                                    //             ),
                                    //           );
                                    //         } else {
                                    //           ScaffoldMessenger.of(context).showSnackBar(
                                    //             const SnackBar(
                                    //               content: Text(
                                    //                 'Failed to approve request.',
                                    //               ),
                                    //             ),
                                    //           );
                                    //         }
                                    //         setState(() {});
                                    //       },
                                    //       child: Container(
                                    //         height: 30,
                                    //         decoration:
                                    //         BoxDecoration(
                                    //           borderRadius: BorderRadius
                                    //               .all(Radius
                                    //               .circular(
                                    //               10)),
                                    //           color: kgolder,
                                    //         ),
                                    //         child: Padding(
                                    //           padding: EdgeInsets
                                    //               .only(
                                    //               left: 8,
                                    //               right: 8),
                                    //           child: Center(
                                    //               child: Text(
                                    //                 "Approve",
                                    //                 style: TextStyle(
                                    //                     color:
                                    //                     kblack,
                                    //                     fontSize:
                                    //                     18),
                                    //               )),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Padding(
                                    //       padding:
                                    //       EdgeInsets.only(
                                    //           left: 8,
                                    //           right: 8),
                                    //       child: Center(
                                    //           child: InkWell(
                                    //               onTap: () {
                                    //                 Get.back();
                                    //               },
                                    //               child: Text(
                                    //                 "Cancel",
                                    //                 style: TextStyle(
                                    //                     color:
                                    //                     kgolder,
                                    //                     fontSize:
                                    //                     18),
                                    //               ))),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                    radius: 50);
              },
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [kgradientYellow, kgolder2]),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: kgolder,
                      width: 2,
                    )),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Container(
                        height: 35,
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8)),
                            gradient:
                            LinearGradient(colors: [kGray3, kblack]),
                            border: Border.all(
                              color: kgolder,
                              width: 2,
                            )),
                        child: Row(
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  servicesModel.userName!,
                                  style: TextStyle(
                                      color: kgolder, fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Employee Id: ",
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                servicesModel.userEmpId!,
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Replacement Name:",
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                servicesModel.replacementName!,
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Replacement employee id:",
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                servicesModel.replacementEmpId!,
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Replacement phone:",
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                servicesModel.replacementPhone!,
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Replacement type:",
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                servicesModel.replacementType!,
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Replacement status:",
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Rejected',
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Reason:",
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                servicesModel.reason!,
                                style: TextStyle(
                                    color: kblack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }


}