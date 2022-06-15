import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/constants.dart';

class HRLeaaves extends StatefulWidget {
  const HRLeaaves({Key? key}) : super(key: key);

  @override
  State<HRLeaaves> createState() => _HRLeaavesState();
}

class _HRLeaavesState extends State<HRLeaaves> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
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
                  begin: Alignment.topRight, //begin of the gradient color
                  end: Alignment.bottomLeft,
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
                          kgradientYellow,
                          kgolder
                          //add more colors for gradient
                        ],
                        begin: Alignment.centerLeft, //begin of the gradient color
                        end: Alignment.centerRight, //end of the gradient color
                        stops: [0,  0.6,11] //stops for individual color
                      //set the stops number equal to numbers of color
                    ),
                  ),
                  child: Padding(
                    padding:   EdgeInsets.only(left: 14),
                    child: Row(

                      children: [
                        InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back, color: kblack)),
                        SizedBox(width: 10,),
                        Text("Enquiry",style: TextStyle(
    color: kblack, fontSize: 20, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding:   EdgeInsets.only(left: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        BuilLeaveCard("Abrar"),
                        SizedBox(height: 15),
                        BuilLeaveCard("Manager"),
                        SizedBox(height: 15),
                        BuilLeaveCard("Arsalan khan"),
                        SizedBox(height: 15),
                        BuilLeaveCard("Fahad"),
                        SizedBox(height: 15),
                        BuilLeaveCard("Mannan"),
                        SizedBox(height: 15),
                        BuilLeaveCard("Sam"),
                        SizedBox(height: 15),
                        BuilLeaveCard("Rocky"),
                        SizedBox(height: 15),
                        BuilLeaveCard("Julie"),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Row BuilLeaveCard(string) {
    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,


                      children: [
                        Icon(Icons.person,color: kgolder,size: 25,),
                        SizedBox(width: 50,),
                        Text(string,style: TextStyle(color: kgradientYellow,fontSize: 20),)
                      ],
                    );
  }
}
