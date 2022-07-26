import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/api.dart';
import '../Components/constants.dart';
import '../Components/models.dart';

class LeaveRequest1 extends StatefulWidget {
  final UserModel userModel;

  const LeaveRequest1({Key? key, required this.userModel}) : super(key: key);

  @override
  State<LeaveRequest1> createState() => _LeaveRequest1State();
}

class _LeaveRequest1State extends State<LeaveRequest1> {
  double screenHeight = 0;
  double screenWidth = 0;
  final _allApi = AllApi();
  final _reasonController = TextEditingController();
  var _reason = '';
  List<EmployeeLeaveRequestsModel>? _listTabRequests;
  List<EmployeeLeaveRequestsModel>? _acceptedTabRequests;
  List<EmployeeLeaveRequestsModel>? _rejectedTabRequests;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kGray3,
        appBar: AppBar(
          leading: InkWell(
              onTap: (){
                Get.back();
              },
              child: Padding(
                padding:   EdgeInsets.only(left: 10.0),
                child: Icon(Icons.arrow_back,color: kblack),
              ),
          ),

          leadingWidth: 25,
          title:      Text("Leaves ",style: TextStyle(color: kblack,fontSize: 20,fontWeight: FontWeight.bold),),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15))
          ),


          toolbarHeight: 55,
          backgroundColor: kgolder2,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [kgolder2,kgradientYellow,kgolder2]
              ),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15))
            ),
          ),
        ),
        body: Container(
          color: kgolder2,
          child: DefaultTabController(
            length: 1,
            child: Scaffold(

              body: Container(
                decoration: BoxDecoration(
                  gradient:  LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      kGray3,
                      kblack,
                    ],
                  )
                ),

                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      child: Expanded(
                        child: TabBarView(
                          children: [
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
                                              gradient: LinearGradient(
                                                  colors: [kgolder2,kgradientYellow,kgolder2]
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(8)),
                                              border: Border.all(
                                                color:kblack,
                                                width: 2,
                                              )
                                          ),
                                          child: Container(
                                            child: TabBar(
                                              labelStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight:FontWeight.w600),
                                              labelColor:kgolder,
                                              unselectedLabelColor:  kblack,
                                              indicator: BoxDecoration(
                                                color: kGray2,
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                  border: Border.all(
                                                    color:kgolder,
                                                    width: 2,
                                                  ),
                                              ),
                                              tabs: [
                                                Tab(child: Text("Pending",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),),
                                                Tab(child: Text("Accepted",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),),
                                                Tab(child: Text("Rejected",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height:5,),
                                      Container(
                                        child:Expanded(
                                          child: TabBarView(
                                            children: [
                                              pendingWidget(),
                                              acceptedWidget(),
                                              rejectedWidget(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),///tapbar
                          ],
                        ),

                      ),)],),
              ),),
          ),
        ),

      )


    );
  }
  DefaultTabController pendingWidget() {
    return DefaultTabController(
        length: 1,
        child: FutureBuilder<List<EmployeeLeaveRequestsModel  >?>(
            future: _allApi.getManagerLeaveRequests(
              companyId: widget.userModel.companyId,
              verify: '0',
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
                      fontSize: 22,color: kgolder2
                    ),
                  ),
                );
              } else {
                var servicesList = snapshot.data;
                _listTabRequests = servicesList;

                return ListView.builder(
                    itemCount: _listTabRequests!.length,
                    itemBuilder: (context, index) {

                      return  AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 700),
                        child: SlideAnimation(
                          duration: Duration(milliseconds: 500),
                          horizontalOffset: 200.0,
                          child: FadeInAnimation(
                              child:      pendingCard(_listTabRequests![index])
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
        child: FutureBuilder<List<EmployeeLeaveRequestsModel>?>(
            future: _allApi.getManagerLeaveRequests(
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
                      fontSize: 22,color: kgolder2
                    ),
                  ),
                );
              } else {
                var servicesList = snapshot.data;
                _listTabRequests = servicesList;

                return ListView.builder(
                    itemCount: _listTabRequests!.length,
                    itemBuilder: (context, index) {
                      return  AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 700),
                        child: SlideAnimation(
                          duration: Duration(milliseconds: 500),
                          horizontalOffset: 200.0,
                          child: FadeInAnimation(
                              child:      acceptedCard(_listTabRequests![index])
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
        child: FutureBuilder<List<EmployeeLeaveRequestsModel>?>(
            future: _allApi.getManagerLeaveRequests(
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
                      fontSize: 22,color: kgolder2
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
                              child:    rejectedCard(  _listTabRequests![index])
                          ),
                        ),
                      );


                    }
                );
              }

            }));
  }



  pendingCard(EmployeeLeaveRequestsModel servicesModel) {
    return FutureBuilder<UserModel>(
        future: _allApi.getUser(servicesModel.refId!),
        builder: (context, userSnap) {
          if(!userSnap.hasData){
            return SizedBox();
          }

          var userData = userSnap.requireData;

          return
            Padding(
              padding:   EdgeInsets.all(10),
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
                                child: Text("Personal Leave",style: TextStyle(color: kgolder,fontSize:20),),
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

                                      content: StatefulBuilder(
                                          builder: (context, setStateDialog) {
                                            bool     isLoadingApproved = false;
                                            return Container(
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
                                                            Text(userData.name!,style: TextStyle(color:kgolder ),),
                                                            SizedBox(height: 15),
                                                            Text("Emp ID: ${userData.empId}",style: TextStyle(color:kgolder ),),
                                                            Text("Designation: ${userData.designation}",style: TextStyle(color:kgolder ),),
                                                            Text("Phone: ${userData.phoneNumber}",style: TextStyle(color:kgolder ),),
                                                            Text("Email : ${userData.email}",style: TextStyle(color:kgolder ),),
                                                            SizedBox(height: 15),
                                                            // Text("Request Details: \nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc",
                                                            //   style: TextStyle(color:kgolder ),),

                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 15),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        InkWell(
                                                          onTap:() async {

                                                            setStateDialog(() {
                                                              isLoadingApproved = true;
                                                            });
                                                            var result = await _allApi.approveLeaveRequest(
                                                              requestId: servicesModel.requestId,
                                                            );
                                                            setStateDialog(() {
                                                              isLoadingApproved = false;
                                                            });
                                                            Navigator.of(context).pop();

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
                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            height: 30,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              color: kgolder,

                                                            ),
                                                            child:Padding(
                                                              padding:  EdgeInsets.only(left: 8,right: 8),
                                                              child: Center(child: Text("Approve",style: TextStyle(color: kblack,),)),
                                                            ) ,
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 30,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                                          ),
                                                          child:Padding(
                                                            padding:  EdgeInsets.only(left: 8,right: 8),
                                                            child: Center(
                                                                child: InkWell(
                                                                    onTap: () {
                                                                      Get.back();
                                                                    },
                                                                    child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),))),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }
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

                                      content: StatefulBuilder(
                                          builder: (context, setStateDialog) {
                                            bool isLoadingReject = false;
                                            return Container(
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
                                                            Text(userData.name!,style: TextStyle(color:kgolder ),),
                                                            SizedBox(height: 15),
                                                            Text("Emp ID: ${userData.empId}",style: TextStyle(color:kgolder ),),
                                                            Text("Designation: ${userData.designation}",style: TextStyle(color:kgolder ),),
                                                            Text("Phone: ${userData.phoneNumber}",style: TextStyle(color:kgolder ),),
                                                            Text("Email : ${userData.email}",style: TextStyle(color:kgolder ),),
                                                            SizedBox(height: 15),
                                                            // Text("Request Details: \nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc",
                                                            //   style: TextStyle(color:kgolder ),),

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
                                                        InkWell(
                                                          onTap:() async {

                                                            if (_reason != '') {
                                                              setStateDialog(() {
                                                                isLoadingReject = true;
                                                              });
                                                              var result = await _allApi.rejectLeaveReuest(
                                                                requestId: servicesModel.requestId,
                                                                reason: _reason,
                                                              );
                                                              setStateDialog(() {
                                                                isLoadingReject = false;
                                                              });
                                                              Navigator.of(context).pop();

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
                                                              setState(() {});
                                                            } else {
                                                              Fluttertoast.showToast(
                                                                msg: 'Please write reason for rejection.',
                                                              );
                                                            }
                                                          },
                                                          child: Container(
                                                            height: 30,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              color: kgolder,

                                                            ),
                                                            child:Padding(
                                                              padding:  EdgeInsets.only(left: 8,right: 8),
                                                              child: Center(child: Text("Reject",style: TextStyle(color: kblack),)),
                                                            ) ,
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 30,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.all(Radius.circular(10)),


                                                          ),
                                                          child:Padding(
                                                            padding:  EdgeInsets.only(left: 8,right: 8),
                                                            child: Center(
                                                                child: InkWell(
                                                                    onTap: () {
                                                                      Get.back();
                                                                    },
                                                                    child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),))),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }
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
            );
        }
    );
  }

  acceptedCard(EmployeeLeaveRequestsModel servicesModel) {
    return FutureBuilder<UserModel>(
        future: _allApi.getUser(servicesModel.refId!),
        builder: (context, userSnap) {
          if(!userSnap.hasData){
            return SizedBox();
          }

          var userData = userSnap.requireData;

          return Padding(
            padding:   EdgeInsets.all(10),
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
                              child: Text(userData.name!,style: TextStyle(color: kgolder,fontSize:20),),
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
                            Text("Request :",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                            Text(servicesModel.title!,style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date :",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                            Text(servicesModel!.date!,style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Details: ",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                Container(
                                    // width: 150,
                                    child: Text(servicesModel!.details!,style: TextStyle(color: kblack, fontWeight: FontWeight.bold),)),
                              ],
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
          );
        }
    );
  }

  rejectedCard(EmployeeLeaveRequestsModel servicesModel) {
    return FutureBuilder<UserModel>(
        future: _allApi.getUser(servicesModel.refId!),
        builder: (context, userSnap) {
          if(!userSnap.hasData){
            return SizedBox();
          }

          var userData = userSnap.requireData;

          return Padding(
            padding:   EdgeInsets.all(10),
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
                              child: Text("Personal Leave",style: TextStyle(color: kgolder,fontSize:20),),
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
                            Text("Request :",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                            Text("Personal Leave",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date :",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                            Text("16/08/2022",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Details: ",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                Text("In publishing and graphic design, Lorem epsum\nIpsum is a placeholder text xommonly",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                              ],
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
          );
        }
    );
  }



}


// Container(
//
// decoration: BoxDecoration(
// borderRadius: BorderRadius.all(Radius.circular(8)),
// gradient: LinearGradient(
// colors: [ kGray3,kblack]
// ),
// border: Border.all(
// color:kgolder,
// width: 2,
// )
// ),
// child: Column(
// children: [
// Text("Fahad Kharadi",style: TextStyle(color: kgolder2,fontSize: 10),)
// ],
//
// ),
// ),