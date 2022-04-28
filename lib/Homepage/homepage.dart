import 'dart:async';

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:demo_nikita/Components/clockWidget.dart';
import 'package:demo_nikita/Components/constants.dart';
import 'package:demo_nikita/Homepage/mainhomepage.dart';
import 'package:demo_nikita/Services/Services.dart';
import 'package:demo_nikita/demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../Components/Arrow/arrowclipper.dart';
import '../Components/Arrow/test.dart';


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
  var selectedIndex = 2;



  bool panelOpen = false;

  bool panelOpen2 = false;


  //For overlaying menu
  GlobalKey _key = LabeledGlobalKey("button_icon");
  late OverlayEntry _overlayEntry;
  late Size buttonSize;
  late Offset buttonPosition;
  bool isMenuOpen = false;


// For overlau


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
    Container(),
    Container(),
  ];

  findButton() {
    RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);

    print('size = $buttonSize postion = $buttonPosition');
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        top: buttonPosition.dy - buttonSize.height,
        left: buttonPosition.dx,
        width:buttonSize.width,
        child: Material(
          color: Colors.transparent,
          child:  Stack(
            children: [
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child:
              //     Icon(Icons.keyboard_arrow_down_sharp,color: Colors.green,size: 100,)
              //   // ClipPath(
              //   //   clipper: ArrowClipper(),
              //   //   child: Container(
              //   //     width: 100,
              //   //     height: 100,
              //   //     color: Colors.green,
              //   //   ),
              //   // ),
              // ),
              Container(
              height: 100,
                width: 100,
                color: Colors.blueGrey,
                child: GridView.count(
                    crossAxisCount: 3,
                  children: [
                    buildBNBCards3('Leave\nRequests', 'assets/icons/services.png', 4)
                  ],
                ),
              ),
            ],
          )

        ),
      );
    },
    );
  }



  void openMenu() {
    findButton();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context)!.insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }
  void closeMenu() {
    _overlayEntry.remove();
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Scaffold(


          body:
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              listofwidget[selectedIndex],
//               Positioned(
//                 bottom: 100,
//                 child: Container(
//                   height: 100,
//                   width: 300,
//                   color: Colors.blueGrey,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: GridView.count(
//                       crossAxisCount: 3,
//                       children: [
//                         buildBNBCards3('Leave Requests', 'assets/icons/services.png', 4)
//                       ,                        buildBNBCards3('Leave Requests', 'assets/icons/services.png', 4)
// ,                        buildBNBCards3('Leave Requests', 'assets/icons/services.png', 4)
// ,                        buildBNBCards3('Leave Requests', 'assets/icons/services.png', 4)
// ,                        buildBNBCards3('Leave Requests', 'assets/icons/services.png', 4)
// ,                        buildBNBCards3('Leave Requests', 'assets/icons/services.png', 4)
// ,                        buildBNBCards3('Leave Requests', 'assets/icons/services.png', 4)
//
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
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
                          buildBNBCards('Services','assets/icons/services.png',0),
                          buildBNBCards('Enquiry','assets/icons/enquiry.png',1),
                          buildBNBCards('Home','assets/icons/home.png',2),
                          buildBNBCards('Reports','assets/icons/reports.png',3),
                          // buildBNBCards2('More','assets/icons/more.png',4),
                          CustomPopupMenu(
                            menuBuilder: () => GestureDetector(
                              child: _buildAvatar(true, 300),
                              onLongPress: () {
                                print("onLongPress");
                              },
                              onTap: () {
                                print("onTap");
                              },
                            ),
                            barrierColor: Colors.transparent,
                            pressType: PressType.singleClick,
                            arrowColor:  kgolder,
                            arrowSize: 15,
                            position: PreferredPosition.top,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                selectedCard == 'More' ?  Container(

                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                      border: Border.all(color: kgolder,width: 2)
                                  ),
                                  child: Container(
                                      padding: EdgeInsets.all(8),
                                      width: 60,
                                      height: 60,
                                      child: Image.asset('assets/icons/reports.png',fit: BoxFit.fill,)
                                  ),
                                )  :
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      selectedCard = 'More';
                                      //  index == 4 ?
                                      // isMenuOpen ? closeMenu() :
                                      //    openMenu()
                                      //      :

                                    });
                                  },
                                  child
                                      : Container(

                                      width: 30,
                                      height: 30,
                                      child: Image.asset('assets/icons/reports.png',fit: BoxFit.fill,)),
                                ),
                                Text('More',style: TextStyle(color: kgolder,fontSize:  14),),
                              ],
                            ),
                          )
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

  Widget _buildAvatar(bool isMe, double size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(

        decoration: BoxDecoration(

          color:  Colors.black.withOpacity(0.8) ,
          border: Border.all(color: kgolder,width: 3),
          borderRadius: BorderRadius.circular(10)
        ),
        width: Get.width*0.7,
        height: Get.height*0.25,
        child:GridView.count(
          padding: EdgeInsets.symmetric(horizontal: 10),
          crossAxisCount: 3,
        children: [
          buildBNBCards3('Leave Request', 'assets/icons/leaveRequest.png', 4),
          buildBNBCards3('Courses', 'assets/icons/courses.png', 5),
          buildBNBCards3('Admin Leave', 'assets/icons/admin_leave.png', 6),
          buildBNBCards3('Faulty Attendence', 'assets/icons/faulty_attendence.png', 6),
          buildBNBCards3('Bench List', 'assets/icons/benchlist.png', 7),
          buildBNBCards3('Related Sites', 'assets/icons/related_site.png', 8),

        ],
        )

        // Icon(
        //   isMe ? Icons.face : Icons.tag_faces,
        //   color: Colors.white,
        // ),
      ),
    );
  }

   buildBNBCards(title,image,index) {
    return Expanded(
      child: InkWell(

        onTap: (){
          setState(() {
            selectedCard = title;
           //  index == 4 ?
           // isMenuOpen ? closeMenu() :
           //    openMenu()
           //      :
            selectedIndex = index;
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

  buildBNBCards2(title,image,index) {




    return Expanded(
      child:
      CustomPopupMenu(
        child: InkWell(
          key: _key,
          onTap: (){
            setState(() {
              selectedCard = title;
              // selectedIndex = index;
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
        menuBuilder: () => GestureDetector(
          child: Center(child: Container(
              width: 100,
              height: 100,
              child: Icon(Icons.add)),),
          onLongPress: () {
            print("onLongPress");
          },
          onTap: () {
            print("onTap");
          },
        ),
        barrierColor: Colors.transparent,
        pressType: PressType.singleClick,
        arrowColor: Colors.blueAccent ,
        position: PreferredPosition.top,
      ),


    );
  }

  buildBNBCards3(title,image,index) {
    return InkWell(

      onTap: (){
        setState(() {
          selectedCard = title;
          //  index == 4 ?
          // isMenuOpen ? closeMenu() :
          //    openMenu()
          //      :
          selectedIndex = index;
        });
      },
      child: Container(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // selectedCard == title ?  Container(
            //
            //   decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: Colors.black,
            //       border: Border.all(color: kgolder,width: 2)
            //   ),
            //   child: Container(
            //       padding: EdgeInsets.all(8),
            //       width: 60,
            //       height: 60,
            //       child: Image.asset(image,fit: BoxFit.fill,)
            //   ),
            // )  :
            Container(

                width: 30,
                height: 30,
                child: Image.asset(image,fit: BoxFit.fill,)),
            Container(
                width: 50,
                height: 30,
                child: Text(title,style: TextStyle(color: kgolder,fontSize: 12,),
                textAlign: TextAlign.center,
                ),alignment:Alignment.center,),
          ],
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