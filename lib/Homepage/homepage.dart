import 'dart:async';

import 'package:demo_nikita/Components/clockWidget.dart';
import 'package:demo_nikita/Components/constants.dart';
import 'package:demo_nikita/Homepage/mainhomepage.dart';
import 'package:demo_nikita/Services/Services.dart';
import 'package:demo_nikita/demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin {
  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];



  late AnimationController _animationController;
  late Animation _arrowAnimation;

  var selectedCard = 'Home';



  bool panelOpen = false;

  bool panelOpen2 = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));

    _arrowAnimation =
        Tween(begin: 0.0, end: 0.0).animate(_animationController);

  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _handleOnPressed() {
    // _animationController.isCompleted
    //     ? _animationController.reverse()
    //     : _animationController.forward();
    setState(() {
      panelOpen = !panelOpen;

      panelOpen
          ? _animationController.forward()
          : _animationController.reverse();
    });
    Timer(Duration(milliseconds: !panelOpen ? 0 : 600 ), () {
      setState(() {
        panelOpen2 =!panelOpen2;
      });
    });
  }

  var listofwidget = [
    Services(),
    Container(),
    MainHomePage(),

  ];

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(


          body:
          Stack(
            alignment: Alignment.bottomCenter,
            children: [

              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.transparent
                  // image: DecorationImage(
                  //   image: AssetImage('assets/bg.jpg'),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.black,
                        height: 60,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          buildBNBCards('Services','assets/icons/services.png'),
                          buildBNBCards('Enquiry','assets/icons/enquiry.png'),
                          buildBNBCards('Home','assets/icons/home.png'),
                          buildBNBCards('Reports','assets/icons/reports.png'),
                          buildBNBCards('More','assets/icons/more.png'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
        )

    );
  }

   buildBNBCards(title,image) {
    return Expanded(
      child: InkWell(
        onTap: (){
          setState(() {
            selectedCard = title;
          });
        },
        child: Container(

          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             selectedCard == title ?  Container(

                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    border: Border.all(color: kgolder,width: 2)
                ),
                child: Container(
                    padding: EdgeInsets.all(8),
                    width: 60,
                    height: 60,
                    child: Image.asset(image,fit: BoxFit.fill,)
                ),
              )  :
              Container(

                  width: 30,
                  height: 30,
                  child: Image.asset(image,fit: BoxFit.fill,)),
              Text(title,style: TextStyle(color: kgolder,fontSize:  selectedCard == title ? 16 : 14),),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildAttendenceCard() {
    return Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 2, color: kgolder),
                                            color: Colors.blueGrey.withOpacity(0.8),
                                            borderRadius: BorderRadius.circular(15),
                                          ),

                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 10,left: 10),
                                                child: Text(
                                                  "Presents",
                                                  style: TextStyle(
                                                      fontSize: 20, fontWeight: FontWeight.bold,color: kgolder),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 12,right: 10),
                                                  child: Text(
                                                    "14",
                                                    style: TextStyle(
                                                        fontSize: 90,color: kgolder,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 20,)
                                            ],
                                          ),
                                        ),
                                      );
  }

  Padding buildTimeCard() {
    return Padding(
                                      padding: const EdgeInsets.only(left: 7.0),
                                      child: Container(
                                        height: 35,
                                        width: 18,
                                        color: Colors.black,
                                      ),
                                    );
  }
}