import 'package:demo_nikita/Components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
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
                      width: 320,
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
                                height: 30,
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
                                      width: 70, duration: Duration(milliseconds: 500),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(width: 2, color: Colors.yellow),
                                color: Colors.black.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(8),
                              ),

                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 2.0),
                                      child: Text(
                                        "IN TIME",
                                        style: TextStyle(fontSize: 15,color: kgolder),
                                      ),
                                    ),
                                  ),
                                  DigitalClock(
                                    hourMinuteDigitTextStyle: TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 18,
                                    ),
                                    secondDigitTextStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
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
                                        "LATE",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  )
                                ],
                              )),
                          Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(width: 2, color: Colors.yellow),
                                color: Colors.black.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(8),
                              ),

                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 2.0),
                                      child: Text(
                                        "IN TIME",
                                        style: TextStyle(fontSize: 15,color: kgolder),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      buildTimeCard(),
                                      buildTimeCard(),
                                      buildTimeCard(),
                                      buildTimeCard(),
                                      buildTimeCard(),
                                      buildTimeCard(),
                                    ],
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
                                        "LATE",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  )
                                ],
                              )),

                        ],
                      ),
                    ),
                    Container(
                      width: 340,
                      height: 40,
                      margin: const EdgeInsets.all(15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellow,
                          padding: EdgeInsets.all(6),
                        ),
                        onPressed: () {},
                        child: Text(
                          'CHECK OUT',
                          style: TextStyle(
                              color: Colors.black,
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
                      height: 250,
                      width: 340,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Mounth Record",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold,color:Colors.yellow),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  color: Colors.yellow,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,bottom: 10  ),
                            child: Row(
                              children: [
                                Text(
                                  "My Record for",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.yellow),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  color: Colors.yellow,
                                  height: 20,
                                  child: DropdownButton(
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
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2, color: Colors.yellow),
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                height: 160,
                                width: 160,
                                child: Column(
                                  children:  [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 60.0,top: 10),
                                      child: Text(
                                        "Present",
                                        style: TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.bold,color: Colors.yellow),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40.0,top: 12),
                                      child: Text(
                                        "14",
                                        style: TextStyle(
                                            fontSize: 90,color: Colors.yellow,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2, color: Colors.yellow),
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                height: 160,
                                width: 160,
                                child: Column(
                                  children:  [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 40.0,top: 10),
                                      child: Text(
                                        "Late entry",
                                        style: TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.bold,color: Colors.yellow),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40.0,top: 12),
                                      child: Text(
                                        "03",
                                        style: TextStyle(
                                            fontSize: 90,color: Colors.yellow,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ));
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