import 'dart:async';

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:demo_nikita/Components/clockWidget.dart';
import 'package:demo_nikita/Components/constants.dart';
import 'package:demo_nikita/Courses/hrenrollcourses.dart';
import 'package:demo_nikita/Courses/requests.dart';
import 'package:demo_nikita/Homepage/mainhomepage.dart';
import 'package:demo_nikita/Related%20sites/related_sites.dart';
import 'package:demo_nikita/Reports/reports.dart';
import 'package:demo_nikita/Services/Services.dart';
import 'package:demo_nikita/demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../BenchList/benchlist_page.dart';
import '../Components/Arrow/arrowclipper.dart';
import '../Components/Arrow/test.dart';
import '../Components/models.dart';
import '../Enquiry.dart';
import '../Leaves/administrative_leave.dart';


class Welcome extends StatefulWidget {
  final UserModel? userModel;
  const Welcome({Key? key, this.userModel}) : super(key: key);

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

//new
//   var selectedBox = 'Home';

  double x = 0.0;
  double y = 0.0;

  var scaling = 1.0;

  bool isDragging = false;
  
  

//new

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

    var height =  MediaQuery.of(context).size.height;

    var width =  MediaQuery.of(context).size.width;

    print('selectedindex = $selectedIndex');

    var listofwidget = [
      Services(userModel: widget.userModel,),
      EnquiryChat(userModel: widget.userModel,),
      MainHomePage(userModel: widget.userModel, function: (){

        setState(() {
          x = 180;
          y = 20;

          scaling = 0.9;
        });

      },),
      Reports(userModel: widget.userModel,),
      Requests(userModel: widget.userModel,),//Leave
      HrEnrollCourses(userModel: widget.userModel,),
      AdminstrativLeave(userModel: widget.userModel,),//Admin,
      Container(),//faulty,
      BenchList(userModel: widget.userModel),//benchlist,
      RelatedSites(userModel: widget.userModel,)
    ];

    return SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(

              color: Colors.black.withOpacity(0.8),
              child: Stack
                (
                children: [
                  builDrawer(),
                  AnimatedContainer(
                    height: Get.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/bg.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    transform: Matrix4.translationValues(x ,y, 0)..scale(scaling),
                    duration: Duration(milliseconds: 400),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          x = 0.0;
                          y = 0.0;
                          scaling = 1.0;
                        });
                      },

                      onHorizontalDragStart: (detail)=>
                      isDragging = true
                      ,
                      onHorizontalDragUpdate: (details){
                        const delta = 1;

                        if(details.delta.dx > delta){
                          setState(() {
                            x = 180;
                            y = 50.0;

                            scaling = 0.8;
                          });
                        }else if(details.delta.dx < -delta){
                          setState(() {
                            x = 0.0;
                            y = -.0;

                            scaling = 1.0;
                          });

                        }
                      },
                      // onVerticalDragStart: (detail) {
                      //   isDragging = true;
                      //   print('dradgdown ${detail}')
                      //
                      // }
                      // ,
                      // onVerticalDragUpdate: (details)
                      // {
                      //   const delta = 1;
                      //
                      //   print(details.delta.dy);
                      //   print(details.delta.dy);
                      //   if(details.delta.dy > delta){
                      //     setState(() {
                      //       // selectedCard = title;
                      //       //  index == 4 ?
                      //       // isMenuOpen ? closeMenu() :
                      //       //    openMenu()
                      //       //      :
                      //       selectedIndex = selectedIndex > listofwidget.length ? 3 :selectedIndex -1;
                      //     });
                      //   }else if(details.delta.dy < -delta){
                      //
                      //     setState(() {
                      //       // selectedCard = title;
                      //       //  index == 4 ?
                      //       // isMenuOpen ? closeMenu() :
                      //       //    openMenu()
                      //       //      :
                      //       selectedIndex = selectedIndex > listofwidget.length ? 3 :selectedIndex +1;
                      //     });
                      //   }
                      //
                      // },


                      child

                          : Scaffold(


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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
          buildBNBCards3('Faulty Attendence', 'assets/icons/faulty_attendence.png', 7),
          buildBNBCards3('Bench List', 'assets/icons/benchlist.png', 8),
          buildBNBCards3('Related Sites', 'assets/icons/related_site.png', 9),

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
             selectedIndex == index ?  Container(

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
              Text(title,style: TextStyle(color: kgolder,fontSize:  selectedIndex == index ? 16 : 14),),
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
                selectedIndex == index ?  Container(

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
                Text(title,style: TextStyle(color: kgolder,fontSize:  selectedIndex == index ? 16 : 14),),
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

  SingleChildScrollView builDrawer() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        width: Get.width,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('',style: TextStyle(
                color: kgolder,fontWeight: FontWeight.w700,
                fontSize: 20
            ),),
            SizedBox(height: 30,),
            builDrawerWidget('Home',2),
            Divider(color: kgolder,height: 20,),
            builDrawerWidget('Services',0),
            Divider(color: kgolder,height: 20,),
            builDrawerWidget('Enquiry',1),
            Divider(color: kgolder,height: 20,),
            builDrawerWidget('Reports',3),
            Divider(color: kgolder,height: 20,),
            builDrawerWidget('Leave Request',4),
            Divider(color: kgolder,height: 20,),
            builDrawerWidget('Courses',5),
            Divider(color: kgolder,height: 20,),
            builDrawerWidget('Admin Leave',6),
            Divider(color: kgolder,height: 20,),
            builDrawerWidget('Faulty Attenden',7),
            Divider(color: kgolder,height: 20,),
            builDrawerWidget('Bench List',8),
            Divider(color: kgolder,height: 20,),
            builDrawerWidget('Related Sites',9),
            Divider(color: kgolder,height: 20,),


          ],
        ),
      ),
    );
  }

   builDrawerWidget(title,index) {
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
        decoration: selectedIndex == index ? BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topLeft: Radius.circular(15)),
          color: Colors.grey.withOpacity(0.5),
          border: Border.all(color: kgolder)
        ) : BoxDecoration(
            // borderRadius: BorderRadius.only(
            //     bottomLeft: Radius.circular(15),
            //     topLeft: Radius.circular(15)),
            // color: Colors.grey.withOpacity(0.5),
            // border: Border.all(color: kgolder)
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
              child: Text(title,style: TextStyle(
                        color: kgolder,fontWeight: FontWeight.w500,
                        fontSize: 18
                    ),),
            ),
          ],
        ),
      ),
    );
  }
}