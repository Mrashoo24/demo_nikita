import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../Components/api.dart';
import '../Components/constants.dart';
import '../Components/models.dart';

class Requests extends StatefulWidget {
  final UserModel? userModel;

  const Requests({Key? key, this.userModel}) : super(key: key);

  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {

  double screenHeight = 0;
  double screenWidth = 0;

  int _selectedValue = 0;

  var textFieldValues = [];
  var _selectedFromDate = '';
  var _selectedToDate = '';

  final List _filters = [
    'Pending',
    'Accepted',
    'Rejected',
  ];

  String _selectedFilter = 'Pending';
  late List<EmployeeLeaveRequestsModel> _historyList;

   File? _attachment;
  late PlatformFile _attachmentPlatformFile;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _trySubmit() {
    var _isValid = _formkey.currentState!.validate();
    if (_isValid) {
      FocusScope.of(context).unfocus();
      _formkey.currentState!.save();
    }
    return _isValid;
  }




  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: DefaultTabController(
          length: 2,
          child: Scaffold(

            body: Container(
              decoration: BoxDecoration(
                gradient:  LinearGradient(
                  colors: [kgolder, Colors.yellow.shade100 ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,),

              ),
              child: Column(
                children: [
                  Container(
                    height: screenHeight / 5.5,
                    width: Get.width,
                    decoration: BoxDecoration(
                      gradient:  LinearGradient(
                        colors: [Colors.black, Colors.grey.shade600],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                    child: Container(

                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Row(
                            children: [
                              // SizedBox( width: 10,),
                              // Icon(Icons.arrow_back,color: kgolder,),
                              SizedBox(width: 15),
                              Text("Leaves Request",style: TextStyle(color: kgolder,fontSize: 18),)
                            ],
                          ),
                          SizedBox(height: 8,),
                          Padding(
                            padding:   EdgeInsets.all(8.0),
                            child: TabBar(

                              labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight:FontWeight.w600),
                              labelColor: Colors.black,
                              unselectedLabelColor:  kgolder,
                              indicator: BoxDecoration(
                                  color: kgolder,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(12),
                                      bottomLeft: Radius.circular(12))
                              ),
                              tabs: [
                                Tab(child: Text("Request",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),),
                                // Tab(child: Text("Request",style: TextStyle(fontSize: 16),),),
                                Tab(child: Text("History",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),),
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),

                  ),
                  Container(

                    child: Expanded(

                      child: TabBarView(
                          children: [

                            buildRequestView(),

                            // ListView(
                            //   children: [
                            //     Requests("Personal Leaves"),
                            //
                            //   ],
                            // ),
                            DefaultTabController(
                                length: 3,
                                child: Scaffold(
                                    appBar: AppBar(
                                      automaticallyImplyLeading: false,
                                        shadowColor: Colors.transparent,
                                        flexibleSpace: Stack(
                                          children: [
                                            Container(
                                              height: screenHeight*0.5,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/bg.jpg"),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(8),
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: kgolder,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10)
                                                  ),
                                                  border: Border.all(color: kblack,width: 2)
                                              ),
                                              child: TabBar(
                                                padding: EdgeInsets.all(2),
                                                labelColor: kgolder,
                                                indicator: BoxDecoration(
                                                  color: kGray2,
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                unselectedLabelColor: kblack,
                                                tabs: [
                                                  Text("Pending"),
                                                  Text("Accepted"),
                                                  Text("Rejected",style: TextStyle(fontSize: 13),)
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    body:TabBarView(
                                      children: [
                                        Container(
                                          height: screenHeight,
                                          width: screenWidth,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage("assets/bg.jpg"),
                                                  fit: BoxFit.cover
                                              )
                                          ),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: FutureBuilder<List<EmployeeLeaveRequestsModel>?>(
                                                    future: AllApi().getEmployeeLeaveRequests(
                                                      refId: widget.userModel!.refId,
                                                      verify: '0',
                                                    ),
                                                  builder: (context, snapshot) {

                                                    if (!snapshot.hasData) {
                                                      return kprogressbar;
                                                    } else if (snapshot.data!.isEmpty) {
                                                      return const Center(
                                                        child: Text('Nothing to show here.'),
                                                      );
                                                    }
                                                    var list = snapshot.requireData;

                                                    return ListView.builder(
                                                      itemCount: list!.length,
                                                      itemBuilder: (BuildContext context, int index) {
                                                        return  AnimationConfiguration.staggeredList(
                                                          position: index,
                                                          duration: const Duration(milliseconds: 700),
                                                          child: SlideAnimation(
                                                            duration: Duration(milliseconds: 500),
                                                            horizontalOffset: 200.0,
                                                            child: FadeInAnimation(
                                                              child:buildCertificateName(list[index]),
                                                            ),
                                                          ),
                                                        );


                                                      },

                                                    );
                                                  }
                                                ),
                                              ),
                                              SizedBox(height: 80,)
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: screenHeight,
                                          width: screenWidth,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage("assets/bg.jpg"),
                                                  fit: BoxFit.cover
                                              )
                                          ),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: FutureBuilder<List<EmployeeLeaveRequestsModel>?>(
                                                    future: AllApi().getEmployeeLeaveRequests(
                                                      refId: widget.userModel!.refId,
                                                      verify: '1',
                                                    ),
                                                    builder: (context, snapshot) {

                                                      if (!snapshot.hasData) {
                                                        return kprogressbar;
                                                      } else if (snapshot.data!.isEmpty) {
                                                        return const Center(
                                                          child: Text('Nothing to show here.'),
                                                        );
                                                      }
                                                      var list = snapshot.requireData;

                                                      return ListView.builder(
                                                        itemCount: list!.length,
                                                        itemBuilder: (BuildContext context, int index) {
                                                          return  AnimationConfiguration.staggeredList(
                                                            position: index,
                                                            duration: const Duration(milliseconds: 700),
                                                            child: SlideAnimation(
                                                              duration: Duration(milliseconds: 500),
                                                              horizontalOffset: 200.0,
                                                              child: FadeInAnimation(
                                                                child:buildCertificateName(list[index]),
                                                              ),
                                                            ),
                                                          );
                                                          return buildCertificateName(list[index]);

                                                        },

                                                      );
                                                    }
                                                ),
                                              ),
                                              SizedBox(height: 80,)
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: screenHeight,
                                          width: screenWidth,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage("assets/bg.jpg"),
                                                  fit: BoxFit.cover
                                              )
                                          ),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: FutureBuilder<List<EmployeeLeaveRequestsModel>?>(
                                                    future: AllApi().getEmployeeLeaveRequests(
                                                      refId: widget.userModel!.refId,
                                                      verify: '-1',
                                                    ),
                                                    builder: (context, snapshot) {

                                                      if (!snapshot.hasData) {
                                                        return kprogressbar;
                                                      } else if (snapshot.data!.isEmpty) {
                                                        return const Center(
                                                          child: Text('Nothing to show here.'),
                                                        );
                                                      }
                                                      var list = snapshot.requireData;

                                                      return ListView.builder(
                                                        itemCount: list!.length,
                                                        itemBuilder: (BuildContext context, int index) {
                                                          return  AnimationConfiguration.staggeredList(
                                                            position: index,
                                                            duration: const Duration(milliseconds: 700),
                                                            child: SlideAnimation(
                                                              duration: Duration(milliseconds: 500),
                                                              horizontalOffset: 200.0,
                                                              child: FadeInAnimation(
                                                                child: buildCertificateName(list[index]),
                                                              ),
                                                            ),
                                                          );


                                                        },

                                                      );
                                                    }
                                                ),
                                              ),
                                              SizedBox(height: 80,)
                                            ],
                                          ),
                                        ),

                                      ],
                                    )
                                )),


                          ]
                      ),
                    ),

                  ),
                ],
              ),
            ),
          )
      ),
    );
  }

   buildRequestView() {
    return FutureBuilder<List<LeaveRequestsModel>?>(
      future: AllApi().getLeaveRequests(widget.userModel!.companyId!),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return kprogressbar;
        } else {
          var leaveRequests = snapshot.data;
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                // const Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: Text(
                //     'Select reason for your leave request: ',
                //     style: TextStyle(
                //       fontSize: 22,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: leaveRequests!.length,
                    itemBuilder: (context, index) {
                      return  AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 700),
                        child: SlideAnimation(
                          duration: Duration(milliseconds: 500),
                          horizontalOffset: 200.0,
                          child: FadeInAnimation(
                            child: _radioListTile(
                              title: leaveRequests[index].title!,
                              subtitle: leaveRequests[index].subtitle!,
                              value: index + 1,
                              details: leaveRequests[index].details!,
                              attachments: leaveRequests[index].attachments,
                              leaves: leaveRequests[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }


  Widget _radioListTile(
      {required String title,
        required String subtitle,
        required int value,
        required List details,
        List? attachments,
        LeaveRequestsModel? leaves}) {
    return FutureBuilder(
        future: AllApi().getLeavesCount(
            title: title,
            verify: '1',
            companyid: widget.userModel!.companyId,
            refid: widget.userModel!.refId,
            financial_month: leaves!.financial_month),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text('Please Wait Fetching Details'));
          } else {

            List<EmployeeLeaveRequestsModel> leavedata =
                snapshot.requireData as List<EmployeeLeaveRequestsModel>;

            return Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),topLeft: Radius.circular(15)),
               gradient: LinearGradient(
                           begin: Alignment.topRight,
                           end: Alignment.bottomLeft,
                           colors: [
                             kblack ,
                             kGray2
                           ]
                         ),
              ),


              child: RadioListTile(
                tileColor: Colors.black.withOpacity(0.4),
                activeColor: kgolder,
                secondary: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(kgolder),
                  ),
                  child: const Text('Details',style: TextStyle(color: Colors.black),),
                  onPressed: value == _selectedValue
                      ? () async {


                    var year1 = DateTime(DateTime.now().year,
                        int.parse(leaves.financial_month!));
                    var year2 = DateTime(DateTime.now().year - 1,
                        int.parse(leaves.financial_month!) - 1);

                    // var quarteerly  = DateTime(DateTime.now().year,int.parse(financial_month));

                    var month1 = DateTime(
                        DateTime.now().year, DateTime.now().month + 1);
                    var month2 =
                    DateTime(DateTime.now().year, DateTime.now().month);

                    print('year1 $year1');
                    print('year2 $year2');
                    print('month1 $month1');
                    print('month2 $month2');

                    if (leaves.tenure == 'yearly') {
                      leavedata = leavedata.where((element) {
                        return DateFormat('dd/MM/yyyy hh:mm a')
                            .parse(element.from!)
                            .isAfter(year2) &&
                            DateFormat('dd/MM/yyyy hh:mm a')
                                .parse(element.from!)
                                .isBefore(year1);
                      }).toList();

                      // print('leavedata ${leavedata[0].title}');

                      var totalLeaveHours = 0;

                      await Future.forEach(leavedata, (EmployeeLeaveRequestsModel element) {
                        totalLeaveHours += DateFormat('dd/MM/yyyy hh:mm a')
                            .parse(element.to!)
                            .difference(DateFormat('dd/MM/yyyy hh:mm a')
                            .parse(element.from!))
                            .inHours;
                      });

                      print('totalLeave ${totalLeaveHours}');

                      var remainingHours =
                      (double.parse(leaves.hourslimit!) -
                          totalLeaveHours)
                          .round();

                      _onPressedDetails(
                          details: details,
                          title: title,
                          attachments: attachments ?? [],
                          timebased: leaves.tenure!,
                          countbased: leaves.countbased!,
                          limit: leaves.limit!,
                          hourslimit: leaves.hourslimit!,
                          reducedtime: leaves.reducedtime!,
                          tenure: leaves.tenure!,
                          totalCountConsumed: leavedata.length.toString(),
                          totalLeaveHours: totalLeaveHours.toString(),
                          remainingHours: remainingHours.toString(),leavedata:leavedata
                      );

                    } else {
                      print('leavedata ${month1}');

                      leavedata = leavedata.where((element) {
                        return DateFormat('dd/MM/yyyy hh:mm a')
                            .parse(element.from!)
                            .isAfter(month2) &&
                            DateFormat('dd/MM/yyyy hh:mm a')
                                .parse(element.from!)
                                .isBefore(month1);
                      }).toList();

                      var totalLeaveHours = 0;

                      await Future.forEach(leavedata, (EmployeeLeaveRequestsModel element) {
                        totalLeaveHours += DateFormat('dd/MM/yyyy hh:mm a')
                            .parse(element.to!)
                            .difference(DateFormat('dd/MM/yyyy hh:mm a')
                            .parse(element.from!))
                            .inHours;
                      });

                      print('totalLeave ${totalLeaveHours}');

                      var remainingHours =
                      (double.parse(leaves.hourslimit!) -
                          totalLeaveHours)
                          .round();

                      _onPressedDetails(
                          details: details,
                          title: title,
                          attachments: attachments!,
                          timebased: leaves.tenure!,
                          countbased: leaves.countbased!,
                          limit: leaves.limit!,
                          hourslimit: leaves.hourslimit!,
                          reducedtime: leaves.reducedtime!,
                          tenure: leaves.tenure!,
                          totalCountConsumed: leavedata.length.toString(),
                          totalLeaveHours: totalLeaveHours.toString(),
                          remainingHours: remainingHours.toString(),leavedata:leavedata);
                    }
                  }
                      : null,
                ),
                value: value,
                title: Text(
                  title,style: TextStyle(fontWeight: FontWeight.w600,color: kgolder),
                ),
                subtitle: Column(
                  children: [
                    Text(
                      subtitle,
                    style: TextStyle(fontWeight: FontWeight.w600,color: kgolder),
                    ),
                    Text(
                      'Total Consumed: ${leavedata.length.toString()}',
                        style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
                    ),
                  ],
                ),
                groupValue: _selectedValue,
                onChanged: (value) => setState(
                      () {
                    _selectedValue = value as int;
                  },
                ),
              ),
            );
          }
        });
  }

  void _onPressedDetails(
      {required List details,
        required String title,
        required List attachments,
        required String tenure,
        required String limit,
        required  String timebased,
        required  String reducedtime,
        required  String countbased,
        required   String hourslimit,
        required   String totalLeaveHours,
        required   String remainingHours,
        required   String totalCountConsumed,required List<EmployeeLeaveRequestsModel> leavedata}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        var isLoading = false;
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              backgroundColor: Colors.black,
              title: isLoading ? null : const Text('Details',style: TextStyle(color: kgolder),),
              content: isLoading
                  ? Container(
                height: MediaQuery.of(context).size.height * 0.05,
                alignment: Alignment.center,
                child: Row(
                  children: const [
                    CircularProgressIndicator(color: kgolder,),
                    SizedBox(
                      width: 30,
                    ),
                    Text('Please wait',style: TextStyle(color: kgolder),),
                  ],
                ),
              )
                  : SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Text('Number of Count: $totalCountConsumed',style: TextStyle(color: kgolder),),
                      limit == '0'
                          ? SizedBox()
                          : Text(
                          'Leaves Pending: ${(double.parse(limit) - double.parse(totalCountConsumed)).round()}',style: TextStyle(color: kgolder),),
                      hourslimit == '0'
                          ? SizedBox()
                          : Text(
                          'Total Hours Consumed: $totalLeaveHours',style: TextStyle(color: kgolder),),
                      hourslimit == '0'
                          ? SizedBox()
                          : Text(
                          'Total Hours Remaining: $remainingHours',style: TextStyle(color: kgolder),),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: _selectedFromDate == ''
                                      ? 'From'
                                      : _selectedFromDate,
                                  hintStyle: const TextStyle(
                                    color: kgolder,
                                  ),
                                ),
                              ),
                              onTap: () {
                                DatePicker.showDateTimePicker(
                                  context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  maxTime: DateTime(2050, 6, 7),
                                  onChanged: (date) {
                                    setStateDialog(() {
                                      _selectedFromDate =
                                          DateFormat('dd/MM/yyyy hh:mm a')
                                              .format(date);
                                    });
                                  },
                                  onConfirm: (date) {
                                    setStateDialog(() {
                                      _selectedFromDate =
                                          DateFormat('dd/MM/yyyy hh:mm a')
                                              .format(date);
                                    });
                                  },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en,
                                );
                              },
                            ),
                            InkWell(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: _selectedToDate == ''
                                      ? 'To'
                                      : _selectedToDate,
                                  hintStyle: const TextStyle(
                                    color: kgolder,
                                  ),
                                ),
                                enabled: false,
                              ),
                              onTap: () {
                                DatePicker.showDateTimePicker(
                                  context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  maxTime: DateTime(2050, 6, 7),
                                  onChanged: (date) {
                                    setStateDialog(() {
                                      _selectedToDate =
                                          DateFormat('dd/MM/yyyy hh:mm a')
                                              .format(date);
                                    });
                                  },
                                  onConfirm: (date) {
                                    setStateDialog(() {
                                      _selectedToDate =
                                          DateFormat('dd/MM/yyyy hh:mm a')
                                              .format(date);
                                    });
                                  },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      if (details.isNotEmpty)
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height:
                          MediaQuery.of(context).size.height * 0.25,
                          child: ListView.builder(
                            itemCount: details.length,
                            itemBuilder: (ctx, index) {
                             return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 700),
                                child: SlideAnimation(
                                  duration: Duration(milliseconds: 500),
                                  horizontalOffset: 200.0,
                                  child: FadeInAnimation(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          hintText: details[index],
                                          hintStyle: TextStyle(color: kgolder),
                                          border: UnderlineInputBorder(borderSide: BorderSide(color: kgolder)),
                                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: kgolder))
                                          ,
                                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: kgolder))
                                          ,
                                          disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: kgolder))

                                      ),
                                      style: TextStyle(color: kgolder),
                                      onSaved: (value) {
                                        textFieldValues.add(value);
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please fill out this field';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              );

                            },
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (attachments.isNotEmpty)
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text('Attachments',style: TextStyle(color: kgolder),),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (attachments.isNotEmpty && _attachment == null)
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height:
                          MediaQuery.of(context).size.height * 0.25,
                          child: InkWell(
                            child: ListView.builder(
                              itemCount: attachments.length,
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 700),
                                  child: SlideAnimation(
                                    duration: Duration(milliseconds: 500),
                                    horizontalOffset: 200.0,
                                    child: FadeInAnimation(
                                      child:TextFormField(
                                        enabled: false,
                                        decoration: InputDecoration(
                                            hintText: attachments[index],
                                            hintStyle: TextStyle(color: kgolder),
                                            border: UnderlineInputBorder(borderSide: BorderSide(color: kgolder)),
                                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: kgolder))
                                            ,
                                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: kgolder))
                                            ,
                                            disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: kgolder))
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            onTap: () async {
                              final result =
                              await FilePicker.platform.pickFiles();
                              if (result == null) {
                                return;
                              } else {
                                final file = result.files.first;
                                final newFile = await saveFile(file);
                                setStateDialog(() {
                                  _attachment = newFile;
                                  _attachmentPlatformFile = file;
                                });
                              }
                            },
                          ),
                        ),
                      if (_attachment != null && attachments.isNotEmpty)
                        _buildFile(),
                    ],
                  ),
                ),
              ),
              actions: isLoading
                  ? null
                  : [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kgolder)
                  ),
                  onPressed: () async {
                    var requestId =
                        'REQ' + DateTime.now().microsecond.toString();
                    var _canSubmit = _trySubmit();
                    if (attachments.isEmpty) {
                      if (_canSubmit &&
                          (_selectedFromDate != '' &&
                              _selectedToDate != '')) {
                        setStateDialog(() {
                          isLoading = true;
                        });

                        if (countbased == '1') {
                          if (double.parse(totalCountConsumed) <
                              double.parse(limit)) {
                            if (hourslimit == '0') {
                              print('no limits');

                              sendLeaveRequest(requestId, title);
                            } else {
                              if (double.parse(totalLeaveHours) <
                                  double.parse(hourslimit)) {
                                print(
                                    'difeerence ${DateFormat('dd/MM/yyyy hh:mm a').parse(_selectedToDate).difference(DateFormat('dd/MM/yyyy hh:mm a').parse(_selectedFromDate)).inHours}');

                                if (DateFormat('dd/MM/yyyy hh:mm a')
                                    .parse(_selectedToDate)
                                    .difference(DateFormat(
                                    'dd/MM/yyyy hh:mm a')
                                    .parse(_selectedFromDate))
                                    .inHours <
                                    double.parse(hourslimit)) {
                                  sendLeaveRequest(requestId, title);
                                } else {
                                  setStateDialog(() {
                                    isLoading = false;
                                  });

                                  Fluttertoast.showToast(
                                      msg: 'Exceeding Hours Limit');
                                }
                              } else {
                                setStateDialog(() {
                                  isLoading = false;
                                });

                                Fluttertoast.showToast(
                                    msg: 'Hours Limit Exhausted');
                              }
                            }
                          } else {
                            setStateDialog(() {
                              isLoading = false;
                            });
                            Fluttertoast.showToast(
                                msg: 'Count Limit Exhausted');
                          }
                        } else {
                          if (hourslimit == '0') {
                            sendLeaveRequest(requestId, title);
                          } else {
                            if (double.parse(totalLeaveHours) <
                                double.parse(hourslimit)) {
                              print(
                                  'difeerence ${DateFormat('dd/MM/yyyy hh:mm a').parse(_selectedToDate).difference(DateFormat('dd/MM/yyyy hh:mm a').parse(_selectedFromDate)).inHours}');

                              if (DateFormat('dd/MM/yyyy hh:mm a')
                                  .parse(_selectedToDate)
                                  .difference(
                                  DateFormat('dd/MM/yyyy hh:mm a')
                                      .parse(_selectedFromDate))
                                  .inHours <
                                  double.parse(hourslimit)) {
                                sendLeaveRequest(requestId, title);
                              } else {
                                setStateDialog(() {
                                  isLoading = false;
                                });

                                Fluttertoast.showToast(
                                    msg: 'Exceeding Hours Limit');
                              }
                            } else {
                              setStateDialog(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: 'Hours Limit Exhausted');
                            }
                          }
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill all the details.'),
                          ),
                        );
                      }
                    } else {
                      if (_attachment != null) {
                        if (_canSubmit &&
                            (_selectedFromDate != '' &&
                                _selectedToDate != '')) {
                          setStateDialog(() {
                            isLoading = true;
                          });

                          if (countbased == '1') {
                            if (double.parse(totalCountConsumed) <
                                double.parse(limit)) {
                              if (hourslimit == '0') {
                                print('no limits');

                                sendfileleaverequest(requestId, title,
                                    setStateDialog, isLoading);
                              } else {
                                if (double.parse(totalLeaveHours) <
                                    double.parse(hourslimit)) {
                                  print(
                                      'difeerence ${DateFormat('dd/MM/yyyy hh:mm a').parse(_selectedToDate).difference(DateFormat('dd/MM/yyyy hh:mm a').parse(_selectedFromDate)).inHours}');

                                  if (DateFormat('dd/MM/yyyy hh:mm a')
                                      .parse(_selectedToDate)
                                      .difference(DateFormat(
                                      'dd/MM/yyyy hh:mm a')
                                      .parse(_selectedFromDate))
                                      .inHours <
                                      double.parse(hourslimit)) {
                                    sendfileleaverequest(requestId, title,
                                        setStateDialog, isLoading);
                                  } else {
                                    setStateDialog(() {
                                      isLoading = false;
                                    });

                                    Fluttertoast.showToast(
                                        msg: 'Exceeding Hours Limit');
                                  }
                                } else {
                                  setStateDialog(() {
                                    isLoading = false;
                                  });
                                  Fluttertoast.showToast(
                                      msg: 'Hours Limit Exhausted');
                                }
                              }
                            } else {
                              setStateDialog(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: 'Counts Limit Exhausted');
                            }
                          } else {
                            if (hourslimit == '0') {
                              sendfileleaverequest(requestId, title,
                                  setStateDialog, isLoading);
                            } else {
                              if (double.parse(totalLeaveHours) <
                                  double.parse(hourslimit)) {
                                print(
                                    'difeerence ${DateFormat('dd/MM/yyyy hh:mm a').parse(_selectedToDate).difference(DateFormat('dd/MM/yyyy hh:mm a').parse(_selectedFromDate)).inHours}');

                                if (DateFormat('dd/MM/yyyy hh:mm a')
                                    .parse(_selectedToDate)
                                    .difference(DateFormat(
                                    'dd/MM/yyyy hh:mm a')
                                    .parse(_selectedFromDate))
                                    .inHours <
                                    double.parse(hourslimit)) {
                                  sendfileleaverequest(requestId, title,
                                      setStateDialog, isLoading);
                                } else {
                                  setStateDialog(() {
                                    isLoading = false;
                                  });

                                  Fluttertoast.showToast(
                                      msg: 'Exceeding Hours Limit');
                                }
                              } else {
                                setStateDialog(() {
                                  isLoading = false;
                                });
                                Fluttertoast.showToast(
                                    msg: 'Hours Limit Exhausted');
                              }
                            }
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                              Text('Please fill all the details.'),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please provide attachment.'),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Submit',style: TextStyle(color: Colors.black),),
                ),
                TextButton(

                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel',style: TextStyle(color: kgolder),),
                ),
              ],
            );
          },
        );
      },
    );
  }



  Padding Requests(String title ) {
    return Padding(
      padding:   EdgeInsets.all(8.0),
      child: Column(

        children: [
          InkWell(
            onTap: (){

              showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                        builder: (context, setState1){
                          return AlertDialog(
                            contentPadding: EdgeInsets.all(3),
                            backgroundColor: kgolder,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),),

                            content:SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(

                                      decoration: BoxDecoration(
                                        gradient:  LinearGradient(
                                          colors: [Colors.black, Colors.grey.shade600],
                                          begin: Alignment.centerRight,
                                          end: Alignment.centerLeft,),

                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                      ),
                                      child: Padding(
                                        padding:   EdgeInsets.all(8.0),
                                        child: Column(
                                            children: [

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("Title :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: kgolder),),
                                                  Expanded(
                                                    child: Container(
                                                      height: 35,

                                                      child: Padding(
                                                        padding:   EdgeInsets.all(4),
                                                        child: Text("Courses One",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color: kgolder,
                                                          borderRadius: BorderRadius.all(Radius.circular(12)),
                                                          border: Border.all(width: 3,color: Colors.black)
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height : 40,),

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    child: Padding(
                                                      padding:   EdgeInsets.all(4),
                                                      child: Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: kgolder,
                                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                                        border: Border.all(width: 2,color: Colors.black)
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Padding(
                                                      padding:   EdgeInsets.all(4.0),
                                                      child: Text("Cancel",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: kgolder),),
                                                    ),
                                                  )
                                                ],
                                              ),



                                            ]
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ) ,
                          );
                        }
                    );
                  });
            },
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                  gradient:  LinearGradient(
                    colors: [Colors.grey, Colors.black  ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(width: 3,color: kgolder)
              ),
              child: Padding(
                padding:   EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(

                      child: Row(

                        children: [
                          Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: kgolder),),

                        ],
                      ),

                    ),

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
  // DefaultTabController History (){
  //   return DefaultTabController(
  //       length: 3,
  //       child: Scaffold(
  //           appBar: AppBar(
  //               shadowColor: Colors.transparent,
  //               flexibleSpace: Stack(
  //                 children: [
  //                   Container(
  //                     height: screenHeight*0.5,
  //                     decoration: BoxDecoration(
  //                         image: DecorationImage(
  //                             image: AssetImage("assets/bg.jpg"),
  //                             fit: BoxFit.cover
  //                         )
  //                     ),
  //                   ),
  //                   Container(
  //                     margin: EdgeInsets.all(8),
  //                     height: 50,
  //                     decoration: BoxDecoration(
  //                         color: kgolder,
  //                         borderRadius: BorderRadius.all(
  //                             Radius.circular(10)
  //                         ),
  //                         border: Border.all(color: kblack,width: 2)
  //                     ),
  //                     child: TabBar(
  //                       labelColor: kgolder,
  //                       indicator: BoxDecoration(
  //                         color: kGray23,
  //                         borderRadius: BorderRadius.circular(5),
  //                       ),
  //                       unselectedLabelColor: kblack,
  //                       tabs: [
  //                         Text("Pending"),
  //                         Text("Accepted"),
  //                         Text("Rejected",style: TextStyle(fontSize: 13),)
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               )
  //           ),
  //           body:TabBarView(
  //             children: [
  //               Container(
  //                 height: screenHeight,
  //                 width: screenWidth,
  //                 decoration: BoxDecoration(
  //                     image: DecorationImage(
  //                         image: AssetImage("assets/bg.jpg"),
  //                         fit: BoxFit.cover
  //                     )
  //                 ),
  //                 child: ListView.builder(
  //                   itemCount: 4,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     return buildCertificateName();
  //
  //                   },
  //
  //                 ),
  //               ),
  //               Container(
  //                 height: screenHeight,
  //                 width: screenWidth,
  //                 decoration: BoxDecoration(
  //                     image: DecorationImage(
  //                         image: AssetImage("assets/bg.jpg"),
  //                         fit: BoxFit.cover
  //                     )
  //                 ),
  //                 child: ListView.builder(
  //                   itemCount: 4,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     return buildCertificateName();
  //
  //                   },
  //
  //                 ),
  //               ),
  //               Container(
  //                 height: screenHeight,
  //                 width: screenWidth,
  //                 decoration: BoxDecoration(
  //                     image: DecorationImage(
  //                         image: AssetImage("assets/bg.jpg"),
  //                         fit: BoxFit.cover
  //                     )
  //                 ),
  //                 child: ListView.builder(
  //                   itemCount: 4,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     return buildCertificateReject();
  //
  //                   },
  //
  //                 ),
  //               ),
  //             ],
  //           )
  //       ));
  //
  // }

   buildCertificateName(EmployeeLeaveRequestsModel req) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    kGray2,
                    kblack
                  ]
              ),
              borderRadius:BorderRadius.circular(10),
              border: Border.all(color: kgolder,width: 3)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title:",style: TextStyle(color: kgolder),),
                  Text("Date:",style: TextStyle(color: kgolder)),
                  Text("From:",style: TextStyle(color: kgolder)),
                  Text("To:",style: TextStyle(color: kgolder))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  Text(req.title!,style: TextStyle(color: kgolder)),
                  Text(req.date!,style: TextStyle(color: kgolder)),
                  Text(req.from!,style: TextStyle(color: kgolder)),
                  Text(req.to!,style: TextStyle(color: kgolder))
                ],
              )
            ],
          )
      ),
    );
  }
  Container buildCertificateMoreRequest() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kGray2,
                  kblack
                ]
            ),
            borderRadius:BorderRadius.circular(10),
            border: Border.all(color: kgolder,width: 3)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date:",style: TextStyle(color: kgolder)),
                Text("Status:",style: TextStyle(color: kgolder))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Text("12/04/2022",style: TextStyle(color: kgolder)),
                Text("Pending from HR",style: TextStyle(color: kgolder))
              ],
            )
          ],
        )
    );
  }
  Container buildCertificateReject() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kGray2,
                  kblack
                ]
            ),
            borderRadius:BorderRadius.circular(10),
            border: Border.all(color: kgolder,width: 3)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Certificate Name:",style: TextStyle(color: kgolder),),
                Text(""),
                Text("Date:",style: TextStyle(color: kgolder)),
                Text("Status:",style: TextStyle(color: kgolder)),
                Text("Reason:",style: TextStyle(color: kgolder))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Text("Certificate With",style: TextStyle(color: kgolder)),
                Text("Detail Salary",style: TextStyle(color: kgolder)),
                Text("12/04/2022",style: TextStyle(color: kgolder)),
                Text("Pending from HR",style: TextStyle(color: kgolder)),
                Text("xyz",style: TextStyle(color: kgolder)),
              ],
            )
          ],
        )
    );
  }

  Container buildCertificate(double H, double W) {
    return Container(
      height: H*.1,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: W*.03,vertical: H*0.008),
      decoration: BoxDecoration(
          border: Border.all(color: kgolder,width: 3),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                kblack ,
                kGray2
              ]
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Certificate With Detail Salary",style: TextStyle(color: kgolder),),
          ElevatedButton(
            onPressed: (){
              Get.defaultDialog(
                  title: "Request for the service?",

                  titlePadding: EdgeInsets.only(right: W*.1,top: H*0.03,left: W*0.04),
                  contentPadding:EdgeInsets.only(right: W*.03,top: H*0.03,left: W*0.06) ,
                  radius: 10,
                  backgroundColor: kgolder,
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Are you sure do you want to request for \nthe service?",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                      SizedBox(height: H*0.05,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10,right: 10,top: 8,),
                            height: H*0.05,
                            decoration: BoxDecoration(
                                color: kGray2,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: kblack)
                            ),
                            child: Text("Request",style: TextStyle(
                                fontSize: 15,
                                color: kgolder),),

                          ),
                          SizedBox(width: 10,),
                          Text("Cancel",style: TextStyle(fontWeight: FontWeight.w500),)
                        ],
                      )
                    ],

                  )
              );
            },
            child: Text("Request"),
            style: ElevatedButton.styleFrom(
                primary: kgolder,
                onPrimary: kblack
            ),
          )
        ],
      ),
    );
  }

  Padding Summary(String title) {
    return Padding(
      padding:   EdgeInsets.all(8.0),
      child: Column(

        children: [
          InkWell(

            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                  gradient:  LinearGradient(
                    colors: [Colors.grey, Colors.black  ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(width: 3,color: kgolder)
              ),
              child: Padding(
                padding:   EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 35,
                      width: Get.width,

                      child: Padding(
                        padding:   EdgeInsets.only(left: 8.0,top: 6),
                        child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      ),
                      decoration: BoxDecoration(
                          gradient:  LinearGradient(
                            colors: [Colors.yellow.shade100, kgolder  ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(width: 3,color: Colors.black)
                      ),
                    ),

                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Venue One",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 16 ),),
                            SizedBox(height: 5,),
                            Container(color: kgolder,height: 3,width: 100,),
                            SizedBox(height: 5,),
                            Text("6 Hours",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 16 ),),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Consumed",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 16 ),),
                            SizedBox(height: 5,),
                            Container(color: kgolder,height: 3,width: 100,),
                            SizedBox(height: 5,),
                            Text("6 Hours",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 16 ),),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Balance",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 16 ),),
                            SizedBox(height: 5,),
                            Container(color: kgolder,height: 3,width: 100,),
                            SizedBox(height: 5,),
                            Text("6 Hours",style: TextStyle(fontWeight: FontWeight.bold,color: kgolder,fontSize: 16 ),),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),


        ],
      ),
    );
  }

  Future<File> saveFile(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }


  Widget _buildFile() {
    return InkWell(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.1,
        child: FittedBox(
          child: Row(
            children: [
              const Icon(
                Icons.file_copy_rounded,
              ),
              const SizedBox(
                width: 5,
              ),
              FittedBox(child: Text(_attachmentPlatformFile.name)),
            ],
          ),
        ),
      ),
      onTap: () async {
        await OpenFile.open(_attachment!.path);
      },
    );
  }

  sendLeaveRequest(String requestId, String title) async {
    print('no limit on count and hours are pending');

    var result = await AllApi().postLeaveRequest(
      requestId: requestId,
      empName: widget.userModel!.name,
      companyId: widget.userModel!.companyId,
      date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      details: textFieldValues,
      refId: widget.userModel!.refId,
      title: title,
      fromDate: _selectedFromDate,
      toDate: _selectedToDate,
      hr_refid: widget.userModel!.hrId,
      manager_refid: widget.userModel!.managerid,
    );

    Get.back();

    if (result == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Request Sent.'),
        ),
      );
      setState(() {
        _selectedFromDate = '';
        _selectedToDate = '';
        textFieldValues.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to sent request.'),
        ),
      );
      setState(() {
        _selectedFromDate = '';
        _selectedToDate = '';
        textFieldValues.clear();
      });
    }
    print('no limits');
  }

  sendfileleaverequest(
      String requestId, String title, setStateDialog, isLoading) async {
    await AllApi().postLeaveRequest(
      requestId: requestId,
      empName: widget.userModel!.name,
      companyId: widget.userModel!.companyId,
      date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      details: textFieldValues,
      refId: widget.userModel!.refId,
      title: title,
      fromDate: _selectedFromDate,
      toDate: _selectedToDate,
    );
    var result = await AllApi().setFile(_attachment!);
    await AllApi().putAttachment(
      companyId: widget.userModel!.companyId,
      requestId: requestId,
      fileName: _attachmentPlatformFile.name,
    );
    setStateDialog(() {
      isLoading = false;
    });

    if (result == '1') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Request Sent.'),
        ),
      );
      setState(() {
        _selectedFromDate = '';
        _selectedToDate = '';
        _attachment = null;
        textFieldValues.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to sent request.'),
        ),
      );
      setState(() {
        _selectedFromDate = '';
        _selectedToDate = '';
        _attachment = null;
        textFieldValues.clear();
      });
    }
    Get.back();
  }
}
