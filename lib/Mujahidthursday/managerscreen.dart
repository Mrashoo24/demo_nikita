import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/constants.dart';

class ManagerScreeen extends StatefulWidget {
  const ManagerScreeen({Key? key}) : super(key: key);

  @override
  _ManagerScreeenState createState() => _ManagerScreeenState();
}

class _ManagerScreeenState extends State<ManagerScreeen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Scaffold(
          body: Stack(
              children: [
                Container(

                  decoration: BoxDecoration(
                    gradient:LinearGradient(
                        colors: [
                          Colors.grey,
                          Colors.black,

                          Colors.grey,
                          Colors.black,
                          //add more colors for gradient
                        ],
                        begin: Alignment.topCenter, //begin of the gradient color
                        end: Alignment.bottomCenter, //end of the gradient color
                        stops: [0, 0.2, 0.6,11] //stops for individual color
                      //set the stops number equal to numbers of color
                    ),

                  ),



                ),
                Column(
                  children: [
                    Container(
                      height: 60,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                        gradient:LinearGradient(
                            colors: [
                              kgolder,


                              Colors.yellow.shade200,
                              kgolder,
                              //add more colors for gradient
                            ],
                            begin: Alignment.centerLeft, //begin of the gradient color
                            end: Alignment.centerRight, //end of the gradient color
                            stops: [0,  0.6,11] //stops for individual color
                          //set the stops number equal to numbers of color
                        ),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(left: 80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("todaytix",style: TextStyle(
                                color: Colors.redAccent[400],
                                fontSize: 30,
                                fontWeight: FontWeight.bold

                            ),),
                            Stack(
                                children:[
                                  Icon(Icons.notifications,size: 30,),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 17,top: 4),
                                    child: CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.redAccent[400],
                                      child: Text("54",style: TextStyle(color: Colors.white,fontSize: 8),),
                                    ),
                                  )
                                ])
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 35,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        gradient:LinearGradient(
                            colors: [
                              kgolder,


                              Colors.yellow.shade200,
                              kgolder,
                              //add more colors for gradient
                            ],
                            begin: Alignment.centerLeft, //begin of the gradient color
                            end: Alignment.centerRight, //end of the gradient color
                            stops: [0,  0.6,11] //stops for individual color
                          //set the stops number equal to numbers of color
                        ),
                      ),
                      child: Center(child: Text("Manager",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                    ),

                    SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildContainer("assets/certifcts.png","Certificates"),
                            buildContainer("assets/report.png","Reports"),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildContainer("assets/benchlist.png","Benchlist"),
                            buildContainer("assets/adminleaves.png","Administrative Leave"),
                          ],
                        ),


                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildContainer("assets/leaves.png","Leaves"),
                            buildContainer("assets/othersrv.png","Other Services"),
                          ],
                        ),

                        SizedBox(height: 30),
                        Padding(
                          padding:  EdgeInsets.only(left: 295.0),
                          child: Container(

                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                            child: FittedBox(
                                fit: BoxFit.none,
                                child: Container(

                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    boxShadow: [BoxShadow(color: kgolder,blurRadius: 15)],
                                    color: kgolder,
                                  ),
                                  child: Center(
                                      child: Image.asset("assets/icons/benchlist.png",fit: BoxFit.fitWidth,)
                                  ),
                                )
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ]
          ),
        ),
      ),
    );
  }

  Container buildContainer(String image, String tabname) {
    return Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient:LinearGradient(
            colors: [
              kgolder,


              Colors.yellow.shade200,
              kgolder,
              //add more colors for gradient
            ],
            begin: Alignment.topCenter, //begin of the gradient color
            end: Alignment.bottomCenter, //end of the gradient color
            stops: [0,  0.6,11] //stops for individual color
          //set the stops number equal to numbers of color
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.only(top: 17),
        child: Column(
          children: [
            Image.asset(image,color: Colors.black),
            SizedBox(height: 10,),
            Text(tabname)
          ],
        ),
      ),
    );
  }

}
