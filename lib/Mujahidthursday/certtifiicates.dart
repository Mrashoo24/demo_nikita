import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/constants.dart';

class Certtifiicates extends StatefulWidget {
  const Certtifiicates({Key? key}) : super(key: key);

  @override
  State<Certtifiicates> createState() => _CerttifiicatesState();
}

class _CerttifiicatesState extends State<Certtifiicates> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: kGray2,
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
          title:      Text("Certificates ",style: TextStyle(color: kblack,fontSize: 20,fontWeight: FontWeight.bold),),
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
                                            DefaultTabController(
                                                length: 1,
                                                child: Column(
                                                  children: [
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
                                                                        child: Text("Arsalan Khan",style: TextStyle(color: kgolder,fontSize:20),),
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
                                                                      Text("Certificate Name: ",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                      Text("Certificate with\nDetail Salary",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text("Email id:",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                      Text("arsalank28@gmail.com",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text("Date:",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                      Text("12/04/2022",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
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
                                                                                            Padding(
                                                                                              padding:  EdgeInsets.only(left: 8,right: 8),
                                                                                              child: Center(
                                                                                                  child: InkWell(
                                                                                                      onTap: () {
                                                                                                        Get.back();
                                                                                                      },
                                                                                                      child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),))),
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
                                                    ),
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
                                                                        child: Text("Arsalan Khan",style: TextStyle(color: kgolder,fontSize:20),),
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
                                                                      Text("Certificate Name: ",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                      Text("Certificate with\nDetail Salary",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text("Email id:",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                      Text("arsalank28@gmail.com",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text("Date:",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                      Text("12/04/2022",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
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
                                                                                                child: Center(child: InkWell(
                                                                                                    onTap: () {
                                                                                                      Get.back();
                                                                                                    },
                                                                                                    child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),))),
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
                                                                                              child: Center(child: InkWell(
                                                                                                  onTap: () {
                                                                                                    Get.back();
                                                                                                  },
                                                                                                  child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),))),
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
                                                    ),
                                                  ],
                                                )
                                            ),
                                            DefaultTabController(
                                                length: 1, child:Column(
                                              children: [
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
                                                                    child: Text("Arsalan Khan",style: TextStyle(color: kgolder,fontSize:20),),
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
                                                                  Text("Certificate Name: ",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                  Text("Certificate with\nDetail Salary",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("Email id:",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                  Text("arsalank28@gmail.com",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("Date:",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                  Text("12/04/2022",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                ],
                                                              ),
                                                              SizedBox(height: 15),

                                                              // Row(
                                                              //   mainAxisAlignment: MainAxisAlignment.end,
                                                              //   children: [
                                                              //     InkWell(
                                                              //       onTap: () {
                                                              //
                                                              //         Get.defaultDialog(
                                                              //             title: "",
                                                              //
                                                              //             titleStyle: TextStyle(color: kgolder),
                                                              //             titlePadding: EdgeInsets.only(right: 100,top: 5),
                                                              //             backgroundColor: Colors.transparent,
                                                              //
                                                              //             content: Container(
                                                              //               width: Get.width,
                                                              //               decoration: BoxDecoration(
                                                              //                 borderRadius: BorderRadius.all(Radius.circular(8)),
                                                              //                 gradient: LinearGradient(
                                                              //                     colors: [ kGray3,kblack]
                                                              //                 ),
                                                              //                 border: Border.all(
                                                              //                   color:kgolder,
                                                              //                   width: 2,
                                                              //                 ),
                                                              //               ),
                                                              //               child: Padding(
                                                              //                 padding:   EdgeInsets.all(10),
                                                              //                 child: SingleChildScrollView(
                                                              //                   child: Column(
                                                              //                     children: [
                                                              //                       Row(
                                                              //                         mainAxisAlignment: MainAxisAlignment.start,
                                                              //                         children: [
                                                              //                           Column(
                                                              //                             crossAxisAlignment: CrossAxisAlignment.start,
                                                              //                             children: [
                                                              //                               Text("Fahad Kharadi",style: TextStyle(color:kgolder ),),
                                                              //                               SizedBox(height: 15),
                                                              //                               Text("Emp ID: ",style: TextStyle(color:kgolder ),),
                                                              //                               Text("Designation: ",style: TextStyle(color:kgolder ),),
                                                              //                               Text("Phone: ",style: TextStyle(color:kgolder ),),
                                                              //                               Text("Email : ",style: TextStyle(color:kgolder ),),
                                                              //                               SizedBox(height: 15),
                                                              //                               Text("Request Details: \nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc",
                                                              //                                 style: TextStyle(color:kgolder ),),
                                                              //
                                                              //                             ],
                                                              //                           ),
                                                              //                         ],
                                                              //                       ),
                                                              //                       SizedBox(height: 15),
                                                              //                       Row(
                                                              //                         mainAxisAlignment: MainAxisAlignment.end,
                                                              //                         children: [
                                                              //                           Container(
                                                              //                             height: 30,
                                                              //                             decoration: BoxDecoration(
                                                              //                               borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //                               color: kgolder,
                                                              //
                                                              //                             ),
                                                              //                             child:Padding(
                                                              //                               padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //                               child: Center(child: Text("Approve",style: TextStyle(color: kblack,fontSize:18),)),
                                                              //                             ) ,
                                                              //                           ),
                                                              //                           Container(
                                                              //                             height: 30,
                                                              //                             decoration: BoxDecoration(
                                                              //                               borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //
                                                              //
                                                              //                             ),
                                                              //                             child:Padding(
                                                              //                               padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //                               child: Center(child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),)),
                                                              //                             ) ,
                                                              //                           ),
                                                              //                         ],
                                                              //                       ),
                                                              //                     ],
                                                              //                   ),
                                                              //                 ),
                                                              //               ),
                                                              //             ),
                                                              //             radius: 50
                                                              //         );
                                                              //       },
                                                              //       child: Container(
                                                              //         height: 30,
                                                              //         decoration: BoxDecoration(
                                                              //             borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //             color: kGray2,
                                                              //             border: Border.all(
                                                              //               color:kblack,
                                                              //               width: 2,
                                                              //             )
                                                              //         ),
                                                              //         child:Padding(
                                                              //           padding:   EdgeInsets.only(left: 8,right: 8),
                                                              //           child: Center(child: Text("Approve",style: TextStyle(color: kgolder,fontSize:18),)),
                                                              //         ) ,
                                                              //       ),
                                                              //     ),
                                                              //     SizedBox(width: 10,),
                                                              //     InkWell(
                                                              //       onTap: () {
                                                              //         Get.defaultDialog(
                                                              //             title: "",
                                                              //
                                                              //             titleStyle: TextStyle(color: kgolder),
                                                              //             titlePadding: EdgeInsets.only(right: 100,top: 5),
                                                              //             backgroundColor: Colors.transparent,
                                                              //
                                                              //             content: Container(
                                                              //               width: Get.width,
                                                              //               decoration: BoxDecoration(
                                                              //                 borderRadius: BorderRadius.all(Radius.circular(8)),
                                                              //                 gradient: LinearGradient(
                                                              //                     colors: [ kGray3,kblack]
                                                              //                 ),
                                                              //                 border: Border.all(
                                                              //                   color:kgolder,
                                                              //                   width: 2,
                                                              //                 ),
                                                              //               ),
                                                              //               child: Padding(
                                                              //                 padding:   EdgeInsets.all(10),
                                                              //                 child: Column(
                                                              //                   children: [
                                                              //                     Row(
                                                              //                       mainAxisAlignment: MainAxisAlignment.start,
                                                              //                       children: [
                                                              //                         Column(
                                                              //                           crossAxisAlignment: CrossAxisAlignment.start,
                                                              //                           children: [
                                                              //                             Text("Fahad Kharadi",style: TextStyle(color:kgolder ),),
                                                              //                             SizedBox(height: 15),
                                                              //                             Text("Emp ID: ",style: TextStyle(color:kgolder ),),
                                                              //                             Text("Designation: ",style: TextStyle(color:kgolder ),),
                                                              //                             Text("Phone: ",style: TextStyle(color:kgolder ),),
                                                              //                             Text("Email : ",style: TextStyle(color:kgolder ),),
                                                              //                             SizedBox(height: 15),
                                                              //                             Text("Request Details: \nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc",
                                                              //                               style: TextStyle(color:kgolder ),),
                                                              //
                                                              //                           ],
                                                              //                         ),
                                                              //                       ],
                                                              //                     ),
                                                              //                     SizedBox(height: 15),
                                                              //                     Container(
                                                              //                       width: Get.width,
                                                              //                       decoration: BoxDecoration(
                                                              //                         borderRadius: BorderRadius.all(Radius.circular(8)),
                                                              //                         gradient: LinearGradient(
                                                              //                             colors: [ kgradientYellow,kgolder2]
                                                              //                         ),
                                                              //                         border: Border.all(
                                                              //                           color:kgolder,
                                                              //                           width: 2,
                                                              //                         ),
                                                              //                       ),
                                                              //                       child: Padding(
                                                              //                         padding:   EdgeInsets.all(10.0),
                                                              //                         child: Text("Reason:\nLoremipsum dola sit \namet connector adsipising elit "),
                                                              //                       ),
                                                              //                     ),
                                                              //                     SizedBox(height: 15),
                                                              //                     Row(
                                                              //                       mainAxisAlignment: MainAxisAlignment.end,
                                                              //                       children: [
                                                              //                         Container(
                                                              //                           height: 30,
                                                              //                           decoration: BoxDecoration(
                                                              //                             borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //                             color: kgolder,
                                                              //
                                                              //                           ),
                                                              //                           child:Padding(
                                                              //                             padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //                             child: Center(child: Text("Reject",style: TextStyle(color: kblack,fontSize:18),)),
                                                              //                           ) ,
                                                              //                         ),
                                                              //                         Container(
                                                              //                           height: 30,
                                                              //                           decoration: BoxDecoration(
                                                              //                             borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //
                                                              //
                                                              //                           ),
                                                              //                           child:Padding(
                                                              //                             padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //                             child: Center(child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),)),
                                                              //                           ) ,
                                                              //                         ),
                                                              //                       ],
                                                              //                     ),
                                                              //                   ],
                                                              //                 ),
                                                              //               ),
                                                              //             ),
                                                              //             radius: 50
                                                              //         );
                                                              //       },
                                                              //       child: Container(
                                                              //         height: 30,
                                                              //         decoration: BoxDecoration(
                                                              //             borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //             color: kGray2,
                                                              //             border: Border.all(
                                                              //               color:kblack,
                                                              //               width: 2,
                                                              //             )
                                                              //         ),
                                                              //         child:Padding(
                                                              //           padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //           child: Center(child: Text("Reject",style: TextStyle(color: kgolder,fontSize:18),)),
                                                              //         ) ,
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
                                                ),
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
                                                                    child: Text("Arsalan Khan",style: TextStyle(color: kgolder,fontSize:20),),
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
                                                                  Text("Certificate Name: ",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                  Text("Certificate with\nDetail Salary",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("Email id:",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                  Text("arsalank28@gmail.com",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("Date:",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                  Text("12/04/2022",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                ],
                                                              ),
                                                              SizedBox(height: 15),

                                                              // Row(
                                                              //   mainAxisAlignment: MainAxisAlignment.end,
                                                              //   children: [
                                                              //     InkWell(
                                                              //       onTap: () {
                                                              //
                                                              //         Get.defaultDialog(
                                                              //             title: "",
                                                              //
                                                              //             titleStyle: TextStyle(color: kgolder),
                                                              //             titlePadding: EdgeInsets.only(right: 100,top: 5),
                                                              //             backgroundColor: Colors.transparent,
                                                              //
                                                              //             content: Container(
                                                              //               width: Get.width,
                                                              //               decoration: BoxDecoration(
                                                              //                 borderRadius: BorderRadius.all(Radius.circular(8)),
                                                              //                 gradient: LinearGradient(
                                                              //                     colors: [ kGray3,kblack]
                                                              //                 ),
                                                              //                 border: Border.all(
                                                              //                   color:kgolder,
                                                              //                   width: 2,
                                                              //                 ),
                                                              //               ),
                                                              //               child: Padding(
                                                              //                 padding:   EdgeInsets.all(10),
                                                              //                 child: SingleChildScrollView(
                                                              //                   child: Column(
                                                              //                     children: [
                                                              //                       Row(
                                                              //                         mainAxisAlignment: MainAxisAlignment.start,
                                                              //                         children: [
                                                              //                           Column(
                                                              //                             crossAxisAlignment: CrossAxisAlignment.start,
                                                              //                             children: [
                                                              //                               Text("Fahad Kharadi",style: TextStyle(color:kgolder ),),
                                                              //                               SizedBox(height: 15),
                                                              //                               Text("Emp ID: ",style: TextStyle(color:kgolder ),),
                                                              //                               Text("Designation: ",style: TextStyle(color:kgolder ),),
                                                              //                               Text("Phone: ",style: TextStyle(color:kgolder ),),
                                                              //                               Text("Email : ",style: TextStyle(color:kgolder ),),
                                                              //                               SizedBox(height: 15),
                                                              //                               Text("Request Details: \nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc",
                                                              //                                 style: TextStyle(color:kgolder ),),
                                                              //
                                                              //                             ],
                                                              //                           ),
                                                              //                         ],
                                                              //                       ),
                                                              //                       SizedBox(height: 15),
                                                              //                       Row(
                                                              //                         mainAxisAlignment: MainAxisAlignment.end,
                                                              //                         children: [
                                                              //                           Container(
                                                              //                             height: 30,
                                                              //                             decoration: BoxDecoration(
                                                              //                               borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //                               color: kgolder,
                                                              //
                                                              //                             ),
                                                              //                             child:Padding(
                                                              //                               padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //                               child: Center(child: Text("Approve",style: TextStyle(color: kblack,fontSize:18),)),
                                                              //                             ) ,
                                                              //                           ),
                                                              //                           Container(
                                                              //                             height: 30,
                                                              //                             decoration: BoxDecoration(
                                                              //                               borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //
                                                              //
                                                              //                             ),
                                                              //                             child:Padding(
                                                              //                               padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //                               child: Center(child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),)),
                                                              //                             ) ,
                                                              //                           ),
                                                              //                         ],
                                                              //                       ),
                                                              //                     ],
                                                              //                   ),
                                                              //                 ),
                                                              //               ),
                                                              //             ),
                                                              //             radius: 50
                                                              //         );
                                                              //       },
                                                              //       child: Container(
                                                              //         height: 30,
                                                              //         decoration: BoxDecoration(
                                                              //             borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //             color: kGray2,
                                                              //             border: Border.all(
                                                              //               color:kblack,
                                                              //               width: 2,
                                                              //             )
                                                              //         ),
                                                              //         child:Padding(
                                                              //           padding:   EdgeInsets.only(left: 8,right: 8),
                                                              //           child: Center(child: Text("Approve",style: TextStyle(color: kgolder,fontSize:18),)),
                                                              //         ) ,
                                                              //       ),
                                                              //     ),
                                                              //     SizedBox(width: 10,),
                                                              //     InkWell(
                                                              //       onTap: () {
                                                              //         Get.defaultDialog(
                                                              //             title: "",
                                                              //
                                                              //             titleStyle: TextStyle(color: kgolder),
                                                              //             titlePadding: EdgeInsets.only(right: 100,top: 5),
                                                              //             backgroundColor: Colors.transparent,
                                                              //
                                                              //             content: Container(
                                                              //               width: Get.width,
                                                              //               decoration: BoxDecoration(
                                                              //                 borderRadius: BorderRadius.all(Radius.circular(8)),
                                                              //                 gradient: LinearGradient(
                                                              //                     colors: [ kGray3,kblack]
                                                              //                 ),
                                                              //                 border: Border.all(
                                                              //                   color:kgolder,
                                                              //                   width: 2,
                                                              //                 ),
                                                              //               ),
                                                              //               child: Padding(
                                                              //                 padding:   EdgeInsets.all(10),
                                                              //                 child: Column(
                                                              //                   children: [
                                                              //                     Row(
                                                              //                       mainAxisAlignment: MainAxisAlignment.start,
                                                              //                       children: [
                                                              //                         Column(
                                                              //                           crossAxisAlignment: CrossAxisAlignment.start,
                                                              //                           children: [
                                                              //                             Text("Fahad Kharadi",style: TextStyle(color:kgolder ),),
                                                              //                             SizedBox(height: 15),
                                                              //                             Text("Emp ID: ",style: TextStyle(color:kgolder ),),
                                                              //                             Text("Designation: ",style: TextStyle(color:kgolder ),),
                                                              //                             Text("Phone: ",style: TextStyle(color:kgolder ),),
                                                              //                             Text("Email : ",style: TextStyle(color:kgolder ),),
                                                              //                             SizedBox(height: 15),
                                                              //                             Text("Request Details: \nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc",
                                                              //                               style: TextStyle(color:kgolder ),),
                                                              //
                                                              //                           ],
                                                              //                         ),
                                                              //                       ],
                                                              //                     ),
                                                              //                     SizedBox(height: 15),
                                                              //                     Container(
                                                              //                       width: Get.width,
                                                              //                       decoration: BoxDecoration(
                                                              //                         borderRadius: BorderRadius.all(Radius.circular(8)),
                                                              //                         gradient: LinearGradient(
                                                              //                             colors: [ kgradientYellow,kgolder2]
                                                              //                         ),
                                                              //                         border: Border.all(
                                                              //                           color:kgolder,
                                                              //                           width: 2,
                                                              //                         ),
                                                              //                       ),
                                                              //                       child: Padding(
                                                              //                         padding:   EdgeInsets.all(10.0),
                                                              //                         child: Text("Reason:\nLoremipsum dola sit \namet connector adsipising elit "),
                                                              //                       ),
                                                              //                     ),
                                                              //                     SizedBox(height: 15),
                                                              //                     Row(
                                                              //                       mainAxisAlignment: MainAxisAlignment.end,
                                                              //                       children: [
                                                              //                         Container(
                                                              //                           height: 30,
                                                              //                           decoration: BoxDecoration(
                                                              //                             borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //                             color: kgolder,
                                                              //
                                                              //                           ),
                                                              //                           child:Padding(
                                                              //                             padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //                             child: Center(child: Text("Reject",style: TextStyle(color: kblack,fontSize:18),)),
                                                              //                           ) ,
                                                              //                         ),
                                                              //                         Container(
                                                              //                           height: 30,
                                                              //                           decoration: BoxDecoration(
                                                              //                             borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //
                                                              //
                                                              //                           ),
                                                              //                           child:Padding(
                                                              //                             padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //                             child: Center(child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),)),
                                                              //                           ) ,
                                                              //                         ),
                                                              //                       ],
                                                              //                     ),
                                                              //                   ],
                                                              //                 ),
                                                              //               ),
                                                              //             ),
                                                              //             radius: 50
                                                              //         );
                                                              //       },
                                                              //       child: Container(
                                                              //         height: 30,
                                                              //         decoration: BoxDecoration(
                                                              //             borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //             color: kGray2,
                                                              //             border: Border.all(
                                                              //               color:kblack,
                                                              //               width: 2,
                                                              //             )
                                                              //         ),
                                                              //         child:Padding(
                                                              //           padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //           child: Center(child: Text("Reject",style: TextStyle(color: kgolder,fontSize:18),)),
                                                              //         ) ,
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
                                                ),
                                              ],
                                            )
                                            ),
                                            DefaultTabController(
                                                length: 1, child:Column(
                                              children: [
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
                                                                    child: Text("Arsalan Khan",style: TextStyle(color: kgolder,fontSize:20),),
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
                                                                  Text("Certificate Name: ",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                  Text("Certificate with\nDetail Salary",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("Email id:",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                  Text("arsalank28@gmail.com",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("Date:",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                  Text("12/04/2022",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text("Reason: ",style: TextStyle(color: kblack, fontWeight: FontWeight.bold)),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text("In publishing and graphic lorem\nipsum is a placeholder ",style: TextStyle(color: kblack, fontWeight: FontWeight.bold)),
                                                                ],
                                                              ),
                                                              SizedBox(height: 15),

                                                              // Row(
                                                              //   mainAxisAlignment: MainAxisAlignment.end,
                                                              //   children: [
                                                              //     InkWell(
                                                              //       onTap: () {
                                                              //
                                                              //         Get.defaultDialog(
                                                              //             title: "",
                                                              //
                                                              //             titleStyle: TextStyle(color: kgolder),
                                                              //             titlePadding: EdgeInsets.only(right: 100,top: 5),
                                                              //             backgroundColor: Colors.transparent,
                                                              //
                                                              //             content: Container(
                                                              //               width: Get.width,
                                                              //               decoration: BoxDecoration(
                                                              //                 borderRadius: BorderRadius.all(Radius.circular(8)),
                                                              //                 gradient: LinearGradient(
                                                              //                     colors: [ kGray3,kblack]
                                                              //                 ),
                                                              //                 border: Border.all(
                                                              //                   color:kgolder,
                                                              //                   width: 2,
                                                              //                 ),
                                                              //               ),
                                                              //               child: Padding(
                                                              //                 padding:   EdgeInsets.all(10),
                                                              //                 child: SingleChildScrollView(
                                                              //                   child: Column(
                                                              //                     children: [
                                                              //                       Row(
                                                              //                         mainAxisAlignment: MainAxisAlignment.start,
                                                              //                         children: [
                                                              //                           Column(
                                                              //                             crossAxisAlignment: CrossAxisAlignment.start,
                                                              //                             children: [
                                                              //                               Text("Fahad Kharadi",style: TextStyle(color:kgolder ),),
                                                              //                               SizedBox(height: 15),
                                                              //                               Text("Emp ID: ",style: TextStyle(color:kgolder ),),
                                                              //                               Text("Designation: ",style: TextStyle(color:kgolder ),),
                                                              //                               Text("Phone: ",style: TextStyle(color:kgolder ),),
                                                              //                               Text("Email : ",style: TextStyle(color:kgolder ),),
                                                              //                               SizedBox(height: 15),
                                                              //                               Text("Request Details: \nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc",
                                                              //                                 style: TextStyle(color:kgolder ),),
                                                              //
                                                              //                             ],
                                                              //                           ),
                                                              //                         ],
                                                              //                       ),
                                                              //                       SizedBox(height: 15),
                                                              //                       Row(
                                                              //                         mainAxisAlignment: MainAxisAlignment.end,
                                                              //                         children: [
                                                              //                           Container(
                                                              //                             height: 30,
                                                              //                             decoration: BoxDecoration(
                                                              //                               borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //                               color: kgolder,
                                                              //
                                                              //                             ),
                                                              //                             child:Padding(
                                                              //                               padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //                               child: Center(child: Text("Approve",style: TextStyle(color: kblack,fontSize:18),)),
                                                              //                             ) ,
                                                              //                           ),
                                                              //                           Container(
                                                              //                             height: 30,
                                                              //                             decoration: BoxDecoration(
                                                              //                               borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //
                                                              //
                                                              //                             ),
                                                              //                             child:Padding(
                                                              //                               padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //                               child: Center(child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),)),
                                                              //                             ) ,
                                                              //                           ),
                                                              //                         ],
                                                              //                       ),
                                                              //                     ],
                                                              //                   ),
                                                              //                 ),
                                                              //               ),
                                                              //             ),
                                                              //             radius: 50
                                                              //         );
                                                              //       },
                                                              //       child: Container(
                                                              //         height: 30,
                                                              //         decoration: BoxDecoration(
                                                              //             borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //             color: kGray2,
                                                              //             border: Border.all(
                                                              //               color:kblack,
                                                              //               width: 2,
                                                              //             )
                                                              //         ),
                                                              //         child:Padding(
                                                              //           padding:   EdgeInsets.only(left: 8,right: 8),
                                                              //           child: Center(child: Text("Approve",style: TextStyle(color: kgolder,fontSize:18),)),
                                                              //         ) ,
                                                              //       ),
                                                              //     ),
                                                              //     SizedBox(width: 10,),
                                                              //     InkWell(
                                                              //       onTap: () {
                                                              //         Get.defaultDialog(
                                                              //             title: "",
                                                              //
                                                              //             titleStyle: TextStyle(color: kgolder),
                                                              //             titlePadding: EdgeInsets.only(right: 100,top: 5),
                                                              //             backgroundColor: Colors.transparent,
                                                              //
                                                              //             content: Container(
                                                              //               width: Get.width,
                                                              //               decoration: BoxDecoration(
                                                              //                 borderRadius: BorderRadius.all(Radius.circular(8)),
                                                              //                 gradient: LinearGradient(
                                                              //                     colors: [ kGray3,kblack]
                                                              //                 ),
                                                              //                 border: Border.all(
                                                              //                   color:kgolder,
                                                              //                   width: 2,
                                                              //                 ),
                                                              //               ),
                                                              //               child: Padding(
                                                              //                 padding:   EdgeInsets.all(10),
                                                              //                 child: Column(
                                                              //                   children: [
                                                              //                     Row(
                                                              //                       mainAxisAlignment: MainAxisAlignment.start,
                                                              //                       children: [
                                                              //                         Column(
                                                              //                           crossAxisAlignment: CrossAxisAlignment.start,
                                                              //                           children: [
                                                              //                             Text("Fahad Kharadi",style: TextStyle(color:kgolder ),),
                                                              //                             SizedBox(height: 15),
                                                              //                             Text("Emp ID: ",style: TextStyle(color:kgolder ),),
                                                              //                             Text("Designation: ",style: TextStyle(color:kgolder ),),
                                                              //                             Text("Phone: ",style: TextStyle(color:kgolder ),),
                                                              //                             Text("Email : ",style: TextStyle(color:kgolder ),),
                                                              //                             SizedBox(height: 15),
                                                              //                             Text("Request Details: \nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc",
                                                              //                               style: TextStyle(color:kgolder ),),
                                                              //
                                                              //                           ],
                                                              //                         ),
                                                              //                       ],
                                                              //                     ),
                                                              //                     SizedBox(height: 15),
                                                              //                     Container(
                                                              //                       width: Get.width,
                                                              //                       decoration: BoxDecoration(
                                                              //                         borderRadius: BorderRadius.all(Radius.circular(8)),
                                                              //                         gradient: LinearGradient(
                                                              //                             colors: [ kgradientYellow,kgolder2]
                                                              //                         ),
                                                              //                         border: Border.all(
                                                              //                           color:kgolder,
                                                              //                           width: 2,
                                                              //                         ),
                                                              //                       ),
                                                              //                       child: Padding(
                                                              //                         padding:   EdgeInsets.all(10.0),
                                                              //                         child: Text("Reason:\nLoremipsum dola sit \namet connector adsipising elit "),
                                                              //                       ),
                                                              //                     ),
                                                              //                     SizedBox(height: 15),
                                                              //                     Row(
                                                              //                       mainAxisAlignment: MainAxisAlignment.end,
                                                              //                       children: [
                                                              //                         Container(
                                                              //                           height: 30,
                                                              //                           decoration: BoxDecoration(
                                                              //                             borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //                             color: kgolder,
                                                              //
                                                              //                           ),
                                                              //                           child:Padding(
                                                              //                             padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //                             child: Center(child: Text("Reject",style: TextStyle(color: kblack,fontSize:18),)),
                                                              //                           ) ,
                                                              //                         ),
                                                              //                         Container(
                                                              //                           height: 30,
                                                              //                           decoration: BoxDecoration(
                                                              //                             borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //
                                                              //
                                                              //                           ),
                                                              //                           child:Padding(
                                                              //                             padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //                             child: Center(child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),)),
                                                              //                           ) ,
                                                              //                         ),
                                                              //                       ],
                                                              //                     ),
                                                              //                   ],
                                                              //                 ),
                                                              //               ),
                                                              //             ),
                                                              //             radius: 50
                                                              //         );
                                                              //       },
                                                              //       child: Container(
                                                              //         height: 30,
                                                              //         decoration: BoxDecoration(
                                                              //             borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //             color: kGray2,
                                                              //             border: Border.all(
                                                              //               color:kblack,
                                                              //               width: 2,
                                                              //             )
                                                              //         ),
                                                              //         child:Padding(
                                                              //           padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //           child: Center(child: Text("Reject",style: TextStyle(color: kgolder,fontSize:18),)),
                                                              //         ) ,
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
                                                ),
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
                                                                    child: Text("Arsalan Khan",style: TextStyle(color: kgolder,fontSize:20),),
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
                                                                  Text("Certificate Name: ",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                  Text("Certificate with\nDetail Salary",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("Email id:",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                  Text("arsalank28@gmail.com",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("Date:",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                  Text("12/04/2022",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text("Reason: ",style: TextStyle(color: kblack, fontWeight: FontWeight.bold)),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text("In publishing and graphic lorem\nipsum is a placeholder ",style: TextStyle(color: kblack, fontWeight: FontWeight.bold)),
                                                                ],
                                                              ),
                                                              SizedBox(height: 15),

                                                              // Row(
                                                              //   mainAxisAlignment: MainAxisAlignment.end,
                                                              //   children: [
                                                              //     InkWell(
                                                              //       onTap: () {
                                                              //
                                                              //         Get.defaultDialog(
                                                              //             title: "",
                                                              //
                                                              //             titleStyle: TextStyle(color: kgolder),
                                                              //             titlePadding: EdgeInsets.only(right: 100,top: 5),
                                                              //             backgroundColor: Colors.transparent,
                                                              //
                                                              //             content: Container(
                                                              //               width: Get.width,
                                                              //               decoration: BoxDecoration(
                                                              //                 borderRadius: BorderRadius.all(Radius.circular(8)),
                                                              //                 gradient: LinearGradient(
                                                              //                     colors: [ kGray3,kblack]
                                                              //                 ),
                                                              //                 border: Border.all(
                                                              //                   color:kgolder,
                                                              //                   width: 2,
                                                              //                 ),
                                                              //               ),
                                                              //               child: Padding(
                                                              //                 padding:   EdgeInsets.all(10),
                                                              //                 child: SingleChildScrollView(
                                                              //                   child: Column(
                                                              //                     children: [
                                                              //                       Row(
                                                              //                         mainAxisAlignment: MainAxisAlignment.start,
                                                              //                         children: [
                                                              //                           Column(
                                                              //                             crossAxisAlignment: CrossAxisAlignment.start,
                                                              //                             children: [
                                                              //                               Text("Fahad Kharadi",style: TextStyle(color:kgolder ),),
                                                              //                               SizedBox(height: 15),
                                                              //                               Text("Emp ID: ",style: TextStyle(color:kgolder ),),
                                                              //                               Text("Designation: ",style: TextStyle(color:kgolder ),),
                                                              //                               Text("Phone: ",style: TextStyle(color:kgolder ),),
                                                              //                               Text("Email : ",style: TextStyle(color:kgolder ),),
                                                              //                               SizedBox(height: 15),
                                                              //                               Text("Request Details: \nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc",
                                                              //                                 style: TextStyle(color:kgolder ),),
                                                              //
                                                              //                             ],
                                                              //                           ),
                                                              //                         ],
                                                              //                       ),
                                                              //                       SizedBox(height: 15),
                                                              //                       Row(
                                                              //                         mainAxisAlignment: MainAxisAlignment.end,
                                                              //                         children: [
                                                              //                           Container(
                                                              //                             height: 30,
                                                              //                             decoration: BoxDecoration(
                                                              //                               borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //                               color: kgolder,
                                                              //
                                                              //                             ),
                                                              //                             child:Padding(
                                                              //                               padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //                               child: Center(child: Text("Approve",style: TextStyle(color: kblack,fontSize:18),)),
                                                              //                             ) ,
                                                              //                           ),
                                                              //                           Container(
                                                              //                             height: 30,
                                                              //                             decoration: BoxDecoration(
                                                              //                               borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //
                                                              //
                                                              //                             ),
                                                              //                             child:Padding(
                                                              //                               padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //                               child: Center(child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),)),
                                                              //                             ) ,
                                                              //                           ),
                                                              //                         ],
                                                              //                       ),
                                                              //                     ],
                                                              //                   ),
                                                              //                 ),
                                                              //               ),
                                                              //             ),
                                                              //             radius: 50
                                                              //         );
                                                              //       },
                                                              //       child: Container(
                                                              //         height: 30,
                                                              //         decoration: BoxDecoration(
                                                              //             borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //             color: kGray2,
                                                              //             border: Border.all(
                                                              //               color:kblack,
                                                              //               width: 2,
                                                              //             )
                                                              //         ),
                                                              //         child:Padding(
                                                              //           padding:   EdgeInsets.only(left: 8,right: 8),
                                                              //           child: Center(child: Text("Approve",style: TextStyle(color: kgolder,fontSize:18),)),
                                                              //         ) ,
                                                              //       ),
                                                              //     ),
                                                              //     SizedBox(width: 10,),
                                                              //     InkWell(
                                                              //       onTap: () {
                                                              //         Get.defaultDialog(
                                                              //             title: "",
                                                              //
                                                              //             titleStyle: TextStyle(color: kgolder),
                                                              //             titlePadding: EdgeInsets.only(right: 100,top: 5),
                                                              //             backgroundColor: Colors.transparent,
                                                              //
                                                              //             content: Container(
                                                              //               width: Get.width,
                                                              //               decoration: BoxDecoration(
                                                              //                 borderRadius: BorderRadius.all(Radius.circular(8)),
                                                              //                 gradient: LinearGradient(
                                                              //                     colors: [ kGray3,kblack]
                                                              //                 ),
                                                              //                 border: Border.all(
                                                              //                   color:kgolder,
                                                              //                   width: 2,
                                                              //                 ),
                                                              //               ),
                                                              //               child: Padding(
                                                              //                 padding:   EdgeInsets.all(10),
                                                              //                 child: Column(
                                                              //                   children: [
                                                              //                     Row(
                                                              //                       mainAxisAlignment: MainAxisAlignment.start,
                                                              //                       children: [
                                                              //                         Column(
                                                              //                           crossAxisAlignment: CrossAxisAlignment.start,
                                                              //                           children: [
                                                              //                             Text("Fahad Kharadi",style: TextStyle(color:kgolder ),),
                                                              //                             SizedBox(height: 15),
                                                              //                             Text("Emp ID: ",style: TextStyle(color:kgolder ),),
                                                              //                             Text("Designation: ",style: TextStyle(color:kgolder ),),
                                                              //                             Text("Phone: ",style: TextStyle(color:kgolder ),),
                                                              //                             Text("Email : ",style: TextStyle(color:kgolder ),),
                                                              //                             SizedBox(height: 15),
                                                              //                             Text("Request Details: \nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc\nLorem Epsumcscvscsbcscsccscscsc",
                                                              //                               style: TextStyle(color:kgolder ),),
                                                              //
                                                              //                           ],
                                                              //                         ),
                                                              //                       ],
                                                              //                     ),
                                                              //                     SizedBox(height: 15),
                                                              //                     Container(
                                                              //                       width: Get.width,
                                                              //                       decoration: BoxDecoration(
                                                              //                         borderRadius: BorderRadius.all(Radius.circular(8)),
                                                              //                         gradient: LinearGradient(
                                                              //                             colors: [ kgradientYellow,kgolder2]
                                                              //                         ),
                                                              //                         border: Border.all(
                                                              //                           color:kgolder,
                                                              //                           width: 2,
                                                              //                         ),
                                                              //                       ),
                                                              //                       child: Padding(
                                                              //                         padding:   EdgeInsets.all(10.0),
                                                              //                         child: Text("Reason:\nLoremipsum dola sit \namet connector adsipising elit "),
                                                              //                       ),
                                                              //                     ),
                                                              //                     SizedBox(height: 15),
                                                              //                     Row(
                                                              //                       mainAxisAlignment: MainAxisAlignment.end,
                                                              //                       children: [
                                                              //                         Container(
                                                              //                           height: 30,
                                                              //                           decoration: BoxDecoration(
                                                              //                             borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //                             color: kgolder,
                                                              //
                                                              //                           ),
                                                              //                           child:Padding(
                                                              //                             padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //                             child: Center(child: Text("Reject",style: TextStyle(color: kblack,fontSize:18),)),
                                                              //                           ) ,
                                                              //                         ),
                                                              //                         Container(
                                                              //                           height: 30,
                                                              //                           decoration: BoxDecoration(
                                                              //                             borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //
                                                              //
                                                              //                           ),
                                                              //                           child:Padding(
                                                              //                             padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //                             child: Center(child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),)),
                                                              //                           ) ,
                                                              //                         ),
                                                              //                       ],
                                                              //                     ),
                                                              //                   ],
                                                              //                 ),
                                                              //               ),
                                                              //             ),
                                                              //             radius: 50
                                                              //         );
                                                              //       },
                                                              //       child: Container(
                                                              //         height: 30,
                                                              //         decoration: BoxDecoration(
                                                              //             borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              //             color: kGray2,
                                                              //             border: Border.all(
                                                              //               color:kblack,
                                                              //               width: 2,
                                                              //             )
                                                              //         ),
                                                              //         child:Padding(
                                                              //           padding:  EdgeInsets.only(left: 8,right: 8),
                                                              //           child: Center(child: Text("Reject",style: TextStyle(color: kgolder,fontSize:18),)),
                                                              //         ) ,
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
                                                ),
                                              ],
                                            )
                                            ),
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
      ),

    );
  }
}
