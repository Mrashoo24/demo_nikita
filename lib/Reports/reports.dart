import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:demo_nikita/Components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../Components/api.dart';
import '../Components/models.dart';

class Reports extends StatefulWidget {
  final UserModel? userModel;

  const Reports({Key? key, this.userModel}) : super(key: key);

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {

  final _allApi = AllApi();

  late String _selectedFilter;
   String? dateSelected;
   String? todateSelected;

  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;

    print('date = $todateSelected');


    return DefaultTabController(
      length: 4,
      child: Builder(
        builder: (context) {
          print('idenc = ${DefaultTabController.of(context)!.index}');

          var currentindex = DefaultTabController.of(context)!.index;
          return Scaffold(
              appBar:AppBar(
                automaticallyImplyLeading: false,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            kblack,
                            kGray
                          ],

                      )
                  ),
                ),
                title: Container(margin:EdgeInsets.only(left: 15),child: Text("Reports",style: TextStyle(color: kgolder),)),
                actions : [


                  Padding(
                    padding:  EdgeInsets.all(15.0),
                    child: Container(
                      height: 10,
                      width: 20,
                      child: CustomPopupMenu(
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
                        arrowColor:  Colors.black54,
                        arrowSize: 15,
                        position: PreferredPosition.bottom,
                        child: Icon(Icons.info,color: kgolder,),
                      ),

                    ),
                  ),

                ],
                titleSpacing: 5,
                shadowColor: Colors.transparent,
              ),
            body: Stack(
              children: [
                Container(
                  height: H,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/bg.jpg"),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      height: 40,
                      decoration: BoxDecoration(
                          color: kgolder,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: Colors.black,width: 2)
                      ),
                      child: TabBar(
                        padding: EdgeInsets.all(2),
                        labelColor: kgolder,
                        indicator: BoxDecoration(
                          color: kGray2,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        unselectedLabelColor: kblack,
                        tabs: [
                          Text("All",style: TextStyle(fontSize: 16,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),
                          Text("Perfect",style: TextStyle(fontSize: 16,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),
                          Text("Early",style: TextStyle(fontSize: 16,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),
                          Text("Late",style: TextStyle(fontSize: 16,fontFamily:'Typo Round',fontWeight: FontWeight.w400),)
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          theme:DatePickerTheme(backgroundColor: kgolder2,doneStyle: TextStyle(color: Colors.black)),

                                          minTime: DateTime.now()
                                              .subtract(const Duration(days: 120)),
                                          maxTime: DateTime(2050, 6, 7), onChanged: (date) {
                                            setState(() {
                                              dateSelected = date.toString();
                                            });
                                          }, onConfirm: (date) {
                                            setState(() {
                                              dateSelected = date.toString();
                                            });
                                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                                    },
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("From"),
                                          SizedBox(height: 10,),
                                          Container(
                                            padding: EdgeInsets.all(5),

                                            decoration: BoxDecoration(
                                                color: kGray2,
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                border: Border.all(color: Colors.black)
                                            ),
                                            child: Row(
                                              children: [
                                                   Text(

                                                  dateSelected == null
                                                      ? "DD-MM-YYYY"
                                                      : DateFormat("yyyy-MM-dd")
                                                      .parse(dateSelected!)
                                                      .day
                                                      .toString() +
                                                      "-" +
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(dateSelected!)
                                                          .month
                                                          .toString() +
                                                      "-" +
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(dateSelected!)
                                                          .year
                                                          .toString()
          ,style: TextStyle(color: kgolder),

                                                )

                                                ,
                                                SizedBox(width: 5,),
                                                CircleAvatar(
                                                    backgroundColor: kgolder,
                                                    minRadius: 5,
                                                    child: Image.asset("assets/icons/dropdown.png",color: kGray2,)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          theme:DatePickerTheme(backgroundColor: kgolder2,doneStyle: TextStyle(color: Colors.black)),

                                          minTime: DateTime.now().subtract(Duration(days: 365)),
                                          maxTime: DateTime(2050, 6, 7), onChanged: (date) {
                                            setState(() {
                                              todateSelected = date.toString();
                                            });
                                          }, onConfirm: (date) {
                                            setState(() {
                                              todateSelected = date.toString();
                                            });
                                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                                    },
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("To"),
                                          SizedBox(height: 10,),
                                          Container(
                                            padding: EdgeInsets.all(5),

                                            decoration: BoxDecoration(
                                                color: kGray2,
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                border: Border.all(color: Colors.black)
                                            ),
                                            child: Row(
                                              children: [
                                                Text(

                                                  todateSelected == null
                                                      ? "DD-MM-YYYY"
                                                      : DateFormat("yyyy-MM-dd")
                                                      .parse(todateSelected!)
                                                      .day
                                                      .toString() +
                                                      "-" +
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(todateSelected!)
                                                          .month
                                                          .toString() +
                                                      "-" +
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(todateSelected!)
                                                          .year
                                                          .toString()
          ,style: TextStyle(color: kgolder),

                                                )

                                                ,
                                                SizedBox(width: 5,),
                                                CircleAvatar(
                                                    backgroundColor: kgolder,
                                                    minRadius: 5,
                                                    child: Image.asset("assets/icons/dropdown.png",color: kGray2,)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),SizedBox(height: 10,),
                              if (dateSelected != null && todateSelected != null)

                                Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 80),
                                  child: FutureBuilder<List<AttendanceReportModel>?>(
                                      future: _allApi.getCheckInHistory(
                                        empId: widget.userModel!.empId,
                                        companyId: widget.userModel!.companyId,
                                        status: currentindex == 0 ? 'perfect' : 'perfect',
                                            // : _selectedFilter == 'Late'
                                            // ? 'late'
                                            // : 'perfect',
                                        fromDate: dateSelected,
                                        toDate: todateSelected,
                                      ),
                                    builder: (context, snapshot) {

                                      if (!snapshot.hasData) {
                                        return kprogressbar;
                                      } else if (snapshot.data!.isEmpty) {
                                        return const Center(
                                          child: Text('Nothing to show.'),
                                        );
                                      }
                                      var checkInHistoryList = snapshot.data;


                                      return ListView.builder(
                                        itemCount: checkInHistoryList!.length,
                                        shrinkWrap: true,
                                        itemBuilder: (BuildContext context, int index) {

                                        return  AnimationConfiguration.staggeredList(
                                            position: index,
                                            duration: const Duration(milliseconds: 700),
                                            child: SlideAnimation(
                                              duration: Duration(milliseconds: 500),
                                              horizontalOffset: 200.0,
                                              child: FadeInAnimation(
                                                child: buildReportContainer(checkInHistoryList[index]),
                                              ),
                                            ),
                                          );



                                        },);
                                    }
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          theme:DatePickerTheme(backgroundColor: kgolder2,doneStyle: TextStyle(color: Colors.black)),

                                          minTime: DateTime.now()
                                              .subtract(const Duration(days: 120)),
                                          maxTime: DateTime(2050, 6, 7), onChanged: (date) {
                                            setState(() {
                                              dateSelected = date.toString();
                                            });
                                          }, onConfirm: (date) {
                                            setState(() {
                                              dateSelected = date.toString();
                                            });
                                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                                    },
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("From"),
                                          SizedBox(height: 10,),
                                          Container(
                                            padding: EdgeInsets.all(5),

                                            decoration: BoxDecoration(
                                                color: kGray2,
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                border: Border.all(color: Colors.black)
                                            ),
                                            child: Row(
                                              children: [
                                                Text(

                                                  dateSelected == null
                                                      ? "DD-MM-YYYY"
                                                      : DateFormat("yyyy-MM-dd")
                                                      .parse(dateSelected!)
                                                      .day
                                                      .toString() +
                                                      "-" +
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(dateSelected!)
                                                          .month
                                                          .toString() +
                                                      "-" +
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(dateSelected!)
                                                          .year
                                                          .toString()
                                                  ,style: TextStyle(color: kgolder),

                                                )

                                                ,
                                                SizedBox(width: 5,),
                                                CircleAvatar(
                                                    backgroundColor: kgolder,
                                                    minRadius: 5,
                                                    child: Image.asset("assets/icons/dropdown.png",color: kGray2,)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      DatePicker.showDatePicker(context,
                                          theme:DatePickerTheme(backgroundColor: kgolder2,doneStyle: TextStyle(color: Colors.black)),

                                          showTitleActions: true,
                                          minTime: DateTime.now().subtract(Duration(days: 365)),
                                          maxTime: DateTime(2050, 6, 7), onChanged: (date) {
                                            setState(() {
                                              todateSelected = date.toString();
                                            });
                                          }, onConfirm: (date) {
                                            setState(() {
                                              todateSelected = date.toString();
                                            });
                                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                                    },
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("To"),
                                          SizedBox(height: 10,),
                                          Container(
                                            padding: EdgeInsets.all(5),

                                            decoration: BoxDecoration(
                                                color: kGray2,
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                border: Border.all(color: Colors.black)
                                            ),
                                            child: Row(
                                              children: [
                                                Text(

                                                  todateSelected == null
                                                      ? "DD-MM-YYYY"
                                                      : DateFormat("yyyy-MM-dd")
                                                      .parse(todateSelected!)
                                                      .day
                                                      .toString() +
                                                      "-" +
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(todateSelected!)
                                                          .month
                                                          .toString() +
                                                      "-" +
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(todateSelected!)
                                                          .year
                                                          .toString()
                                                  ,style: TextStyle(color: kgolder),

                                                )

                                                ,
                                                SizedBox(width: 5,),
                                                CircleAvatar(
                                                    backgroundColor: kgolder,
                                                    minRadius: 5,
                                                    child: Image.asset("assets/icons/dropdown.png",color: kGray2,)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),SizedBox(height: 10,),
                              if (dateSelected != null && todateSelected != null)

                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 80),
                                    child: FutureBuilder<List<AttendanceReportModel>?>(
                                        future: _allApi.getCheckInHistory(
                                          empId: widget.userModel!.empId,
                                          companyId: widget.userModel!.companyId,
                                          status:  'perfect',
                                          // : _selectedFilter == 'Late'
                                          // ? 'late'
                                          // : 'perfect',
                                          fromDate: dateSelected,
                                          toDate: todateSelected,
                                        ),
                                        builder: (context, snapshot) {

                                          if (!snapshot.hasData) {
                                            return kprogressbar;
                                          } else if (snapshot.data!.isEmpty) {
                                            return const Center(
                                              child: Text('Nothing to show.'),
                                            );
                                          }
                                          var checkInHistoryList = snapshot.data;


                                          return ListView.builder(
                                            itemCount: checkInHistoryList!.length,
                                            shrinkWrap: true,
                                            itemBuilder: (BuildContext context, int index) {
                                              return  AnimationConfiguration.staggeredList(
                                                position: index,
                                                duration: const Duration(milliseconds: 700),
                                                child: SlideAnimation(
                                                  duration: Duration(milliseconds: 500),
                                                  horizontalOffset: 200.0,
                                                  child: FadeInAnimation(
                                                    child: buildReportContainer(checkInHistoryList[index]),
                                                  ),
                                                ),
                                              );



                                            },);
                                        }
                                    ),
                                  ),
                                )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      DatePicker.showDatePicker(context,
                                          theme:DatePickerTheme(backgroundColor: kgolder2,doneStyle: TextStyle(color: Colors.black)),

                                          showTitleActions: true,
                                          minTime: DateTime.now()
                                              .subtract(const Duration(days: 120)),
                                          maxTime: DateTime(2050, 6, 7), onChanged: (date) {
                                            setState(() {
                                              dateSelected = date.toString();
                                            });
                                          }, onConfirm: (date) {
                                            setState(() {
                                              dateSelected = date.toString();
                                            });
                                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                                    },
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("From"),
                                          SizedBox(height: 10,),
                                          Container(
                                            padding: EdgeInsets.all(5),

                                            decoration: BoxDecoration(
                                                color: kGray2,
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                border: Border.all(color: Colors.black)
                                            ),
                                            child: Row(
                                              children: [
                                                Text(

                                                  dateSelected == null
                                                      ? "DD-MM-YYYY"
                                                      : DateFormat("yyyy-MM-dd")
                                                      .parse(dateSelected!)
                                                      .day
                                                      .toString() +
                                                      "-" +
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(dateSelected!)
                                                          .month
                                                          .toString() +
                                                      "-" +
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(dateSelected!)
                                                          .year
                                                          .toString()
                                                  ,style: TextStyle(color: kgolder),

                                                )

                                                ,
                                                SizedBox(width: 5,),
                                                CircleAvatar(
                                                    backgroundColor: kgolder,
                                                    minRadius: 5,
                                                    child: Image.asset("assets/icons/dropdown.png",color: kGray2,)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      DatePicker.showDatePicker(context,
                                          theme:DatePickerTheme(backgroundColor: kgolder2,doneStyle: TextStyle(color: Colors.black)),

                                          showTitleActions: true,
                                          minTime: DateTime.now().subtract(Duration(days: 365)),
                                          maxTime: DateTime(2050, 6, 7), onChanged: (date) {
                                            setState(() {
                                              todateSelected = date.toString();
                                            });
                                          }, onConfirm: (date) {
                                            setState(() {
                                              todateSelected = date.toString();
                                            });
                                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                                    },
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("To"),
                                          SizedBox(height: 10,),
                                          Container(
                                            padding: EdgeInsets.all(5),

                                            decoration: BoxDecoration(
                                                color: kGray2,
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                border: Border.all(color: Colors.black)
                                            ),
                                            child: Row(
                                              children: [
                                                Text(

                                                  todateSelected == null
                                                      ? "DD-MM-YYYY"
                                                      : DateFormat("yyyy-MM-dd")
                                                      .parse(todateSelected!)
                                                      .day
                                                      .toString() +
                                                      "-" +
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(todateSelected!)
                                                          .month
                                                          .toString() +
                                                      "-" +
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(todateSelected!)
                                                          .year
                                                          .toString()
                                                  ,style: TextStyle(color: kgolder),

                                                )

                                                ,
                                                SizedBox(width: 5,),
                                                CircleAvatar(
                                                    backgroundColor: kgolder,
                                                    minRadius: 5,
                                                    child: Image.asset("assets/icons/dropdown.png",color: kGray2,)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Icon(Icons.abc_sharp),
                                  // Icon(Icons.star)
                                ],
                              ),SizedBox(height: 10,),
                              if (dateSelected != null && todateSelected != null)

                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      bottom: 80
                                    ),
                                    child: FutureBuilder<List<AttendanceReportModel>?>(
                                        future: _allApi.getCheckInHistory(
                                          empId: widget.userModel!.empId,
                                          companyId: widget.userModel!.companyId,
                                          status:  'early',
                                          // : _selectedFilter == 'Late'
                                          // ? 'late'
                                          // : 'perfect',
                                          fromDate: dateSelected,
                                          toDate: todateSelected,
                                        ),
                                        builder: (context, snapshot) {

                                          if (!snapshot.hasData) {
                                            return kprogressbar;
                                          } else if (snapshot.data!.isEmpty) {
                                            return const Center(
                                              child: Text('Nothing to show.'),
                                            );
                                          }
                                          var checkInHistoryList = snapshot.data;


                                          return ListView.builder(
                                            itemCount: checkInHistoryList!.length,
                                            shrinkWrap: true,
                                            itemBuilder: (BuildContext context, int index) {
                                              return  AnimationConfiguration.staggeredList(
                                                position: index,
                                                duration: const Duration(milliseconds: 700),
                                                child: SlideAnimation(
                                                  duration: Duration(milliseconds: 500),
                                                  horizontalOffset: 200.0,
                                                  child: FadeInAnimation(
                                                    child:buildReportContainer(checkInHistoryList[index]),
                                                  ),
                                                ),
                                              );



                                            },);
                                        }
                                    ),
                                  ),
                                )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          theme:DatePickerTheme(backgroundColor: kgolder2,doneStyle: TextStyle(color: Colors.black)),

                                          minTime: DateTime.now()
                                              .subtract(const Duration(days: 120)),
                                          maxTime: DateTime(2050, 6, 7), onChanged: (date) {
                                            setState(() {
                                              dateSelected = date.toString();
                                            });
                                          }, onConfirm: (date) {
                                            setState(() {
                                              dateSelected = date.toString();
                                            });
                                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                                    },
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("From"),
                                          SizedBox(height: 10,),
                                          Container(
                                            padding: EdgeInsets.all(5),

                                            decoration: BoxDecoration(
                                                color: kGray2,
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                border: Border.all(color: Colors.black)
                                            ),
                                            child: Row(
                                              children: [
                                                Text(

                                                  dateSelected == null
                                                      ? "DD-MM-YYYY"
                                                      : DateFormat("yyyy-MM-dd")
                                                      .parse(dateSelected!)
                                                      .day
                                                      .toString() +
                                                      "-" +
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(dateSelected!)
                                                          .month
                                                          .toString() +
                                                      "-" +
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(dateSelected!)
                                                          .year
                                                          .toString()
                                                  ,style: TextStyle(color: kgolder),

                                                )

                                                ,
                                                SizedBox(width: 5,),
                                                CircleAvatar(
                                                    backgroundColor: kgolder,
                                                    minRadius: 5,
                                                    child: Image.asset("assets/icons/dropdown.png",color: kGray2,)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          theme:DatePickerTheme(backgroundColor: kgolder2,doneStyle: TextStyle(color: Colors.black)),

                                          minTime: DateTime.now().subtract(Duration(days: 365)),
                                          maxTime: DateTime(2050, 6, 7), onChanged: (date) {
                                            setState(() {
                                              todateSelected = date.toString();
                                            });
                                          }, onConfirm: (date) {
                                            setState(() {
                                              todateSelected = date.toString();
                                            });
                                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                                    },
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("To"),
                                          SizedBox(height: 10,),
                                          Container(
                                            padding: EdgeInsets.all(5),

                                            decoration: BoxDecoration(
                                                color: kGray2,
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                border: Border.all(color: Colors.black)
                                            ),
                                            child: Row(
                                              children: [
                                                Text(

                                                  todateSelected == null
                                                      ? "DD-MM-YYYY"
                                                      : DateFormat("yyyy-MM-dd")
                                                      .parse(todateSelected!)
                                                      .day
                                                      .toString() +
                                                      "-" +
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(todateSelected!)
                                                          .month
                                                          .toString() +
                                                      "-" +
                                                      DateFormat("yyyy-MM-dd")
                                                          .parse(todateSelected!)
                                                          .year
                                                          .toString()
                                                  ,style: TextStyle(color: kgolder),

                                                )

                                                ,
                                                SizedBox(width: 5,),
                                                CircleAvatar(
                                                    backgroundColor: kgolder,
                                                    minRadius: 5,
                                                    child: Image.asset("assets/icons/dropdown.png",color: kGray2,)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),SizedBox(height: 10,),
                              if (dateSelected != null && todateSelected != null)

                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 80),
                                    child: FutureBuilder<List<AttendanceReportModel>?>(
                                        future: _allApi.getCheckInHistory(
                                          empId: widget.userModel!.empId,
                                          companyId: widget.userModel!.companyId,
                                          status:  'late',
                                          // : _selectedFilter == 'Late'
                                          // ? 'late'
                                          // : 'perfect',
                                          fromDate: dateSelected,
                                          toDate: todateSelected,
                                        ),
                                        builder: (context, snapshot) {

                                          if (!snapshot.hasData) {
                                            return kprogressbar;
                                          } else if (snapshot.data!.isEmpty) {
                                            return const Center(
                                              child: Text('Nothing to show.'),
                                            );
                                          }
                                          var checkInHistoryList = snapshot.data;


                                          return ListView.builder(
                                            itemCount: checkInHistoryList!.length,
                                            shrinkWrap: true,
                                            itemBuilder: (BuildContext context, int index) {
                                              return  AnimationConfiguration.staggeredList(
                                                position: index,
                                                duration: const Duration(milliseconds: 700),
                                                child: SlideAnimation(
                                                  duration: Duration(milliseconds: 500),
                                                  horizontalOffset: 200.0,
                                                  child: FadeInAnimation(
                                                    child:buildReportContainer(checkInHistoryList[index]),
                                                  ),
                                                ),
                                              );



                                            },);
                                        }
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )

          );
        }
      ),
    );
  }

  Container buildReportContainer(AttendanceReportModel checkInHistoryList) {
    return Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            kGray,kblack
                          ]
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: kgolder,width: 3)
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 6,right: 6,top: 5,bottom: 5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    kgradientYellow,kgolder
                                  ],
                                stops: [
                                  0.1,
                                  1.3
                                ]
                              ),
                            ),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Date : ${checkInHistoryList.date}"),
                                Row(
                                  children: [
                                    Container(height: 20,width: 1.3,color: kblack,),
                                    SizedBox(width: 10,),
                                    Text("OT:${checkInHistoryList.checkOutDifference} Hrs")
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Check In:",style: TextStyle(color: kgolder),),
                              Container(
                                padding: EdgeInsets.only(top: 4,bottom: 4,right: 8,left: 8),
                                decoration: BoxDecoration(
                                  color: checkInHistoryList.status == 'late' ? kred : kGreen,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: Colors.black)
                                ),
                                child: Text("${checkInHistoryList.checkInTime}"),
                              ),
                              Text("Check Out:",style: TextStyle(color: kgolder)),
                              Container(
                                padding: EdgeInsets.only(top: 4,bottom: 4,right: 8,left: 8),
                                decoration: BoxDecoration(
                                    color:checkInHistoryList.workingstatus == 'early' ? kred : kGreen,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(color: Colors.black)
                                ),
                                child: Text("${checkInHistoryList.checkOutTime}"),
                              )
                            ],
                          ),
                          SizedBox(height: 15,)
                        ],
                      ),
                    );
  }
  Widget _buildAvatar(bool isMe, double size) {
    return
      ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child:
        Container(

            decoration: BoxDecoration(

                color:  Colors.black.withOpacity(0.8) ,
                border: Border.all(color: kgolder,width: 3),
                borderRadius: BorderRadius.circular(10)
            ),
            width: Get.width*0.6,
            // height: Get.height*0.15,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text("Check In",style: TextStyle(color: kgolder),),
                        SizedBox(height: 15),

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: kblack),
                            color: kgolder,
                            borderRadius: BorderRadius.all(Radius.circular(9),),
                          ),
                          child: Padding(
                            padding:   EdgeInsets.only(left: 7.4,right: 7.4,top: 4,bottom: 4),
                            child: Text("Perfect",style: TextStyle(fontSize: 15),),
                          ),

                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: kblack),
color: kGreen,
                            borderRadius: BorderRadius.all(Radius.circular(9),),
                          ),
                          child: Padding(
                            padding:   EdgeInsets.only(left: 14,right: 14,top: 4,bottom: 4),
                            child: Text("Early",style: TextStyle(fontSize: 15),),
                          ),

                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: kblack),
                            color: kred,
                            borderRadius: BorderRadius.all(Radius.circular(9),),
                          ),
                          child: Padding(
                            padding:   EdgeInsets.only(left: 15.5,right: 15.5,top: 4,bottom: 4),
                            child: Text("Late",style: TextStyle(fontSize: 15),),
                          ),

                        ),

                      ],
                    ),
                     Container(

                         height: Get.height*0.2,
                         width: 3,
                       decoration: BoxDecoration(
                           gradient: LinearGradient(
                             begin: Alignment.topCenter,
                             end: Alignment.bottomCenter,
                             colors: [
                               kgolder,
                               kgradientYellow,
                               kgolder
                             ],

                           )
                       ),
                         //child: VerticalDivider(color: kgolder,thickness: 2,endIndent: 5,indent: 5,)
                     ),
                    Column(
                      children: [
                        Text("Check Out",style: TextStyle(color: kgolder),),
                        SizedBox(height: 15),

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: kblack),
                            color: kgolder,
                            borderRadius: BorderRadius.all(Radius.circular(9),),
                          ),
                          child: Padding(
                            padding:   EdgeInsets.only(left: 7.4,right: 7.4,top: 4,bottom: 4),
                            child: Text("Perfect",style: TextStyle(fontSize: 15),),
                          ),

                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: kblack),
                            color: kred,
                            borderRadius: BorderRadius.all(Radius.circular(9),),
                          ),
                          child: Padding(
                            padding:   EdgeInsets.only(left: 14,right: 14,top: 4,bottom: 4),
                            child: Text("Early",style: TextStyle(fontSize: 15),),
                          ),

                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: kblack),
                            color: kGreen,
                            borderRadius: BorderRadius.all(Radius.circular(9),),
                          ),
                          child: Padding(
                            padding:   EdgeInsets.only(left: 15.5,right: 15.5,top: 4,bottom: 4),
                            child: Text("Late",style: TextStyle(fontSize: 15),),
                          ),

                        ),

                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text("OT: Over Time",style: TextStyle(color: kgolder ),)
              ],
            ),
          ),

          // Icon(
          //   isMe ? Icons.face : Icons.tag_faces,
          //   color: Colors.white,
          // ),
        ),
      );
  }

}
