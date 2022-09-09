import 'package:demo_nikita/Components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

import '../Components/api.dart';
import '../Components/models.dart';

class Services extends StatefulWidget {
  final UserModel? userModel;

  const Services({Key? key, this.userModel}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  TextEditingController services = TextEditingController();
  TextEditingController request = TextEditingController();
  TextEditingController moreRequest = TextEditingController();

  final _allApi = AllApi();

  final _services = [
    'Certificate with detailed salary',
    'Certificate with total salary',
    'Certificate without salary',
  ];

  var _isOpening = false;

  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: kgolder,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: kblack
                // gradient: LinearGradient(
                //     begin: Alignment.topLeft,
                //     end: Alignment.bottomRight,
                //     colors: [
                //       kblack,
                //       kGray
                //     ]
                // )
            ),
          ),

          title: Container(margin:EdgeInsets.only(left: 15),child: Text("Services",style: TextStyle(color: kgolder),)),
          titleSpacing: 5,
          shadowColor: Colors.transparent,

        ),
        body: Column(
          children: [
            Stack(
            children: [Container(
              height: H*0.07,
              width: W,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg.jpg"),
                  fit: BoxFit.cover
                )
              ),
            ),
              Container(
                height: 48,
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
                      bottomLeft: Radius.circular(18),
                      bottomRight:  Radius.circular(18)
                  ),
                ),
                child: TabBar(
                  labelColor: Colors.black,
                  indicator: BoxDecoration(
                      color: kgolder,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kblack,width: 1)
                  ),
                  unselectedLabelColor: kgolder,
                  tabs: [
                    Text("Services",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.bold),),
                    Text("Requests",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight:FontWeight.bold),),
                    Text("More Requests",style: TextStyle(fontSize: 16,fontFamily:'Typo Round',fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ],
          ),

            Expanded(
              child: TabBarView(
                  children: [
                   Container(
                     height: H,
                     width: W,
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: AssetImage("assets/bg.jpg"),
                         fit: BoxFit.cover
                       )
                     ),
                     child: ListView.builder(
                       itemCount: _services.length,
                       itemBuilder: (BuildContext context, int index) {

                       return AnimationConfiguration.staggeredList(
                         position: index,
                             duration: const Duration(milliseconds: 700),
                             child: SlideAnimation(
                               duration: Duration(milliseconds: 500),
                               horizontalOffset: 200.0,
                               child: FadeInAnimation(
                                 child: buildCertificate(H, W,_services[index]),
                               ),
                             ),
                       );
                        
                       },

                     ),
                   ),
                DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      appBar: AppBar(
                        automaticallyImplyLeading: false,
                        shadowColor: Colors.transparent,
                        flexibleSpace: Stack(
                          children: [
                            Container(
                              height: H*0.5,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/bg.jpg"),
                                  fit: BoxFit.cover
                                ),

                              ),

                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              height: 50,
                              decoration: BoxDecoration(
                                  color: kgolder,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)
                                  ),
                                  border: Border.all(color: kblack,width: 1)
                              ),
                              child: TabBar(
                                padding: EdgeInsets.all(2),
                                labelColor: kgolder,
                                indicator: BoxDecoration(
                                  color: kGray2,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                unselectedLabelColor: kblack,
                                tabs: [
                                  Text("Pending",style: TextStyle(fontSize: 16,fontFamily:'Typo Round',fontWeight: FontWeight.bold),),
                                  Text("Accepted",style: TextStyle(fontSize: 16,fontFamily:'Typo Round',fontWeight: FontWeight.bold),),
                                  Text("Rejected",style: TextStyle(fontSize: 16,fontFamily:'Typo Round',fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                          ],
                        )
                      ),
                      body:TabBarView(
                        children: [
                          FutureBuilder<List<ServicesModel>?>(
                              future: _allApi.getServices(
                                verify: '0',
                                companyId: widget.userModel!.companyId,
                                refId: widget.userModel!.refId,
                              ),
                            builder: (context, snapshot) {

                                if(!snapshot.hasData){
                                  return kprogressbarFull;
                                }


                                var list = snapshot.data as List<ServicesModel>;

                              return Container(
                                height: H,
                                width: W,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/bg.jpg"),
                                        fit: BoxFit.cover
                                    )
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: list.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return AnimationConfiguration.staggeredList(
                                            position: index,
                                            duration: const Duration(milliseconds: 700),
                                            child: SlideAnimation(
                                              duration: Duration(milliseconds: 500),
                                              horizontalOffset: 200.0,
                                              child: FadeInAnimation(
                                                child: buildCertificateName( list: list,
                                                  index: index,
                                                  onPressedView: () {
                                                    _onPressedView(
                                                      list: list,
                                                      index: index,
                                                    );
                                                  },),
                                              ),
                                            ),
                                          );

                                        },

                                      ),
                                    ),
                                    SizedBox(height: 80,)
                                  ],
                                ),
                              );
                            }
                          ),

                          FutureBuilder<List<ServicesModel>?>(
                              future: _allApi.getServices(
                                verify: '1',
                                companyId: widget.userModel!.companyId,
                                refId: widget.userModel!.refId,
                              ),
                              builder: (context, snapshot) {

                                if(!snapshot.hasData){
                                  return kprogressbarFull;
                                }


                                var list = snapshot.data as List<ServicesModel>;

                                return Container(
                                  height: H,
                                  width: W,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("assets/bg.jpg"),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: list.length,
                                          itemBuilder: (BuildContext context, int index) {

                                            return AnimationConfiguration.staggeredList(
                                              position: index,
                                              duration: const Duration(milliseconds: 700),
                                              child: SlideAnimation(
                                                duration: Duration(milliseconds: 500),
                                                horizontalOffset: 200.0,
                                                child: FadeInAnimation(
                                                  child: buildCertificateNameAccepted( list: list,
                                                    index: index,
                                                    onPressedView: () {
                                                      _onPressedView(
                                                        list: list,
                                                        index: index,
                                                      );
                                                    },),
                                                ),
                                              ),
                                            );

                                          },

                                        ),
                                      ),
                                      SizedBox(height: 80,)
                                    ],
                                  ),
                                );
                              }
                          ),

                          FutureBuilder<List<ServicesModel>?>(
                              future: _allApi.getServices(
                                verify: '-1',
                                companyId: widget.userModel!.companyId,
                                refId: widget.userModel!.refId,
                              ),
                              builder: (context, snapshot) {

                                if(!snapshot.hasData){
                                  return kprogressbarFull;
                                }


                                var list = snapshot.data as List<ServicesModel>;

                                return Container(
                                  height: H,
                                  width: W,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("assets/bg.jpg"),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: list.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return AnimationConfiguration.staggeredList(
                                              position: index,
                                              duration: const Duration(milliseconds: 700),
                                              child: SlideAnimation(
                                                duration: Duration(milliseconds: 500),
                                                horizontalOffset: 200.0,
                                                child: FadeInAnimation(
                                                  child: buildCertificateReject( list: list,
                                                    index: index,
                                                    onPressedView: () {
                                                      _onPressedView(
                                                        list: list,
                                                        index: index,
                                                      );
                                                    },),
                                                ),
                                              ),
                                            );

                                          },

                                        ),
                                      ),
                                      SizedBox(height: 80,)
                                    ],
                                  ),
                                );
                              }
                          ),
                        ],
                      )
                    )),
                    DefaultTabController(
                        length: 3,
                        child: Scaffold(
                            appBar: AppBar(
                              automaticallyImplyLeading: false,
                                shadowColor: Colors.transparent,
                                flexibleSpace: Stack(
                                  children: [
                                    Container(
                                      height: H*0.5,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage("assets/bg.jpg"),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(8),
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: kgolder,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)
                                          ),
                                          border: Border.all(color: kblack,width: 2)
                                      ),
                                      child: TabBar(
                                        padding: EdgeInsets.all(2),
                                        labelColor: kgolder,
                                        indicator: BoxDecoration(
                                          color: kGray3,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        unselectedLabelColor: kblack,
                                        tabs: [
                                          Text("Pending",style: TextStyle(fontSize: 16,fontFamily:'Typo Round',fontWeight: FontWeight.bold),),
                                          Text("Accepted",style: TextStyle(fontSize: 16,fontFamily:'Typo Round',fontWeight: FontWeight.bold),),
                                          Text("Rejected",style: TextStyle(fontSize: 16,fontFamily:'Typo Round',fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            body:TabBarView(
                              children: [
                                FutureBuilder<List<DynamicServiceRequestModel>?>(
                                    future: _allApi.getDynamicServiceRequest(
                                      verify: '0',
                                      companyId: widget.userModel!.companyId,
                                      refId: widget.userModel!.refId,
                                    ),
                                    builder: (context, snapshot) {

                                      if(!snapshot.hasData){
                                        return kprogressbarFull;
                                      }


                                      var list = snapshot.data as List<DynamicServiceRequestModel>;

                                      return Container(
                                        height: H,
                                        width: W,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage("assets/bg.jpg"),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: ListView.builder(
                                                itemCount: list.length,
                                                itemBuilder: (BuildContext context, int index) {

                                                  return AnimationConfiguration.staggeredList(
                                                    position: index,
                                                    duration: const Duration(milliseconds: 700),
                                                    child: SlideAnimation(
                                                      duration: Duration(milliseconds: 500),
                                                      horizontalOffset: 200.0,
                                                      child: FadeInAnimation(
                                                        child: buildCertificateMoreRequest( list: list,
                                                          index: index,
                                                          onPressedView: () async {
                                                            setState(() {
                                                              _isOpening = true;
                                                            });
                                                            var file = await _allApi.loadFile(
                                                              url:
                                                              'http://faizeetech.com/pdf/${list[index].fileName}',
                                                              fileName: list[index].fileName,
                                                            );
                                                            await OpenFile.open(file.path);
                                                            setState(() {
                                                              _isOpening = false;
                                                            });
                                                          },),
                                                      ),
                                                    ),
                                                  );

                                                },

                                              ),
                                            ),
                                            SizedBox(height: 80,)
                                          ],
                                        ),
                                      );
                                    }
                                ),

                                FutureBuilder<List<DynamicServiceRequestModel>?>(
                                    future: _allApi.getDynamicServiceRequest(
                                      verify: '1',
                                      companyId: widget.userModel!.companyId,
                                      refId: widget.userModel!.refId,
                                    ),
                                    builder: (context, snapshot) {

                                      if(!snapshot.hasData){
                                        return kprogressbarFull;
                                      }


                                      var list = snapshot.data as List<DynamicServiceRequestModel>;

                                      return Container(
                                        height: H,
                                        width: W,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage("assets/bg.jpg"),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: ListView.builder(
                                                itemCount: list.length,
                                                itemBuilder: (BuildContext context, int index) {

                                                  return AnimationConfiguration.staggeredList(
                                                    position: index,
                                                    duration: const Duration(milliseconds: 700),
                                                    child: SlideAnimation(
                                                      duration: Duration(milliseconds: 500),
                                                      horizontalOffset: 200.0,
                                                      child: FadeInAnimation(
                                                        child: buildCertificateMoreRequest( list: list,
                                                          index: index,
                                                          onPressedView: () async {
                                                            setState(() {
                                                              _isOpening = true;
                                                            });
                                                            var file = await _allApi.loadFile(
                                                              url:
                                                              'http://faizeetech.com/pdf/${list[index].fileName}',
                                                              fileName: list[index].fileName,
                                                            );
                                                            await OpenFile.open(file.path);
                                                            setState(() {
                                                              _isOpening = false;
                                                            });
                                                          },),
                                                      ),
                                                    ),
                                                  );
                                                  

                                                },

                                              ),
                                            ),
                                            SizedBox(height: 80,)
                                          ],
                                        ),
                                      );
                                    }
                                ),

                                FutureBuilder<List<DynamicServiceRequestModel>?>(
                                    future: _allApi.getDynamicServiceRequest(
                                      verify: '-1',
                                      companyId: widget.userModel!.companyId,
                                      refId: widget.userModel!.refId,
                                    ),
                                    builder: (context, snapshot) {

                                      if(!snapshot.hasData){
                                        return kprogressbarFull;
                                      }


                                      var list = snapshot.data as List<DynamicServiceRequestModel>;

                                      return Container(
                                        height: H,
                                        width: W,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage("assets/bg.jpg"),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: ListView.builder(
                                                itemCount: list.length,
                                                itemBuilder: (BuildContext context, int index) {
                                                  return AnimationConfiguration.staggeredList(
                                                    position: index,
                                                    duration: const Duration(milliseconds: 700),
                                                    child: SlideAnimation(
                                                      duration: Duration(milliseconds: 500),
                                                      horizontalOffset: 200.0,
                                                      child: FadeInAnimation(
                                                        child: buildCertificateMoreRequest( list: list,
                                                          index: index,
                                                          onPressedView: () async {
                                                            setState(() {
                                                              _isOpening = true;
                                                            });
                                                            var file = await _allApi.loadFile(
                                                              url:
                                                              'http://faizeetech.com/pdf/${list[index].fileName}',
                                                              fileName: list[index].fileName,
                                                            );
                                                            await OpenFile.open(file.path);
                                                            setState(() {
                                                              _isOpening = false;
                                                            });
                                                          },),
                                                      ),
                                                    ),
                                                  );

                                                },

                                              ),
                                            ),
                                            SizedBox(height: 80,)
                                          ],
                                        ),
                                      );
                                    }
                                ),
                              ],
                            )
                        )),
              ]),
            )
          ],
        )
      ),
    );
  }

  void _onPressedView({
    required List<ServicesModel> list,
    required int index,
  }) async {
    if (list[index].fileName != null) {
      var file = await _allApi.loadFile(
        url: 'http://faizeetech.com/pdf/${list[index].fileName}',
        fileName: list[index].fileName,
      );
      OpenFile.open(file.path);
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
  }

  Container buildCertificateName(
  {
    required List<ServicesModel> list,
    required int index,
    required Function onPressedView,
}
      ) {
    return Container(
                                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      kGray,
                                      kblack
                                    ]
                                  ),
                                  borderRadius:BorderRadius.circular(10),
                                  border: Border.all(color: kgolder,width: 3)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: Get.width - 50,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Certificate Name:",style: TextStyle(color: kgolder),),
                                              Text("${list[index].certificateName}",style: TextStyle(color: kgolder),),
                                            ],
                                          ),
                                        ),
                                        Text(''),
                                        Container(
                                          width: Get.width - 50,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Date:",style: TextStyle(color: kgolder)),
                                              Text("${list[index].date}",style: TextStyle(color: kgolder)),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        // Container(
                                        //   width: Get.width - 50,
                                        //   child: Row(
                                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //     children: [
                                        //       Text("Status:",style: TextStyle(color: kgolder)),
                                        //       Text("${list[index].verify == '1'
                                        //           ? 'Accepted'
                                        //           : list[index].verify == '0'
                                        //           ? list[index].fileName == null
                                        //           ? 'Pending from HR'
                                        //           : 'Pending from Manager'
                                        //           : 'Rejected'}",style: TextStyle(color: kgolder)),
                                        //
                                        //     ],
                                        //   ),
                                        // ),

                                      ],
                                    ),
                                    if (list[index].verify == '1')
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: ElevatedButton(
                                          child: const Text('View',style: TextStyle(color:Colors.black),),
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(
                                              kgolder,
                                            ),
                                            shape: MaterialStateProperty.all(
                                              const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(12.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          onPressed:  () {
                                            _onPressedView(
                                              list: list,
                                              index: index,
                                            );
                                          },
                                        ),
                                      ),
                                    // Column(
                                    //   crossAxisAlignment: CrossAxisAlignment.end,
                                    //
                                    //   children: [
                                    //     Text("Certificate With",style: TextStyle(color: kgolder)),
                                    //     Text("Detail Salary",style: TextStyle(color: kgolder)),
                                    //     Text("${list[index].date}",style: TextStyle(color: kgolder)),
                                    //     Text("Pending from HR",style: TextStyle(color: kgolder))
                                    //   ],
                                    // )
                                  ],
                                )
                              );
  }

  Container buildCertificateNameAccepted(
      {
        required List<ServicesModel> list,
        required int index,
        required Function onPressedView,
      }
      ) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kGray,
                  kblack
                ]
            ),
            borderRadius:BorderRadius.circular(10),
            border: Border.all(color: kgolder,width: 3)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Certificate Name:",style: TextStyle(color: kgolder),),
                    Text("${list[index].certificateName}",style: TextStyle(color: kgolder),),
                  ],
                ),
                Text(''),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Date:",style: TextStyle(color: kgolder)),
                    Text("${list[index].date}",style: TextStyle(color: kgolder)),
                  ],
                ),
                SizedBox(height: 10,),
                // Container(
                //   width: Get.width - 50,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text("Status:",style: TextStyle(color: kgolder)),
                //       Text("${list[index].verify == '1'
                //           ? 'Accepted'
                //           : list[index].verify == '0'
                //           ? list[index].fileName == null
                //           ? 'Pending from HR'
                //           : 'Pending from Manager'
                //           : 'Rejected'}",style: TextStyle(color: kgolder)),
                //
                //     ],
                //   ),
                // ),

              ],
            ),
            if (list[index].verify == '1')
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  child: const Text('View',style: TextStyle(color:Colors.black),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      kgolder,
                    ),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  onPressed:  () {
                    _onPressedView(
                      list: list,
                      index: index,
                    );
                  },
                ),
              ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //
            //   children: [
            //     Text("Certificate With",style: TextStyle(color: kgolder)),
            //     Text("Detail Salary",style: TextStyle(color: kgolder)),
            //     Text("${list[index].date}",style: TextStyle(color: kgolder)),
            //     Text("Pending from HR",style: TextStyle(color: kgolder))
            //   ],
            // )
          ],
        )
    );
  }


  Container buildCertificateMoreRequest({ required List<DynamicServiceRequestModel> list,
    required int index,
    required Function onPressedView,})  {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kGray,
                  kblack
                ]
            ),
            borderRadius:BorderRadius.circular(10),
            border: Border.all(color: kgolder,width: 3)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   children: [
                //     Text("Certificate Name:",style: TextStyle(color: kgolder),),
                //     Text("${list[index].certificateName}",style: TextStyle(color: kgolder),),
                //   ],
                // ),
                // Text(''),
                Container(
                  width: Get.width - 50,
                  child: Row(
                    children: [
                      Text("Date:",style: TextStyle(color: kgolder)),
                      Text("${list[index].date}",style: TextStyle(color: kgolder)),
                    ],
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text("Status:",style: TextStyle(color: kgolder)),
                //     Text("${list[index].verify == '1'
                //         ? 'Accepted'
                //         : list[index].verify == '0'
                //         ? list[index].fileName == null
                //         ? 'Pending from HR'
                //         : 'Pending from Manager'
                //         : 'Rejected'}",style: TextStyle(color: kgolder)),
                //   ],
                // ),
                if (list[index].verify == '1')
                  Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      child: const Text('View'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          kgolder,
                        ),
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                      onPressed:  () {
                        onPressedView;
                      },
                    ),
                  ),
              ],
            ),

            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //
            //   children: [
            //     Text("Certificate With",style: TextStyle(color: kgolder)),
            //     Text("Detail Salary",style: TextStyle(color: kgolder)),
            //     Text("${list[index].date}",style: TextStyle(color: kgolder)),
            //     Text("Pending from HR",style: TextStyle(color: kgolder))
            //   ],
            // )
          ],
        )
    );
  }

  Container buildCertificateReject(
      {
        required List<ServicesModel> list,
        required int index,
        required Function onPressedView,
      }
      ) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kGray,
                  kblack
                ]
            ),
            borderRadius:BorderRadius.circular(10),
            border: Border.all(color: kgolder,width: 3)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width - 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Certificate Name:",style: TextStyle(color: kgolder),),
                      Text("${list[index].certificateName}",style: TextStyle(color: kgolder),),
                    ],
                  ),
                ),
                Text(''),
                Container(
                  width: Get.width - 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Date:",style: TextStyle(color: kgolder)),
                      Text("${list[index].date}",style: TextStyle(color: kgolder)),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text("Status:",style: TextStyle(color: kgolder)),
                //     Text("${list[index].verify == '1'
                //         ? 'Accepted'
                //         : list[index].verify == '0'
                //         ? list[index].fileName == null
                //         ? 'Pending from HR'
                //         : 'Pending from Manager'
                //         : 'Rejected'}",style: TextStyle(color: kgolder)),
                //   ],
                // ),
                Container(
                  width: Get.width - 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Reason: ",style: TextStyle(color: kgolder)),
                      Container(
                          width: Get.width*0.6,
                          child: Text("sdfdsfdsdsfdsfdsfdsfnfkjdsnfjdsnfkjdsfkndskjndsjfndskjfdsfnkjdsnfkjdsnf}",style: TextStyle(color: kgolder))),
                    ],
                  ),
                )
              ],
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //
            //   children: [
            //     Text("Certificate With",style: TextStyle(color: kgolder)),
            //     Text("Detail Salary",style: TextStyle(color: kgolder)),
            //     Text("${list[index].date}",style: TextStyle(color: kgolder)),
            //     Text("Pending from HR",style: TextStyle(color: kgolder))
            //   ],
            // )
          ],
        )
    );
  }

  Container buildCertificate(double H, double W,name) {
    return Container(

                       width: double.infinity,
                       margin: EdgeInsets.symmetric(horizontal: W*.03,vertical: H*0.008),
                       padding: EdgeInsets.symmetric(vertical: 20),
                       decoration: BoxDecoration(
                         border: Border.all(color: kgolder,width: 3),
                         gradient: LinearGradient(
                           begin: Alignment.topRight,
                           end: Alignment.bottomLeft,
                           colors: [
                             kblack ,
                             kGray
                           ]
                         ),
                         borderRadius: BorderRadius.all(Radius.circular(8))
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Text(name,style: TextStyle(color: kgolder,fontSize: 16),),
                           Container(
                             height: 25,

                             child: ElevatedButton(
                                 onPressed: (){
                                  Get.defaultDialog(
                                    title: "Request for the service?",

                                    titlePadding: EdgeInsets.only(right: W*.1,top: H*0.03,left: W*0.04),
                                    contentPadding:EdgeInsets.only(right: W*.03,top: H*0.03,left: W*0.06) ,
                                    radius: 10,
                                    backgroundColor: kgolder,

                                    content: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Are you sure do you want to request for \nthe service?",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                        SizedBox(height: H*0.05,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap:(){
                                                _onPressedRequest(certificateName: name);
                                  },
                                              child: Container(
                                                padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),

                                               decoration: BoxDecoration(
                                                 color: kGray2,
                                                 borderRadius: BorderRadius.circular(15),
                                                 border: Border.all(color: kblack)
                                               ),
                                                child: Text("Request",style: TextStyle(
                                                    fontSize: 15,
                                                    color: kgolder),),

                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            InkWell(
                                                onTap:(){
                                     Get.back();
                                   },
                                                child: Text("Cancel",style: TextStyle(fontWeight: FontWeight.w500),))
                                          ],
                                        )
                                      ],

                                    )
                                  );
                                 },
                                 child: Text("Request",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                                style: ElevatedButton.styleFrom(
                                  primary: kgolder,
                                  onPrimary: kblack,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                ),
                             ),
                           )
                         ],
                       ),
                     );
  }

  Future<void> _onPressedRequest({required String certificateName}) async {


    var isLoading = false;

    var result = await _allApi.postServices(
        empName: widget.userModel!.name,
        companyId: widget.userModel!.companyId,
        date: DateFormat('yyyy-MM-dd').format(
          DateTime.now(),
        ),
        refId: widget.userModel!.refId,
        verify: '0',
        certificateName: certificateName.toLowerCase(),
        hr_refid: widget.userModel!.hrId,
        manager_refid: widget.userModel!.managerid);

    Navigator.of(context).pop();
    if (result == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Request sent successfully.'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to send request.'),
        ),
      );
    }
    // showDialog(
    //   barrierDismissible: false,
    //   context: context,
    //   builder: (context) {
    //     return StatefulBuilder(
    //       builder: (context, setStateDialog) {
    //         return AlertDialog(
    //           title: isLoading
    //               ? null
    //               : const Text(
    //             'Request for the service?',
    //           ),
    //           content: isLoading
    //               ? Container(
    //             height: MediaQuery.of(context).size.height * 0.05,
    //             alignment: Alignment.center,
    //             child: Row(
    //               children: const [
    //                 CircularProgressIndicator(),
    //                 SizedBox(
    //                   width: 30,
    //                 ),
    //                 Text('Please wait'),
    //               ],
    //             ),
    //           )
    //               : const Text(
    //             'Are you sure you want to request for the service?',
    //           ),
    //           actions: isLoading
    //               ? null
    //               : [
    //             TextButton(
    //               child: const Text('Request'),
    //               onPressed: () async {
    //                 setStateDialog(() {
    //                   isLoading = true;
    //                 });
    //                 var result = await _allApi.postServices(
    //                     empName: widget.userModel!.name,
    //                     companyId: widget.userModel!.companyId,
    //                     date: DateFormat('yyyy-MM-dd').format(
    //                       DateTime.now(),
    //                     ),
    //                     refId: widget.userModel!.refId,
    //                     verify: '0',
    //                     certificateName: certificateName.toLowerCase(),
    //                     hr_refid: widget.userModel!.hrId,
    //                     manager_refid: widget.userModel!.managerid);
    //                 setStateDialog(() {
    //                   isLoading = false;
    //                 });
    //                 Navigator.of(context).pop();
    //                 if (result == 'success') {
    //                   ScaffoldMessenger.of(context).showSnackBar(
    //                     const SnackBar(
    //                       content: Text('Request sent successfully.'),
    //                     ),
    //                   );
    //                 } else {
    //                   ScaffoldMessenger.of(context).showSnackBar(
    //                     const SnackBar(
    //                       content: Text('Failed to send request.'),
    //                     ),
    //                   );
    //                 }
    //               },
    //             ),
    //             TextButton(
    //               child: const Text('Cancel'),
    //               onPressed: () {
    //                 Navigator.of(context).pop();
    //               },
    //             ),
    //           ],
    //         );
    //       },
    //     );
    //   },
    // );
  }


}
