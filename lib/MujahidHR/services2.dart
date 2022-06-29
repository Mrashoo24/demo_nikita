import 'package:demo_nikita/Mujahidthursday/Services/service_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:open_file/open_file.dart';

import '../Components/api.dart';
import '../Components/constants.dart';
import '../Components/models.dart';

class ServicesHR extends StatefulWidget {
  final UserModel userModel;

  const ServicesHR({Key? key, required this.userModel}) : super(key: key);

  @override
  State<ServicesHR> createState() => _ServicesHRState();
}

class _ServicesHRState extends State<ServicesHR> {
  final _allApi = AllApi();
  final _reasonController = TextEditingController();
  var _reason = '';
  var _pdfLoading = false;
  List<ServicesModel>? _listTabServices;
  List<ServicesModel>? _acceptedTabServices;
  List<ServicesModel>? _rejectedTabServices;

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
          leadingWidth: 25,
          title: Text(
            "Certificates ",
            style: TextStyle(
                color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
          toolbarHeight: 55,
          backgroundColor: kgolder2,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [kgolder2, kgradientYellow, kgolder2]),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
          ),
        ),
        body: Container(
          color: kgolder2,
          child: DefaultTabController(
            length: 1,
            child: Scaffold(
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
                    SizedBox(height: 10),
                    Container(
                      child: Expanded(
                        child: TabBarView(
                          children: [
                            Container(
                              child: DefaultTabController(
                                  length: 2,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 45,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                kgolder2,
                                                kgradientYellow,
                                                kgolder2
                                              ]),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              border: Border.all(
                                                color: kblack,
                                                width: 2,
                                              )),
                                          child: Container(
                                            child: TabBar(
                                              labelStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                              labelColor: kgolder,
                                              unselectedLabelColor: kblack,
                                              indicator: BoxDecoration(
                                                color: kGray2,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                                border: Border.all(
                                                  color: kgolder,
                                                  width: 2,
                                                ),
                                              ),
                                              tabs: [
                                                Tab(
                                                  child: Text(
                                                    "Pending",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontFamily:
                                                        'Typo Round',
                                                        fontWeight:
                                                        FontWeight.w400),
                                                  ),
                                                ),
                                                Tab(
                                                  child: Text(
                                                    "Sent",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontFamily:
                                                        'Typo Round',
                                                        fontWeight:
                                                        FontWeight.w400),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
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
                                            ],
                                          ),
                                        ),
                                      ),
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
      ),
    );
  }

  DefaultTabController pendingWidget() {
    return DefaultTabController(
        length: 1,
        child: FutureBuilder<List<ServicesModel>?>(
            future: _allApi.getServicesManager(
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
                    'Nothing to show here.',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                );
              } else {
                var servicesList = snapshot.data;
                _listTabServices = servicesList;

                print('gettingDatainteral = ${_listTabServices!.length}');

                return ListView.builder(
                    itemCount: _listTabServices!.length,
                    itemBuilder: (context, index) {


                        return  AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 700),
                          child: SlideAnimation(
                            duration: Duration(milliseconds: 500),
                            horizontalOffset: 200.0,
                            child: FadeInAnimation(
                              child:pendingCard(_listTabServices![index]),
                            ),
                          ),
                        );

                        ;



                    }
                );
              }

            }));
  }

  DefaultTabController acceptedWidget() {
    return DefaultTabController(
        length: 1,
        child: FutureBuilder<List<ServicesModel>?>(
            future: _allApi.getServicesManager(
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
                    'Nothing to show here.',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                );
              } else {
                var servicesList = snapshot.data;
                _listTabServices = servicesList;

                return ListView.builder(
                    itemCount: _listTabServices!.length,
                    itemBuilder: (context, index) {

                      if (_listTabServices![index].fileName != null) {
                        return  AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 700),
                          child: SlideAnimation(
                            duration: Duration(milliseconds: 500),
                            horizontalOffset: 200.0,
                            child: FadeInAnimation(
                                child:acceptedCard(_listTabServices![index])
                            ),
                          ),
                        );


                      }else{
                        return Container();
                      }

                    }
                );
              }

            }));
  }


  pendingCard(ServicesModel servicesModel) {
    return FutureBuilder<UserModel>(
        future: _allApi.getUser(servicesModel.refid!),
        builder: (context, userSnap) {
          if(!userSnap.hasData){
            return SizedBox();
          }

          var userData = userSnap.requireData;

          return Padding(
            padding: EdgeInsets.all(10),
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
                                servicesModel.empname!,
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
                              "Certificate Name: ",
                              style: TextStyle(
                                  color: kblack,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              servicesModel.certificateName!,
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
                              "Email id:",
                              style: TextStyle(
                                  color: kblack,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              userData.email!,
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
                              "Date:",
                              style: TextStyle(
                                  color: kblack,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              servicesModel.date!,
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
                               Get.to(ServiceDetailsHR(servicesList: servicesModel, userModel: widget.userModel,));
                                
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
                                        "Complete Certificate",
                                        style: TextStyle(
                                            color: kgolder, fontSize: 18),
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     bool isLoadingReject = false;
                            //     Get.defaultDialog(
                            //         title: "",
                            //         titleStyle:
                            //         TextStyle(color: kgolder),
                            //         titlePadding: EdgeInsets.only(
                            //             right: 100, top: 5),
                            //         backgroundColor: Colors.transparent,
                            //         content: StatefulBuilder(
                            //             builder: (context, setStateDialog) {
                            //               return Container(
                            //                 height: Get.height*0.7,
                            //                 width: Get.width,
                            //                 decoration: BoxDecoration(
                            //                   borderRadius: BorderRadius.all(
                            //                       Radius.circular(8)),
                            //                   gradient: LinearGradient(
                            //                       colors: [kGray3, kblack]),
                            //                   border: Border.all(
                            //                     color: kgolder,
                            //                     width: 2,
                            //                   ),
                            //                 ),
                            //                 child: Padding(
                            //                   padding: EdgeInsets.all(10),
                            //                   child: SingleChildScrollView(
                            //                     child: Column(
                            //                       children: [
                            //                         Row(
                            //                           mainAxisAlignment:
                            //                           MainAxisAlignment
                            //                               .start,
                            //                           children: [
                            //                             SingleChildScrollView(
                            //                               child: Column(
                            //                                 crossAxisAlignment:
                            //                                 CrossAxisAlignment
                            //                                     .start,
                            //                                 children: [
                            //                                   Text(
                            //                                     servicesModel.empname!,
                            //                                     style: TextStyle(
                            //                                         color:
                            //                                         kgolder),
                            //                                   ),
                            //                                   SizedBox(
                            //                                       height: 15),
                            //                                   Text(
                            //                                     "Emp ID: ${userData.empId}",
                            //                                     style: TextStyle(
                            //                                         color:
                            //                                         kgolder),
                            //                                   ),
                            //                                   Text(
                            //                                     "Designation: ${userData.designation}",
                            //                                     style: TextStyle(
                            //                                         color:
                            //                                         kgolder),
                            //                                   ),
                            //                                   Text(
                            //                                     "Phone: ${userData.phoneNumber}",
                            //                                     style: TextStyle(
                            //                                         color:
                            //                                         kgolder),
                            //                                   ),
                            //                                   Text(
                            //                                     "Email : ${userData.email}",
                            //                                     style: TextStyle(
                            //                                         color:
                            //                                         kgolder),
                            //                                   ),
                            //                                   SizedBox(
                            //                                       height: 15),
                            //                                   Container(
                            //                                     width: 150,
                            //                                     child: Text(
                            //                                       "Request Details: ${servicesModel.certificateName}",
                            //                                       style: TextStyle(
                            //                                           color:
                            //                                           kgolder),
                            //                                     ),
                            //                                   ),
                            //                                 ],
                            //                               ),
                            //                             ),
                            //                           ],
                            //                         ),
                            //                         SizedBox(height: 15),
                            //                         Container(
                            //                           width: Get.width,
                            //                           decoration: BoxDecoration(
                            //                             borderRadius:
                            //                             BorderRadius.all(
                            //                                 Radius.circular(
                            //                                     8)),
                            //                             gradient:
                            //                             LinearGradient(
                            //                                 colors: [
                            //                                   kgradientYellow,
                            //                                   kgolder2
                            //                                 ]),
                            //                             border: Border.all(
                            //                               color: kgolder,
                            //                               width: 2,
                            //                             ),
                            //                           ),
                            //                           child: TextFormField(
                            //                             controller: _reasonController,
                            //                             decoration: InputDecoration(
                            //                                 filled: true,
                            //                                 fillColor: Colors.transparent,
                            //                                 enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                            //                             ),
                            //
                            //                           ),
                            //                         ),
                            //                         SizedBox(height: 15),
                            //                         Row(
                            //                           mainAxisAlignment:
                            //                           MainAxisAlignment.end,
                            //                           children: [
                            //                             InkWell(
                            //                               onTap:() async {
                            //                                 if (_reasonController.text.isNotEmpty ) {
                            //                                   setStateDialog(() {
                            //                                     isLoadingReject = true;
                            //                                   });
                            //                                   var result = await _allApi.rejectService(
                            //                                     refId: servicesModel.refid,
                            //                                     certificateName:
                            //                                     servicesModel.serviceid,
                            //                                     reason: _reasonController.text,
                            //                                   );
                            //                                   setStateDialog(() {
                            //                                     isLoadingReject = false;
                            //                                   });
                            //                                   Navigator.of(context).pop();
                            //
                            //                                   if (result == 'rejected') {
                            //                                     ScaffoldMessenger.of(context).showSnackBar(
                            //                                       const SnackBar(
                            //                                         content: Text('Request Rejected'),
                            //                                       ),
                            //                                     );
                            //                                   } else {
                            //                                     ScaffoldMessenger.of(context).showSnackBar(
                            //                                       const SnackBar(
                            //                                         content: Text(
                            //                                           'Failed to reject request.',
                            //                                         ),
                            //                                       ),
                            //                                     );
                            //                                   }
                            //                                   setState(() {});
                            //                                 } else {
                            //                                   Fluttertoast.showToast(
                            //                                     msg: 'Please write reason for rejection.',
                            //                                   );
                            //                                 }
                            //                               },
                            //                               child: Container(
                            //                                 height: 30,
                            //                                 decoration:
                            //                                 BoxDecoration(
                            //                                   borderRadius:
                            //                                   BorderRadius
                            //                                       .all(Radius
                            //                                       .circular(
                            //                                       10)),
                            //                                   color: kgolder,
                            //                                 ),
                            //                                 child: Padding(
                            //                                   padding:
                            //                                   EdgeInsets.only(
                            //                                       left: 8,
                            //                                       right: 8),
                            //                                   child: Center(
                            //                                       child: Text(
                            //                                         "Reject",
                            //                                         style: TextStyle(
                            //                                             color: kblack,
                            //                                             fontSize: 18),
                            //                                       )),
                            //                                 ),
                            //                               ),
                            //                             ),
                            //                             Container(
                            //                               height: 30,
                            //                               decoration:
                            //                               BoxDecoration(
                            //                                 borderRadius:
                            //                                 BorderRadius
                            //                                     .all(Radius
                            //                                     .circular(
                            //                                     10)),
                            //                               ),
                            //                               child: Padding(
                            //                                 padding:
                            //                                 EdgeInsets.only(
                            //                                     left: 8,
                            //                                     right: 8),
                            //                                 child: Center(
                            //                                     child: InkWell(
                            //                                         onTap: () {
                            //                                           Get.back();
                            //                                         },
                            //                                         child: Text(
                            //                                           "Cancel",
                            //                                           style: TextStyle(
                            //                                               color:
                            //                                               kgolder,
                            //                                               fontSize:
                            //                                               18),
                            //                                         ))),
                            //                               ),
                            //                             ),
                            //                           ],
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ),
                            //                 ),
                            //               );
                            //             }
                            //         ),
                            //         radius: 50);
                            //   },
                            //   child: Container(
                            //     height: 30,
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.all(
                            //             Radius.circular(10)),
                            //         color: kGray2,
                            //         border: Border.all(
                            //           color: kblack,
                            //           width: 2,
                            //         )),
                            //     child: Padding(
                            //       padding: EdgeInsets.only(
                            //           left: 8, right: 8),
                            //       child: Center(
                            //           child: Text(
                            //             "Reject",
                            //             style: TextStyle(
                            //                 color: kgolder, fontSize: 18),
                            //           )),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            ///PdfView
                           /* _pdfLoading ? kprogressbar :   InkWell(
                              onTap: () async {
                                setState(() {
                                  _pdfLoading = true;
                                });
                                if (servicesModel.fileName != null) {
                                  var file = await _allApi.loadFile(
                                    url:
                                    'http://faizeetech.com/pdf/${servicesModel.fileName}',
                                    fileName: servicesModel.fileName,
                                  );
                                  await OpenFile.open(file.path);
                                  setState(() {
                                    _pdfLoading = false;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        '''
            File isn't available. Wait for the HR to send the file.''',
                                      ),
                                    ),
                                  );
                                }
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
                                        "View",
                                        style: TextStyle(
                                            color: kgolder, fontSize: 18),
                                      )),
                                ),
                              ),
                            ),*/
                            ///PdfView
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

  acceptedCard(ServicesModel servicesModel) {
    return FutureBuilder<UserModel>(
        future: _allApi.getUser(servicesModel.refid!),
        builder: (context, userSnap) {
          if(!userSnap.hasData){
            return SizedBox();
          }

          var userData = userSnap.requireData;

          return Padding(
            padding: EdgeInsets.all(10),
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
                                servicesModel.empname!,
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
                              "Certificate Name: ",
                              style: TextStyle(
                                  color: kblack,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              servicesModel.certificateName!,
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
                              "Email id:",
                              style: TextStyle(
                                  color: kblack,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              userData.email!,
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
                              "Date:",
                              style: TextStyle(
                                  color: kblack,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              servicesModel.date!,
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
                                Get.to(ServiceDetailsHR(servicesList: servicesModel, userModel: widget.userModel,));

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
                                        "View Details",
                                        style: TextStyle(
                                            color: kgolder, fontSize: 18),
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     bool isLoadingReject = false;
                            //     Get.defaultDialog(
                            //         title: "",
                            //         titleStyle:
                            //         TextStyle(color: kgolder),
                            //         titlePadding: EdgeInsets.only(
                            //             right: 100, top: 5),
                            //         backgroundColor: Colors.transparent,
                            //         content: StatefulBuilder(
                            //             builder: (context, setStateDialog) {
                            //               return Container(
                            //                 height: Get.height*0.7,
                            //                 width: Get.width,
                            //                 decoration: BoxDecoration(
                            //                   borderRadius: BorderRadius.all(
                            //                       Radius.circular(8)),
                            //                   gradient: LinearGradient(
                            //                       colors: [kGray3, kblack]),
                            //                   border: Border.all(
                            //                     color: kgolder,
                            //                     width: 2,
                            //                   ),
                            //                 ),
                            //                 child: Padding(
                            //                   padding: EdgeInsets.all(10),
                            //                   child: SingleChildScrollView(
                            //                     child: Column(
                            //                       children: [
                            //                         Row(
                            //                           mainAxisAlignment:
                            //                           MainAxisAlignment
                            //                               .start,
                            //                           children: [
                            //                             SingleChildScrollView(
                            //                               child: Column(
                            //                                 crossAxisAlignment:
                            //                                 CrossAxisAlignment
                            //                                     .start,
                            //                                 children: [
                            //                                   Text(
                            //                                     servicesModel.empname!,
                            //                                     style: TextStyle(
                            //                                         color:
                            //                                         kgolder),
                            //                                   ),
                            //                                   SizedBox(
                            //                                       height: 15),
                            //                                   Text(
                            //                                     "Emp ID: ${userData.empId}",
                            //                                     style: TextStyle(
                            //                                         color:
                            //                                         kgolder),
                            //                                   ),
                            //                                   Text(
                            //                                     "Designation: ${userData.designation}",
                            //                                     style: TextStyle(
                            //                                         color:
                            //                                         kgolder),
                            //                                   ),
                            //                                   Text(
                            //                                     "Phone: ${userData.phoneNumber}",
                            //                                     style: TextStyle(
                            //                                         color:
                            //                                         kgolder),
                            //                                   ),
                            //                                   Text(
                            //                                     "Email : ${userData.email}",
                            //                                     style: TextStyle(
                            //                                         color:
                            //                                         kgolder),
                            //                                   ),
                            //                                   SizedBox(
                            //                                       height: 15),
                            //                                   Container(
                            //                                     width: 150,
                            //                                     child: Text(
                            //                                       "Request Details: ${servicesModel.certificateName}",
                            //                                       style: TextStyle(
                            //                                           color:
                            //                                           kgolder),
                            //                                     ),
                            //                                   ),
                            //                                 ],
                            //                               ),
                            //                             ),
                            //                           ],
                            //                         ),
                            //                         SizedBox(height: 15),
                            //                         Container(
                            //                           width: Get.width,
                            //                           decoration: BoxDecoration(
                            //                             borderRadius:
                            //                             BorderRadius.all(
                            //                                 Radius.circular(
                            //                                     8)),
                            //                             gradient:
                            //                             LinearGradient(
                            //                                 colors: [
                            //                                   kgradientYellow,
                            //                                   kgolder2
                            //                                 ]),
                            //                             border: Border.all(
                            //                               color: kgolder,
                            //                               width: 2,
                            //                             ),
                            //                           ),
                            //                           child: TextFormField(
                            //                             controller: _reasonController,
                            //                             decoration: InputDecoration(
                            //                                 filled: true,
                            //                                 fillColor: Colors.transparent,
                            //                                 enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                            //                             ),
                            //
                            //                           ),
                            //                         ),
                            //                         SizedBox(height: 15),
                            //                         Row(
                            //                           mainAxisAlignment:
                            //                           MainAxisAlignment.end,
                            //                           children: [
                            //                             InkWell(
                            //                               onTap:() async {
                            //                                 if (_reasonController.text.isNotEmpty ) {
                            //                                   setStateDialog(() {
                            //                                     isLoadingReject = true;
                            //                                   });
                            //                                   var result = await _allApi.rejectService(
                            //                                     refId: servicesModel.refid,
                            //                                     certificateName:
                            //                                     servicesModel.serviceid,
                            //                                     reason: _reasonController.text,
                            //                                   );
                            //                                   setStateDialog(() {
                            //                                     isLoadingReject = false;
                            //                                   });
                            //                                   Navigator.of(context).pop();
                            //
                            //                                   if (result == 'rejected') {
                            //                                     ScaffoldMessenger.of(context).showSnackBar(
                            //                                       const SnackBar(
                            //                                         content: Text('Request Rejected'),
                            //                                       ),
                            //                                     );
                            //                                   } else {
                            //                                     ScaffoldMessenger.of(context).showSnackBar(
                            //                                       const SnackBar(
                            //                                         content: Text(
                            //                                           'Failed to reject request.',
                            //                                         ),
                            //                                       ),
                            //                                     );
                            //                                   }
                            //                                   setState(() {});
                            //                                 } else {
                            //                                   Fluttertoast.showToast(
                            //                                     msg: 'Please write reason for rejection.',
                            //                                   );
                            //                                 }
                            //                               },
                            //                               child: Container(
                            //                                 height: 30,
                            //                                 decoration:
                            //                                 BoxDecoration(
                            //                                   borderRadius:
                            //                                   BorderRadius
                            //                                       .all(Radius
                            //                                       .circular(
                            //                                       10)),
                            //                                   color: kgolder,
                            //                                 ),
                            //                                 child: Padding(
                            //                                   padding:
                            //                                   EdgeInsets.only(
                            //                                       left: 8,
                            //                                       right: 8),
                            //                                   child: Center(
                            //                                       child: Text(
                            //                                         "Reject",
                            //                                         style: TextStyle(
                            //                                             color: kblack,
                            //                                             fontSize: 18),
                            //                                       )),
                            //                                 ),
                            //                               ),
                            //                             ),
                            //                             Container(
                            //                               height: 30,
                            //                               decoration:
                            //                               BoxDecoration(
                            //                                 borderRadius:
                            //                                 BorderRadius
                            //                                     .all(Radius
                            //                                     .circular(
                            //                                     10)),
                            //                               ),
                            //                               child: Padding(
                            //                                 padding:
                            //                                 EdgeInsets.only(
                            //                                     left: 8,
                            //                                     right: 8),
                            //                                 child: Center(
                            //                                     child: InkWell(
                            //                                         onTap: () {
                            //                                           Get.back();
                            //                                         },
                            //                                         child: Text(
                            //                                           "Cancel",
                            //                                           style: TextStyle(
                            //                                               color:
                            //                                               kgolder,
                            //                                               fontSize:
                            //                                               18),
                            //                                         ))),
                            //                               ),
                            //                             ),
                            //                           ],
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ),
                            //                 ),
                            //               );
                            //             }
                            //         ),
                            //         radius: 50);
                            //   },
                            //   child: Container(
                            //     height: 30,
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.all(
                            //             Radius.circular(10)),
                            //         color: kGray2,
                            //         border: Border.all(
                            //           color: kblack,
                            //           width: 2,
                            //         )),
                            //     child: Padding(
                            //       padding: EdgeInsets.only(
                            //           left: 8, right: 8),
                            //       child: Center(
                            //           child: Text(
                            //             "Reject",
                            //             style: TextStyle(
                            //                 color: kgolder, fontSize: 18),
                            //           )),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            ///PdfView
                            /* _pdfLoading ? kprogressbar :   InkWell(
                              onTap: () async {
                                setState(() {
                                  _pdfLoading = true;
                                });
                                if (servicesModel.fileName != null) {
                                  var file = await _allApi.loadFile(
                                    url:
                                    'http://faizeetech.com/pdf/${servicesModel.fileName}',
                                    fileName: servicesModel.fileName,
                                  );
                                  await OpenFile.open(file.path);
                                  setState(() {
                                    _pdfLoading = false;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        '''
            File isn't available. Wait for the HR to send the file.''',
                                      ),
                                    ),
                                  );
                                }
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
                                        "View",
                                        style: TextStyle(
                                            color: kgolder, fontSize: 18),
                                      )),
                                ),
                              ),
                            ),*/
                            ///PdfView
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

  rejectedCard(ServicesModel servicesModel) {
    return FutureBuilder<UserModel>(
        future: _allApi.getUser(servicesModel.refid!),
        builder: (context, userSnap) {
          if(!userSnap.hasData){
            return SizedBox();
          }

          var userData = userSnap.requireData;

          return Padding(
            padding: EdgeInsets.all(10),
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
                                servicesModel.empname!,
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
                              "Certificate Name: ",
                              style: TextStyle(
                                  color: kblack,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              servicesModel.certificateName!,
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
                              "Email id:",
                              style: TextStyle(
                                  color: kblack,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              userData.email!,
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
                              "Date:",
                              style: TextStyle(
                                  color: kblack,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              servicesModel.date!,
                              style: TextStyle(
                                  color: kblack,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                                "Reason: ",
                                style:
                                TextStyle(color: kblack, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                servicesModel.reason ?? '',
                                style:
                                TextStyle(color: kblack, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     InkWell(
                        //       onTap: () {
                        //         bool    isLoadingApproved = false;
                        //         Get.defaultDialog(
                        //             title: "",
                        //             titleStyle:
                        //             TextStyle(color: kgolder),
                        //             titlePadding: EdgeInsets.only(
                        //                 right: 100, top: 5),
                        //             backgroundColor: Colors.transparent,
                        //             content: StatefulBuilder(
                        //                 builder: (context, setStateDialog) {
                        //                   return Container(
                        //                     width: Get.width,
                        //                     decoration: BoxDecoration(
                        //                       borderRadius: BorderRadius.all(
                        //                           Radius.circular(8)),
                        //                       gradient: LinearGradient(
                        //                           colors: [kGray3, kblack]),
                        //                       border: Border.all(
                        //                         color: kgolder,
                        //                         width: 2,
                        //                       ),
                        //                     ),
                        //                     child: Padding(
                        //                       padding: EdgeInsets.all(10),
                        //                       child: SingleChildScrollView(
                        //                         child: Column(
                        //                           children: [
                        //                             Row(
                        //                               mainAxisAlignment:
                        //                               MainAxisAlignment
                        //                                   .start,
                        //                               children: [
                        //                                 Column(
                        //                                   crossAxisAlignment:
                        //                                   CrossAxisAlignment
                        //                                       .start,
                        //                                   children: [
                        //                                     Text(
                        //                                       userData.name!,
                        //                                       style: TextStyle(
                        //                                           color:
                        //                                           kgolder),
                        //                                     ),
                        //                                     SizedBox(
                        //                                         height: 15),
                        //                                     Text(
                        //                                       "Emp ID: ${userData.empId}",
                        //                                       style: TextStyle(
                        //                                           color:
                        //                                           kgolder),
                        //                                     ),
                        //                                     Text(
                        //                                       "Designation: ${userData.designation}",
                        //                                       style: TextStyle(
                        //                                           color:
                        //                                           kgolder),
                        //                                     ),
                        //                                     Text(
                        //                                       "Phone: ${userData.phoneNumber}",
                        //                                       style: TextStyle(
                        //                                           color:
                        //                                           kgolder),
                        //                                     ),
                        //                                     Text(
                        //                                       "Email : ${userData.email}",
                        //                                       style: TextStyle(
                        //                                           color:
                        //                                           kgolder),
                        //                                     ),
                        //                                     SizedBox(
                        //                                         height: 15),
                        //                                     Container(
                        //                                       width: 150,
                        //                                       child: Text(
                        //                                         "Request Details: ${servicesModel.certificateName}",
                        //                                         style: TextStyle(
                        //                                             color:
                        //                                             kgolder),
                        //                                       ),
                        //                                     ),
                        //                                   ],
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                             SizedBox(height: 15),
                        //                             isLoadingApproved ? kprogressbar :  Row(
                        //                               mainAxisAlignment:
                        //                               MainAxisAlignment
                        //                                   .end,
                        //                               children: [
                        //                                 InkWell(
                        //                                   onTap:() async {
                        //                                     setStateDialog(() {
                        //                                       isLoadingApproved = true;
                        //                                     });
                        //                                     var result = await _allApi.approveService(
                        //                                       refId: servicesModel.refid!,
                        //                                       certificateName:
                        //                                       servicesModel.certificateName,
                        //                                     );
                        //                                     setStateDialog(() {
                        //                                       isLoadingApproved = false;
                        //                                     });
                        //                                     Navigator.of(context).pop();
                        //
                        //                                     if (result == 'approved') {
                        //                                       ScaffoldMessenger.of(context).showSnackBar(
                        //                                         const SnackBar(
                        //                                           content: Text('Request Approved'),
                        //                                         ),
                        //                                       );
                        //                                     } else {
                        //                                       ScaffoldMessenger.of(context).showSnackBar(
                        //                                         const SnackBar(
                        //                                           content: Text(
                        //                                             'Failed to approve request.',
                        //                                           ),
                        //                                         ),
                        //                                       );
                        //                                     }
                        //                                     setState(() {});
                        //                                   },
                        //                                   child: Container(
                        //                                     height: 30,
                        //                                     decoration:
                        //                                     BoxDecoration(
                        //                                       borderRadius: BorderRadius
                        //                                           .all(Radius
                        //                                           .circular(
                        //                                           10)),
                        //                                       color: kgolder,
                        //                                     ),
                        //                                     child: Padding(
                        //                                       padding: EdgeInsets
                        //                                           .only(
                        //                                           left: 8,
                        //                                           right: 8),
                        //                                       child: Center(
                        //                                           child: Text(
                        //                                             "Approve",
                        //                                             style: TextStyle(
                        //                                                 color:
                        //                                                 kblack,
                        //                                                 fontSize:
                        //                                                 18),
                        //                                           )),
                        //                                     ),
                        //                                   ),
                        //                                 ),
                        //                                 Padding(
                        //                                   padding:
                        //                                   EdgeInsets.only(
                        //                                       left: 8,
                        //                                       right: 8),
                        //                                   child: Center(
                        //                                       child: InkWell(
                        //                                           onTap: () {
                        //                                             Get.back();
                        //                                           },
                        //                                           child: Text(
                        //                                             "Cancel",
                        //                                             style: TextStyle(
                        //                                                 color:
                        //                                                 kgolder,
                        //                                                 fontSize:
                        //                                                 18),
                        //                                           ))),
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                           ],
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   );
                        //                 }
                        //             ),
                        //             radius: 50);
                        //       },
                        //       child: Container(
                        //         height: 30,
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.all(
                        //                 Radius.circular(10)),
                        //             color: kGray2,
                        //             border: Border.all(
                        //               color: kblack,
                        //               width: 2,
                        //             )),
                        //         child: Padding(
                        //           padding: EdgeInsets.only(
                        //               left: 8, right: 8),
                        //           child: Center(
                        //               child: Text(
                        //                 "Approve",
                        //                 style: TextStyle(
                        //                     color: kgolder, fontSize: 18),
                        //               )),
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     InkWell(
                        //       onTap: () {
                        //         bool isLoadingReject = false;
                        //         Get.defaultDialog(
                        //             title: "",
                        //             titleStyle:
                        //             TextStyle(color: kgolder),
                        //             titlePadding: EdgeInsets.only(
                        //                 right: 100, top: 5),
                        //             backgroundColor: Colors.transparent,
                        //             content: StatefulBuilder(
                        //                 builder: (context, setStateDialog) {
                        //                   return Container(
                        //                     height: Get.height*0.7,
                        //                     width: Get.width,
                        //                     decoration: BoxDecoration(
                        //                       borderRadius: BorderRadius.all(
                        //                           Radius.circular(8)),
                        //                       gradient: LinearGradient(
                        //                           colors: [kGray3, kblack]),
                        //                       border: Border.all(
                        //                         color: kgolder,
                        //                         width: 2,
                        //                       ),
                        //                     ),
                        //                     child: Padding(
                        //                       padding: EdgeInsets.all(10),
                        //                       child: SingleChildScrollView(
                        //                         child: Column(
                        //                           children: [
                        //                             Row(
                        //                               mainAxisAlignment:
                        //                               MainAxisAlignment
                        //                                   .start,
                        //                               children: [
                        //                                 SingleChildScrollView(
                        //                                   child: Column(
                        //                                     crossAxisAlignment:
                        //                                     CrossAxisAlignment
                        //                                         .start,
                        //                                     children: [
                        //                                       Text(
                        //                                         servicesModel.empname!,
                        //                                         style: TextStyle(
                        //                                             color:
                        //                                             kgolder),
                        //                                       ),
                        //                                       SizedBox(
                        //                                           height: 15),
                        //                                       Text(
                        //                                         "Emp ID: ${userData.empId}",
                        //                                         style: TextStyle(
                        //                                             color:
                        //                                             kgolder),
                        //                                       ),
                        //                                       Text(
                        //                                         "Designation: ${userData.designation}",
                        //                                         style: TextStyle(
                        //                                             color:
                        //                                             kgolder),
                        //                                       ),
                        //                                       Text(
                        //                                         "Phone: ${userData.phoneNumber}",
                        //                                         style: TextStyle(
                        //                                             color:
                        //                                             kgolder),
                        //                                       ),
                        //                                       Text(
                        //                                         "Email : ${userData.email}",
                        //                                         style: TextStyle(
                        //                                             color:
                        //                                             kgolder),
                        //                                       ),
                        //                                       SizedBox(
                        //                                           height: 15),
                        //                                       Container(
                        //                                         width: 150,
                        //                                         child: Text(
                        //                                           "Request Details: ${servicesModel.certificateName}",
                        //                                           style: TextStyle(
                        //                                               color:
                        //                                               kgolder),
                        //                                         ),
                        //                                       ),
                        //                                     ],
                        //                                   ),
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                             SizedBox(height: 15),
                        //                             Container(
                        //                               width: Get.width,
                        //                               decoration: BoxDecoration(
                        //                                 borderRadius:
                        //                                 BorderRadius.all(
                        //                                     Radius.circular(
                        //                                         8)),
                        //                                 gradient:
                        //                                 LinearGradient(
                        //                                     colors: [
                        //                                       kgradientYellow,
                        //                                       kgolder2
                        //                                     ]),
                        //                                 border: Border.all(
                        //                                   color: kgolder,
                        //                                   width: 2,
                        //                                 ),
                        //                               ),
                        //                               child: TextFormField(
                        //                                 controller: _reasonController,
                        //                                 decoration: InputDecoration(
                        //                                     filled: true,
                        //                                     fillColor: Colors.transparent,
                        //                                     enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                        //                                 ),
                        //
                        //                               ),
                        //                             ),
                        //                             SizedBox(height: 15),
                        //                             Row(
                        //                               mainAxisAlignment:
                        //                               MainAxisAlignment.end,
                        //                               children: [
                        //                                 InkWell(
                        //                                   onTap:() async {
                        //                                     if (_reasonController.text.isNotEmpty ) {
                        //                                       setStateDialog(() {
                        //                                         isLoadingReject = true;
                        //                                       });
                        //                                       var result = await _allApi.rejectService(
                        //                                         refId: servicesModel.refid,
                        //                                         certificateName:
                        //                                         servicesModel.serviceid,
                        //                                         reason: _reasonController.text,
                        //                                       );
                        //                                       setStateDialog(() {
                        //                                         isLoadingReject = false;
                        //                                       });
                        //                                       Navigator.of(context).pop();
                        //
                        //                                       if (result == 'rejected') {
                        //                                         ScaffoldMessenger.of(context).showSnackBar(
                        //                                           const SnackBar(
                        //                                             content: Text('Request Rejected'),
                        //                                           ),
                        //                                         );
                        //                                       } else {
                        //                                         ScaffoldMessenger.of(context).showSnackBar(
                        //                                           const SnackBar(
                        //                                             content: Text(
                        //                                               'Failed to reject request.',
                        //                                             ),
                        //                                           ),
                        //                                         );
                        //                                       }
                        //                                       setState(() {});
                        //                                     } else {
                        //                                       Fluttertoast.showToast(
                        //                                         msg: 'Please write reason for rejection.',
                        //                                       );
                        //                                     }
                        //                                   },
                        //                                   child: Container(
                        //                                     height: 30,
                        //                                     decoration:
                        //                                     BoxDecoration(
                        //                                       borderRadius:
                        //                                       BorderRadius
                        //                                           .all(Radius
                        //                                           .circular(
                        //                                           10)),
                        //                                       color: kgolder,
                        //                                     ),
                        //                                     child: Padding(
                        //                                       padding:
                        //                                       EdgeInsets.only(
                        //                                           left: 8,
                        //                                           right: 8),
                        //                                       child: Center(
                        //                                           child: Text(
                        //                                             "Reject",
                        //                                             style: TextStyle(
                        //                                                 color: kblack,
                        //                                                 fontSize: 18),
                        //                                           )),
                        //                                     ),
                        //                                   ),
                        //                                 ),
                        //                                 Container(
                        //                                   height: 30,
                        //                                   decoration:
                        //                                   BoxDecoration(
                        //                                     borderRadius:
                        //                                     BorderRadius
                        //                                         .all(Radius
                        //                                         .circular(
                        //                                         10)),
                        //                                   ),
                        //                                   child: Padding(
                        //                                     padding:
                        //                                     EdgeInsets.only(
                        //                                         left: 8,
                        //                                         right: 8),
                        //                                     child: Center(
                        //                                         child: InkWell(
                        //                                             onTap: () {
                        //                                               Get.back();
                        //                                             },
                        //                                             child: Text(
                        //                                               "Cancel",
                        //                                               style: TextStyle(
                        //                                                   color:
                        //                                                   kgolder,
                        //                                                   fontSize:
                        //                                                   18),
                        //                                             ))),
                        //                                   ),
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                           ],
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   );
                        //                 }
                        //             ),
                        //             radius: 50);
                        //       },
                        //       child: Container(
                        //         height: 30,
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.all(
                        //                 Radius.circular(10)),
                        //             color: kGray2,
                        //             border: Border.all(
                        //               color: kblack,
                        //               width: 2,
                        //             )),
                        //         child: Padding(
                        //           padding: EdgeInsets.only(
                        //               left: 8, right: 8),
                        //           child: Center(
                        //               child: Text(
                        //                 "Reject",
                        //                 style: TextStyle(
                        //                     color: kgolder, fontSize: 18),
                        //               )),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // )
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
