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
          backgroundColor: kGray3,
        appBar :  AppBar(
          title: Text("todaytix",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: kred),),
            actions: [Padding(
              padding:   EdgeInsets.only(right: 15,top: 15),
              child: Stack(children: [Icon(Icons.notifications,color: kblack,size: 30,),
                CircleAvatar(radius: 6,backgroundColor: kred,)
              ]),
            ),

            ],

            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [ kgolder2,kgradientYellow,kgolder2]
                ),
                  borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
              ),
            ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),


          toolbarHeight: 55,
            elevation: 0,
          ),
          body: Stack(
            children: [

              Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(

    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [kGray3, kblack, kGray3,  kblack,]
    ),)

    // ),
    //       child: Column(
    //         children: [
    //           Container(
    //             height: 40,
    //             width: 40,
    //             decoration: BoxDecoration(
    //               gradient: LinearGradient(
    //                   colors: [ kgolder2,kgradientYellow,kgolder2]
    //               ),
    //               borderRadius: BorderRadius.all(Radius.circular(10)),
    //             ),
    //
    //           ),
    //         ],
    //       ),
        ),
              Center(

                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 150,
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    gradient: LinearGradient(

    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [kgradientYellow, kgolder2, kgradientYellow,]
    ),)

        ),
                        Container(
                          height: 150,
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    gradient: LinearGradient(

    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [kgradientYellow, kgolder2, kgradientYellow,]
    ),)

        ),

                      ],
                    ),
                  ],
                ),
              ),


            ]
          ),),
      )

    );
  }
}
