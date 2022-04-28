import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:demo_nikita/Components/clockWidget.dart';
import 'package:demo_nikita/Components/constants.dart';
import 'package:demo_nikita/Services/Services.dart';
import 'package:demo_nikita/demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> with TickerProviderStateMixin {

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


  @override
  Widget build(BuildContext context) {

    return  SingleChildScrollView(
      child: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient:  LinearGradient(
                  colors: [Colors.black, Colors.grey.shade600],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,

                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),

              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0, left: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.menu,color: kgolder,),
                        Text(
                          "todayytix",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 30,
                              fontWeight: FontWeight.w900),
                        ),
                        Image(
                          image: AssetImage("assets/icons/bell.png"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Welcome,\nBhavna sing",
                                style: TextStyle(
                                    fontSize: 30, color:kgolder),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Co-Founder     \nE-51253      ",
                                    style: TextStyle(
                                        fontSize: 15, color: kgolder),
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_down_sharp,color: kgolder,)
                              ],
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            backgroundColor:kgolder,
                            radius: 58,
                            child: CircleAvatar(
                              radius: 55,
                              backgroundColor: Colors.yellow,
                              backgroundImage:
                              AssetImage('assets/icons/userpic.jpeg'),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 55,
              width: Get.width*0.85,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                border: Border.all(
                  width: 2,
                  color: Colors.yellow,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(

                      height: 30,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "04-Mar-2022",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: kgolder,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(

                      child: Container(
                          height: 25,
                          decoration: BoxDecoration(
                              color: kgolder.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: kgolder,width: 3)
                          ),

                          child:Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: kgolder.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20)
                                ),

                                width: double.infinity,
                              ),
                              AnimatedContainer(

                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage('assets/blackstrip.jpeg')
                                    ),
                                    borderRadius: BorderRadius.horizontal(left:Radius.circular(20))
                                ),
                                width: 50, duration: Duration(milliseconds: 500),
                              ),
                            ],
                          )
                        // LinearPercentIndicator(
                        //   width: 170.0,
                        //   animation: true,
                        //   animationDuration: 1000,
                        //   lineHeight: 20.0,
                        //   percent: 0.4,
                        //   linearStrokeCap: LinearStrokeCap.round,
                        //   progressColor: Colors.grey,
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                width: Get.width*0.85 ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.all(8),

                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.yellow),
                            color: Colors.black.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8),
                          ),

                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 2.0),
                                  child: Text(
                                    "In Time",
                                    style: TextStyle(fontSize: 15,color: kgolder,fontWeight: FontWeight.bold  ),
                                  ),
                                ),
                              ),
                              DigitalClock(
                                is24HourTimeFormat: false,
                                showSecondsDigit: false,
                                areaDecoration: BoxDecoration(
                                    color: Colors.transparent
                                ),

                                hourMinuteDigitDecoration: BoxDecoration(
                                    color: kgolder,
                                    border: Border.all(color: Colors.black)

                                ),
                                secondDigitDecoration: BoxDecoration(
                                    color: kgolder,
                                    border: Border.all(color: Colors.black)

                                ),
                                hourMinuteDigitTextStyle: TextStyle(
                                    fontFamily: 'Alarm Clock',
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                                secondDigitTextStyle: TextStyle(
                                    fontFamily: 'Alarm Clock',
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ), seconds: '22', hour: '01', minute: '30', type: 'AM',
                              ),

                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    width: 140,
                                    height: 1,

                                    color: kgolder,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      "In Status",
                                      style: TextStyle(fontSize: 15,color: kgolder),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 25,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    "Late",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: kgolder,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              )
                            ],
                          )),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.all(8),

                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.yellow),
                            color: Colors.black.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8),
                          ),

                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 2.0),
                                  child: Text(
                                    "Out Time",
                                    style: TextStyle(fontSize: 15,color: kgolder,fontWeight: FontWeight.bold  ),
                                  ),
                                ),
                              ),
                              DigitalClock(
                                is24HourTimeFormat: false,
                                showSecondsDigit: false,
                                areaDecoration: BoxDecoration(
                                    color: Colors.transparent
                                ),

                                hourMinuteDigitDecoration: BoxDecoration(
                                    color: kgolder,
                                    border: Border.all(color: Colors.black)

                                ),
                                secondDigitDecoration: BoxDecoration(
                                    color: kgolder,
                                    border: Border.all(color: Colors.black)

                                ),
                                hourMinuteDigitTextStyle: TextStyle(
                                    fontFamily: 'Alarm Clock',
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                                secondDigitTextStyle: TextStyle(
                                    fontFamily: 'Alarm Clock',
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ), seconds: '22', hour: '01', minute: '30', type: 'AM',
                              ),

                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    width: 140,
                                    height: 1,

                                    color: kgolder,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      "Out Status",
                                      style: TextStyle(fontSize: 15,color: kgolder),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 25,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    "On Time",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: kgolder,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              )
                            ],
                          )),
                    ),


                  ],
                ),
              ),
            ),
            Container(
              width: Get.width*0.85,
              height: 40,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,width: 2),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/cardbg.png',
                      )
                  )
              ),
              child: Center(
                child: Text(
                  'Check Out',
                  style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.yellow),
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),

              width: Get.width*0.85,
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        _handleOnPressed();
                      });

                    },
                    child
                        : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Month Record",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold,color:kgolder),
                          ),
                          AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) => Transform.rotate(
                              angle: _arrowAnimation.value,
                              child: Icon(
                                !_animationController.isCompleted ?    Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                                size: 50.0,
                                color: kgolder,
                              ),
                            ),
                          ),
                          // AnimatedIcon(
                          //
                          //
                          //  icon: AnimatedIcons.view_list,
                          //   color: kgolder,
                          //   progress: _animationController,
                          // )
                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    height: panelOpen ? 450 :0,
                    duration: Duration(milliseconds: 600),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0,bottom: 10,right: 10,top: 10  ),
                      child:
                      Visibility(
                        visible: panelOpen2,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "My Record for",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: kgolder),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  color: kgolder,
                                  height: 20,
                                  child: DropdownButton(
                                    dropdownColor: kgolder,
                                    hint: Text(
                                      'Febauray',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    items: items
                                        .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ))
                                        .toList(),
                                    value: selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value as String;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildAttendenceCard(),
                                SizedBox(width: 10,),
                                buildAttendenceCard(),


                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildAttendenceCard(),
                                SizedBox(width: 10,),
                                buildAttendenceCard(),


                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),



                ],
              ),
            ),


            SizedBox(height: 200,)
          ],
        ),
      ),
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
