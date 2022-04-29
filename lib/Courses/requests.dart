import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/constants.dart';

class Requests extends StatefulWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {

  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: DefaultTabController(
          length: 3,
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
                              Text("Requests",style: TextStyle(color: kgolder,fontSize: screenHeight / 22),)
                            ],
                          ),
                          SizedBox(height: 8,),
                          Padding(
                            padding:   EdgeInsets.all(8.0),
                            child: TabBar(labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight:FontWeight.w600),
                              labelColor: Colors.black,
                              unselectedLabelColor:  kgolder,
                              indicator: BoxDecoration(
                                  color: kgolder,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(12),
                                      bottomLeft: Radius.circular(12))
                              ),
                              tabs: [
                                Tab(text: "Summary",),
                                Tab(text: "Requests"),
                                Tab(text: "History"),
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
                                Summary("Personal Leaves"),
                                Summary("Official Mission Leaves"),
                                Summary("Study Leaves"),

                              ],
                            ),
                            ListView(
                              children: [
                                Requests("Personal Leaves"),

                              ],
                            ),
                            ListView(
                              children: [
                                History(),

                              ],
                            ),


                          ]
                      ),
                    ),

                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
  Padding Requests(String title ) {
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
                                                  Text("Date :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kgolder),),
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
                                                  Text("From :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kgolder),),
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
                                                  Text("To :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kgolder),),
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
                                                  Text("Reason :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kgolder),),
                                                  Container(
                                                     width: 200,

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
                                                ],
                                              ),
                                              SizedBox(height: 5,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("Hours :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kgolder),),
                                                  Container(
                                                    height: 35,
                                                    width: 200,

                                                    child: Padding(
                                                      padding:   EdgeInsets.all(4),
                                                      child: Text("07:00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
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
                                                  Text("Identity :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kgolder),),
                                                  Container(
                                                    height: 35,
                                                    width: 200,

                                                    child: Padding(
                                                      padding:   EdgeInsets.all(4),
                                                      child: Text("Lore Posem",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: kgolder,
                                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                                        border: Border.all(width: 3,color: Colors.black)
                                                    ),
                                                  ),
                                                ],
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

                      child: Row(

                        children: [
                          Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: kgolder),),

                        ],
                      ),

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
  DefaultTabController History (){
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient:  LinearGradient(
              colors: [kgolder, Colors.yellow.shade100 ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,),
          ),

        ),
      ),
    );

  }

  Padding Summary(String title) {
    return Padding(
      padding:   EdgeInsets.all(8.0),
      child: Column(

        children: [
          InkWell(

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
                        child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      ),
                      decoration: BoxDecoration(
                          gradient:  LinearGradient(
                            colors: [Colors.yellow.shade100, kgolder  ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(width: 3,color: Colors.black)
                      ),
                    ),

                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Venue One",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 20 ),),
                            Divider(color: kgolder,thickness: 3,),
                            Text("6 Hours",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 20 ),),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Consumed",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 20 ),),
                            Divider(color: kgolder,thickness: 3,),
                            Text("6 Hours",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 20 ),),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Balance",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 20 ),),
                            Divider(color: kgolder,thickness: 3,),
                            Text("6 Hours",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 20 ),),
                          ],
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
