import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/constants.dart';

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({Key? key}) : super(key: key);

  @override
  _ManagerScreenState createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
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
                    child: Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("todaytx"),
                        Icon(Icons.notifications,color: Colors.redAccent,)
                      ],
                    )),
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
                    child: Text("Manager",style: TextStyle(fontSize: 15),),
                  ),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildContainer("assets/leaves.png","Certificates"),
                      buildContainer("assets/benchlist.png","Benchlist"),
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
                    padding:   EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(image,color: Colors.black),
                        Text(tabname)
                      ],
                    ),
                  ),
                );
  }
}
