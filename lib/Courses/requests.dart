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
                              Text("Leaves Request",style: TextStyle(color: kgolder,fontSize: 17),)
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
                                Tab(child: Text("Summary",style: TextStyle(fontSize: 16),),),
                                Tab(child: Text("Request",style: TextStyle(fontSize: 16),),),
                                Tab(child: Text("History",style: TextStyle(fontSize: 16),),),
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
                            DefaultTabController(
                                length: 3,
                                child: Scaffold(
                                    appBar: AppBar(
                                        shadowColor: Colors.transparent,
                                        flexibleSpace: Stack(
                                          children: [
                                            Container(
                                              height: screenHeight*0.5,
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
                                                labelColor: kgolder,
                                                indicator: BoxDecoration(
                                                  color: kGray3,
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                unselectedLabelColor: kblack,
                                                tabs: [
                                                  Text("Pending"),
                                                  Text("Accepted"),
                                                  Text("Rejected",style: TextStyle(fontSize: 13),)
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    body:TabBarView(
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
                                          child: ListView.builder(
                                            itemCount: 4,
                                            itemBuilder: (BuildContext context, int index) {
                                              return buildCertificateName();

                                            },

                                          ),
                                        ),
                                        Container(
                                          height: screenHeight,
                                          width: screenWidth,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage("assets/bg.jpg"),
                                                  fit: BoxFit.cover
                                              )
                                          ),
                                          child: ListView.builder(
                                            itemCount: 4,
                                            itemBuilder: (BuildContext context, int index) {
                                              return buildCertificateName();

                                            },

                                          ),
                                        ),
                                        Container(
                                          height: screenHeight,
                                          width: screenWidth,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage("assets/bg.jpg"),
                                                  fit: BoxFit.cover
                                              )
                                          ),
                                          child: ListView.builder(
                                            itemCount: 4,
                                            itemBuilder: (BuildContext context, int index) {
                                              return buildCertificateReject();

                                            },

                                          ),
                                        ),
                                      ],
                                    )
                                )),


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
                                                  Expanded(
                                                    child: Container(
                                                      height: 35,

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
            appBar: AppBar(
                shadowColor: Colors.transparent,
                flexibleSpace: Stack(
                  children: [
                    Container(
                      height: screenHeight*0.5,
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
                        labelColor: kgolder,
                        indicator: BoxDecoration(
                          color: kGray3,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        unselectedLabelColor: kblack,
                        tabs: [
                          Text("Pending"),
                          Text("Accepted"),
                          Text("Rejected",style: TextStyle(fontSize: 13),)
                        ],
                      ),
                    ),
                  ],
                )
            ),
            body:TabBarView(
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
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return buildCertificateName();

                    },

                  ),
                ),
                Container(
                  height: screenHeight,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/bg.jpg"),
                          fit: BoxFit.cover
                      )
                  ),
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return buildCertificateName();

                    },

                  ),
                ),
                Container(
                  height: screenHeight,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/bg.jpg"),
                          fit: BoxFit.cover
                      )
                  ),
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return buildCertificateReject();

                    },

                  ),
                ),
              ],
            )
        ));

  }

  Container buildCertificateName() {
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
                Text("Title:",style: TextStyle(color: kgolder),),
                Text("Date:",style: TextStyle(color: kgolder)),
                Text("From:",style: TextStyle(color: kgolder)),
                Text("To:",style: TextStyle(color: kgolder))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Text("Personal Leave",style: TextStyle(color: kgolder)),
                Text("19/04/2022",style: TextStyle(color: kgolder)),
                Text("19/04/2022",style: TextStyle(color: kgolder)),
                Text("19/04/2022",style: TextStyle(color: kgolder))
              ],
            )
          ],
        )
    );
  }
  Container buildCertificateMoreRequest() {
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
                Text("Date:",style: TextStyle(color: kgolder)),
                Text("Status:",style: TextStyle(color: kgolder))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Text("12/04/2022",style: TextStyle(color: kgolder)),
                Text("Pending from HR",style: TextStyle(color: kgolder))
              ],
            )
          ],
        )
    );
  }
  Container buildCertificateReject() {
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
                Text("Certificate Name:",style: TextStyle(color: kgolder),),
                Text(""),
                Text("Date:",style: TextStyle(color: kgolder)),
                Text("Status:",style: TextStyle(color: kgolder)),
                Text("Reason:",style: TextStyle(color: kgolder))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Text("Certificate With",style: TextStyle(color: kgolder)),
                Text("Detail Salary",style: TextStyle(color: kgolder)),
                Text("12/04/2022",style: TextStyle(color: kgolder)),
                Text("Pending from HR",style: TextStyle(color: kgolder)),
                Text("xyz",style: TextStyle(color: kgolder)),
              ],
            )
          ],
        )
    );
  }

  Container buildCertificate(double H, double W) {
    return Container(
      height: H*.1,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: W*.03,vertical: H*0.008),
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
          Text("Certificate With Detail Salary",style: TextStyle(color: kgolder),),
          ElevatedButton(
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
                          Container(
                            padding: EdgeInsets.only(left: 10,right: 10,top: 8,),
                            height: H*0.05,
                            decoration: BoxDecoration(
                                color: kGray3,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: kblack)
                            ),
                            child: Text("Request",style: TextStyle(
                                fontSize: 15,
                                color: kgolder),),

                          ),
                          SizedBox(width: 10,),
                          Text("Cancel",style: TextStyle(fontWeight: FontWeight.w500),)
                        ],
                      )
                    ],

                  )
              );
            },
            child: Text("Request"),
            style: ElevatedButton.styleFrom(
                primary: kgolder,
                onPrimary: kblack
            ),
          )
        ],
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
                            Text("Venue One",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 16 ),),
                            SizedBox(height: 5,),
                            Container(color: kgolder,height: 3,width: 100,),
                            SizedBox(height: 5,),
                            Text("6 Hours",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 16 ),),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Consumed",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 16 ),),
                            SizedBox(height: 5,),
                            Container(color: kgolder,height: 3,width: 100,),
                            SizedBox(height: 5,),
                            Text("6 Hours",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 16 ),),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Balance",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 16 ),),
                            SizedBox(height: 5,),
                            Container(color: kgolder,height: 3,width: 100,),
                            SizedBox(height: 5,),
                            Text("6 Hours",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 16 ),),
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
