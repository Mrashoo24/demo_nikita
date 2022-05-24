import 'dart:async';
import 'dart:io';
import 'dart:math' as math;


import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:demo_nikita/Components/clockWidget.dart';
import 'package:demo_nikita/Components/constants.dart';
import 'package:demo_nikita/Services/Services.dart';
import 'package:demo_nikita/demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../Announcements/announcements.dart';
import '../Components/Arrow/arrowclipper.dart';
import '../Components/api.dart';
import '../Components/models.dart';

class MainHomePage extends StatefulWidget {
  final UserModel? userModel;
  final  function;
  const MainHomePage({Key? key, this.userModel, required this.function}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage>
    with TickerProviderStateMixin {
  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  late AnimationController _animationController;
  late Animation _arrowAnimation;
  var convertedTime = 0.0  ;

  var selectedCard = 'Home';

  var differenceintime = 0.0;

  bool panelOpen = false;

  bool panelOpen2 = false;

  var timerCount = 0.0;

  var _inTime = '';
  var _outTime = '';
  var _inDate = '';
  var _outDate = '';
  var _status = '';
  var check_status = '';

  bool expand = true;
  var _vicinityLoading = false;
  late String latereason;
  late String gotreason;
  late TextEditingController reasonController;

  late File image;
  late int _announcementCount;

  late CountdownTimerController _controller;
  bool loading = false;

  // ignore: unnecessary_new
  Location location = new Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  Future<LocationData?> getUserLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            content: Text(
                'Location service is disabled. Please enable it to check-in.')));
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Location permission denied. Please allow it to check-in.'),
          ),
        );
        return null;
      }
    }

    _locationData = await location.getLocation();

    return _locationData;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLocation().then((value) {
      setState(() {
        _locationData = value!;
      });
    });
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));

    _arrowAnimation = Tween(begin: 0.0, end: 0.0).animate(_animationController);
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
    Timer(Duration(milliseconds: !panelOpen ? 0 : 600), () {
      setState(() {
        panelOpen2 = !panelOpen2;
      });
    });
  }

  void _confirmCheckInDialogBox() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) => AlertDialog(
            backgroundColor: Colors.black,
            title: _vicinityLoading
                ? null
                :  Text(
              'Confirm Check In',
              style: TextStyle(color: kgolder),
            ),
            content: _vicinityLoading
                ? Container(
              height: MediaQuery.of(context).size.height * 0.05,
              alignment: Alignment.center,
              child: Row(
                children:  [
                  kprogressbar,
                  SizedBox(
                    width: 30,
                  ),
                  Text('Please wait'),
                ],
              ),
            )
                : null,
            actions: _vicinityLoading
                ? null
                : [
              TextButton(
                child:  Text(
                  'Check-In',
                  style: TextStyle(color: kgolder),
                ),
                onPressed: () async {
                  setStateDialog(() {
                    _vicinityLoading = true;
                  });

                  var result = await AllApi().getVicinity(
                    refId: widget.userModel!.refId,
                    latitude: _locationData.latitude,
                    longitude: _locationData.longitude,
                  );

                  setStateDialog(() {
                    _vicinityLoading = false;
                  });

                  UserModel allowCheckIn = await AllApi().getUser(
                    widget.userModel!.email!,
                  );

                  print('$result + ${allowCheckIn}');

                  if (result == true || allowCheckIn.allow_checkin!) {
                    _inTime =
                        DateFormat('hh:mm a').format(DateTime.now());
                    _inDate =
                        DateFormat('dd-MM-yyyy').format(DateTime.now());
                    Get.back();

                    setState(
                          () {
                        loading = true;

                        print(
                            'reporting time = ${DateFormat('hh:mm a').parse(widget.userModel!.reportingTime!).add(Duration(minutes: 15))}');
                        print(
                            'today time = ${DateFormat('hh:mm a').parse(_inTime)}');
                        ('today time = ${DateFormat('hh:mm a').parse(_inTime)}');

                        print(DateFormat('hh:mm a')
                            .parse(_inTime)
                            .isAfter(DateFormat('hh:mm a')
                            .parse(widget.userModel!.reportingTime!)
                            .add(Duration(minutes: 15))));

                        _status = (DateFormat('hh:mm a')
                            .parse(_inTime)
                            .isAfter(DateFormat('hh:mm a')
                            .parse(widget.userModel!.reportingTime!)
                            .add(Duration(minutes: 15))))
                            ? 'late'
                            : (DateFormat('hh:mm a')
                            .parse(_inTime)
                            .isBefore(DateFormat('hh:mm a')
                            .parse(widget
                            .userModel!.reportingTime!)
                            .add(Duration(
                            hours: int.parse(widget
                                .userModel!
                                .hoursOfShift!)))))
                            ? 'early'
                            : 'perfect';
                      },
                    );

                    if (_status == 'late') {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          var isLoading = false;
                          return StatefulBuilder(
                            builder: (context, setStateDialog2) =>
                                AlertDialog(
                                  title: isLoading
                                      ? null
                                      :  Text(
                                    'Give Reason for Late Check-In',
                                  ),
                                  content: isLoading
                                      ? Container(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.05,
                                    alignment: Alignment.center,
                                    child: Row(
                                      children:  [
                                        CircularProgressIndicator(),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text('Please wait'),
                                      ],
                                    ),
                                  )
                                      : TextFormField(
                                    enabled: true,
                                    decoration: InputDecoration(
                                      hintText:
                                      'Reason for Late Check-In',
                                      hintStyle:  TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    controller: reasonController,
                                    onChanged: (value) {
                                      setState(() {
                                        latereason = value;
                                      });
                                    },
                                  ),
                                  actions: isLoading
                                      ? null
                                      : [
                                    TextButton(
                                      child:  Text(
                                        'Submit',
                                      ),
                                      onPressed: () async {
                                        setStateDialog2(() {
                                          isLoading = true;
                                        });

                                        await AllApi().postCheckIn(
                                            designation: widget
                                                .userModel!.designation!,
                                            checkInTime: _inTime,
                                            checkOutTime: '-----',
                                            date: _inDate,
                                            refId:
                                            widget.userModel!.refId!,
                                            companyId: widget
                                                .userModel!.companyId!,
                                            reason: latereason,
                                            status: _status);

                                        setStateDialog2(() {
                                          isLoading = false;
                                        });
                                        Get.back();
                                        setState(
                                              () {
                                            loading = false;
                                          },
                                        );
                                      },
                                    ),
                                    TextButton(
                                      child:  Text(
                                        'Cancel',
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        setState(() {
                                          loading = false;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                          );
                        },
                      );
                    } else {
                      await AllApi().postCheckIn(
                        designation: widget.userModel!.designation!,
                        checkInTime: _inTime,
                        checkOutTime: '-----',
                        date: _inDate,
                        refId: widget.userModel!.refId!,
                        companyId: widget.userModel!.companyId!,
                        status: _status,
                      );

                      setState(
                            () {
                          loading = false;
                        },
                      );
                    }
                  } else {
                    Get.back();
                    _sendRequestDialogBox();
                  }
                },
              ),
              TextButton(
                child:  Text(
                  'Cancel',
                  style: TextStyle(color: kgolder),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _confirmCheckOutDialogBox({
    @required dynamic checkin,
    required double differenceFinal,
  }) {
    var isLoading = false;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: isLoading
                  ? null
                  :  Text(
                'Confirm Check Out',
              ),
              content: isLoading
                  ? Container(
                height: MediaQuery.of(context).size.height * 0.05,
                alignment: Alignment.center,
                child: Row(
                  children:  [
                    CircularProgressIndicator(),
                    SizedBox(
                      width: 30,
                    ),
                    Text('Please wait'),
                  ],
                ),
              )
                  : null,
              actions: isLoading
                  ? null
                  : [
                TextButton(
                  child:  Text(
                    'Check-Out',
                  ),
                  onPressed: () async {
                    _outTime =
                        DateFormat('hh:mm a').format(DateTime.now());
                    _outDate =
                        DateFormat('dd-MM-yyyy').format(DateTime.now());

                    setStateDialog(() {
                      isLoading = true;
                    });

                    setState(() {
                      loading = true;
                    });

                    await AllApi().postCheckIn(
                      designation: widget.userModel!.designation,
                      companyId: widget.userModel!.companyId,
                      checkInTime: checkin,
                      checkOutTime: _outTime,
                      date: _outDate,
                      refId: widget.userModel!.refId,
                      status: _status,
                     hours:   int.parse(
                          widget.userModel!.hoursOfShift!,
                        )

                    );

                    var time1 = DateFormat('hh:mm a').parse(checkin);
                    var time2 = DateFormat('hh:mm a')
                        .parse(widget.userModel!.reportingTime!);

                    var delayInHours = time2.difference(time1).inHours;

                    var delayInMinutes =
                        time2.difference(time1).inMinutes;

                    // if (delayInHours < 0 || delayInMinutes < 0) {
                    //   setStateDialog(() {
                    //     _status = 'late';
                    //   });
                    // } else if (delayInHours > 0 || delayInMinutes > 0) {
                    //   setStateDialog(() {
                    //     _status = 'early';
                    //   });
                    // } else {
                    //   setStateDialog(() {
                    //     _status = 'perfect';
                    //   });
                    // }

                    await AllApi().postAttendanceReport(
                      employeeName: widget.userModel!.name,
                      checkInTime: checkin,
                      checkOutTime: _outTime,
                      checkInDelayInHours: delayInHours.toString(),
                      checkInDelayInMinutes: delayInMinutes.toString(),
                      checkOutDifference: differenceFinal.toString(),
                      companyId: widget.userModel!.companyId,
                      empId: widget.userModel!.empId,
                      status: _status,
                      reason: gotreason,
                      designation: widget.userModel!.designation,
                      hours: int.parse(
                        widget.userModel!.hoursOfShift!,
                      ),
                    );

                    setStateDialog(() {
                      isLoading = false;
                    });

                    setState(() {
                      loading = false;
                    });

                    Get.back();
                  },
                ),
                TextButton(
                  child:  Text(
                    'Cancel',
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
      },
    );
  }

  void _sendRequestDialogBox() {
    var isLoading = false;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: isLoading
                  ? null
                  :  Text(
                'Check-in not allowed.',
              ),
              content: isLoading
                  ? Container(
                height: MediaQuery.of(context).size.height * 0.05,
                alignment: Alignment.center,
                child: Row(
                  children:  [
                    CircularProgressIndicator(),
                    SizedBox(
                      width: 30,
                    ),
                    Text('Please wait'),
                  ],
                ),
              )
                  :  Text(
                'You aren\'t in the vicinity of 250 metres from your office.',
              ),
              actions: isLoading
                  ? null
                  : [
                TextButton(
                  onPressed: () async {
                    setStateDialog(() {
                      isLoading = true;
                    });

                    var allowCheckIn = await AllApi().getUser(
                      widget.userModel!.email!,
                    );

                    if (allowCheckIn.allow_checkin!) {
                      _inTime = DateFormat(
                        'hh:mm a',
                      ).format(
                        DateTime.now(),
                      );
                      _inDate = DateFormat(
                        'dd-MM-yyyy',
                      ).format(
                        DateTime.now(),
                      );

                      setStateDialog(() {
                        isLoading = false;
                      });

                      Get.back();

                      setState(
                            () {
                          loading = true;
                          _status = (DateFormat('hh:mm a')
                              .parse(_inTime)
                              .isAfter(DateFormat('hh:mm a')
                              .parse(
                              widget.userModel!.reportingTime!)
                              .add(Duration(minutes: 15))))
                              ? 'late'
                              : (DateFormat('hh:mm a')
                              .parse(_inTime)
                              .isBefore(DateFormat('hh:mm a')
                              .parse(widget
                              .userModel!.reportingTime!)
                              .add(Duration(
                              hours:
                              int.parse(widget.userModel!.hoursOfShift!)))))
                              ? 'early'
                              : 'perfect';
                        },
                      );

                      if (_status == 'late') {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            var isLoading = false;
                            return StatefulBuilder(
                              builder: (context, setStateDialog2) =>
                                  AlertDialog(
                                    title: isLoading
                                        ? null
                                        :  Text(
                                      'Give Reason for Late Check-In',
                                    ),
                                    content: isLoading
                                        ? Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.05,
                                      alignment: Alignment.center,
                                      child: Row(
                                        children:  [
                                          CircularProgressIndicator(),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text('Please wait'),
                                        ],
                                      ),
                                    )
                                        : TextFormField(
                                      enabled: true,
                                      decoration: InputDecoration(
                                        hintText:
                                        'Reason for Late Check-In',
                                        hintStyle:  TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      controller: reasonController,
                                      onChanged: (value) {
                                        setState(() {
                                          latereason = value;
                                        });
                                      },
                                    ),
                                    actions: isLoading
                                        ? null
                                        : [
                                      TextButton(
                                        child:  Text(
                                          'Submit',
                                        ),
                                        onPressed: () async {
                                          setStateDialog2(() {
                                            isLoading = true;
                                          });

                                          await AllApi().postCheckIn(
                                              designation: widget
                                                  .userModel!
                                                  .designation!,
                                              checkInTime: _inTime,
                                              checkOutTime: '-----',
                                              date: _inDate,
                                              refId: widget
                                                  .userModel!.refId!,
                                              companyId: widget
                                                  .userModel!.companyId,
                                              reason: latereason,
                                              status: _status);

                                          await AllApi()
                                              .postOuterGeoList(
                                            designation: widget
                                                .userModel!.designation,
                                            empName:
                                            widget
                                                .userModel!.name,
                                            companyId: widget
                                                .userModel!.companyId,
                                            refId:
                                            widget
                                                .userModel!.refId,
                                            date: _inDate,
                                            lat: _locationData.latitude
                                                .toString(),
                                            lon: _locationData.longitude
                                                .toString(),
                                          );

                                          Fluttertoast.showToast(
                                            msg: "Logged in",
                                          );

                                          setStateDialog2(() {
                                            isLoading = false;
                                          });
                                          Get.back();
                                          setState(
                                                () {
                                              loading = false;
                                            },
                                          );
                                        },
                                      ),
                                      TextButton(
                                        child:  Text(
                                          'Cancel',
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                            );
                          },
                        );
                      } else {
                        await AllApi().postCheckIn(
                            designation: widget
                                                .userModel!.designation,
                            checkInTime: _inTime,
                            checkOutTime: '-----',
                            date: _inDate,
                            refId: widget
                                                .userModel!.refId,
                            companyId: widget
                                                .userModel!.companyId,
                            status: _status);

                        await AllApi().postOuterGeoList(
                          designation: widget
                                                .userModel!.designation,
                          empName: widget
                                                .userModel!.name,
                          companyId: widget
                                                .userModel!.companyId,
                          refId: widget
                                                .userModel!.refId,
                          date: _inDate,
                          lat: _locationData.latitude.toString(),
                          lon: _locationData.longitude.toString(),
                        );

                        Fluttertoast.showToast(
                          msg: "Logged in",
                        );

                        setState(
                              () {
                            loading = false;
                          },
                        );
                      }
                    } else {
                      await AllApi().postCheckInRequest(
                          designation: widget
                                                .userModel!.designation,
                          companyId: widget
                                                .userModel!.companyId,
                          date: DateFormat('dd-MM-yyyy').format(
                            DateTime.now(),
                          ),
                          refId: widget
                                                .userModel!.refId,
                          lat: _locationData.latitude.toString(),
                          lon: _locationData.longitude.toString(),
                          name: widget
                                                .userModel!.name);

                      setStateDialog(() {
                        isLoading = false;
                      });

                      setState(
                            () {
                          loading = false;
                        },
                      );

                      Get.back();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'You are not allowed to check-in.',
                          ),
                        ),
                      );
                    }
                  },
                  child:  Text(
                    'Send Request',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child:  Text(
                    'Cancel',
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  GlobalKey _globalKeyContainer = GlobalKey();



var workingStatus = '';
var widthofcontainer = 20.0;
 late DateTime dateAndTime ;


  @override
  Widget build(BuildContext context) {
    // Widget arrow = ClipPath(
    //   child: Container(
    //     width: 20,
    //     height: 10,
    //     color: Colors.black54,
    //
    //   ),
    //   clipper: ArrowClipper(),
    // );


    return SingleChildScrollView(
      child: FutureBuilder(
          future: Future.wait([
            AllApi().getCompanyDetails(companyid: widget.userModel!.companyId),
            AllApi().getAnnounce(
              companyId: widget.userModel!.companyId,
            ),
            AllApi().getCheckIn(
              refId: widget.userModel!.refId,
              date: DateFormat('dd-MM-yyyy').format(DateTime.now()),
            ),
            AllApi().getAttendenceCounts(
                empname: widget.userModel!.name,
                companyid: widget.userModel!.companyId),
            AllApi().getHomeLeavesCount(
                verify: '1',
                companyid: widget.userModel!.companyId,
                refid: widget.userModel!.refId)
          ]),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(height: Get.height, child: kprogressbar);
            }

            var listOfFuture = snapshot.requireData! as List;

            Map companydetails = listOfFuture[0];

            var report = listOfFuture[2];

            print('report $report');

            String checkInTime = "-----";
            String checkOutTime = "-----";
            String date = "-----";
            int endTime = 0;

            List<AttendanceReportModel> attendencecount =
            listOfFuture[3] as List<AttendanceReportModel>;

            List<EmployeeLeaveRequestsModel> leavescount =
            listOfFuture[4] as List<EmployeeLeaveRequestsModel>;

            var leavesCount = leavescount.length;

            var present = attendencecount.where(
                    (element) => element.status != 'absence');

            var Absent = attendencecount.where(
                    (element) => element.status == 'absence');

            var lateentry = attendencecount.where(
                    (element) => element.status == 'late');

            var earlyexit = attendencecount.where(
                    (element) =>
                element.workingstatus == 'early');

            var workinghours = 0.0;

            attendencecount.forEach((element) {
              workinghours +=
                  double.parse(element.checkOutDifference!);
            });



            // Timer(Duration(milliseconds: 1000),(){
            //
            //   var newNumber = Random().nextInt(3) +1;
            //   var zero = '0.' + newNumber.toString();
            //
            //   setState(() {
            //
            //     widthofcontainer = Get.width*double.parse(zero);
            //
            //   });
            //
            // });
            // print(widthofcontainer);


            if (report != "No Data") {
              checkInTime = report["checkin"];
              checkOutTime = report["checkout"];

              date = report["date"];

               dateAndTime =
              DateFormat('hh:mm a').parse(checkInTime);

               print(checkInTime);

              var endTime  = DateFormat('hh:mm a').parse(DateFormat('hh:mm a').format(DateTime.now()));


              var differenceTime = endTime.difference(dateAndTime);

              var newTimeList  = differenceTime.toString().split(':');

               convertedTime  = double.parse(newTimeList[0] + '.' + newTimeList[1]);

               differenceintime = (differenceTime.inMinutes/(double.parse(widget.userModel!.hoursOfShift!) * 60))/2 ;

              gotreason = report == "No Data" ? "-----" : report["reason"];

                print(differenceTime.inMinutes);
              print(differenceintime);

              //   setState(() {
              //
                   widthofcontainer =
                       // Get.width * 0.5;
                   differenceintime > 0.44 ?
                   Get.width*0.45: Get.width*differenceintime;

                   print('width = $widthofcontainer');

                   workingStatus = report["workingstatus"];

              //
              //   });
              // var splitDateAndTime = dateAndTime.split(' ');
              //
              // checkInTime = splitDateAndTime[1];
              // String day = date.substring(0, 2);
              // String month = date.substring(3, 5);
              // String year = date.substring(6, 10);
              // date = year + '-' + month + '-' + day;
              // // if (timing.studyPermit == '0' && timing.maternityPermit == '0') {
              // endTime = checkOutTime == "-----"
              //     ? DateTime.parse(date + ' ' + checkInTime)
              //     .millisecondsSinceEpoch +
              //     (1000 * (int.parse(widget.userModel!.hoursOfShift!) * 3600))
              //     : 0;
              // } else {
              //   endTime = checkOutTime == "-----"
              //       ? DateTime.parse(date + ' ' + checkInTime)
              //               .millisecondsSinceEpoch +
              //           (1000 * (5 * 3600))
              //       : 0;
              // }
            }

            return Container(

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children:
                [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, kGray7],
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
                              InkWell(
                                onTap: widget.function,
                                child: Image.
                        asset(
                                  'assets/icons/more.png',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              Container(
                                width: Get.width * 0.3,
                                height: 50,
                                child: Text(
                                  companydetails!['cname'],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(
                                    () => Announcements(
                                      userModel: widget.userModel,
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Image(
                                        image:
                                            AssetImage("assets/icons/bell.png"),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red),
                                        child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(3.0),
                                              child: Text(
                                          '03',
                                          style: TextStyle(
                                                color: Colors.white, fontSize: 8),
                                        ),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
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
                                      "Welcome,\n${widget.userModel!.name!}",
                                      style: TextStyle(
                                          fontSize: 30, color: kgolder),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${widget.userModel!.designation!}     \n${widget.userModel!.empId!}      ",
                                          style: TextStyle(
                                              fontSize: 15, color: kgolder),
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        color: kgolder,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: CircleAvatar(
                                  backgroundColor: kgolder,
                                  radius: 58,
                                  child: CircleAvatar(
                                    radius: 55,
                                    backgroundColor: kgolder,
                                    backgroundImage:
                                        NetworkImage('${mainurl}assets/images/employee/profile/${widget.userModel!.image}',),
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
                  Stack(

                    children: [
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: Column(
                          children: AnimationConfiguration.toStaggeredList(
                            duration: const Duration(milliseconds: 700),
                            childAnimationBuilder: (widget) => SlideAnimation(
                              duration: Duration(milliseconds: 500),
                              verticalOffset: 200.0,
                              child: FadeInAnimation(
                                child: widget,
                              ),
                            ),
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                 
                                    // width: Get.width * 0.85,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      border: Border.all(
                                        width: 2,
                                        color: kdarkyellow,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 30,
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "${DateFormat('dd-MMM-yyyy').format(DateTime.now())}",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: kdarkyellow,
                                              borderRadius: BorderRadius.circular(3),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                              width: Get.width*0.45,
                                              key: _globalKeyContainer,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                  color: kgolder.withOpacity(0.6),
                                                  borderRadius: BorderRadius.circular(20),
                                                  border:
                                                  Border.all(color: kgolder, width: 3)),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: kdarkyellow,
                                                        borderRadius:
                                                        BorderRadius.circular(20)),
                                                    width: double.infinity,
                                                  ),
                                                  checkInTime == "-----" ? SizedBox() :      AnimatedContainer(

                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: AssetImage(
                                                              'assets/blackstrip.jpeg')),
                                                      borderRadius: BorderRadius.horizontal(
                                                          left: Radius.circular(20)
                                                          ,right: widthofcontainer > 0.43 ? Radius.circular( 20) : Radius.circular(0)
                                                      ),
                                                    ),
                                                    width: widthofcontainer,
                                                    duration: Duration(milliseconds: 500),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                

                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: Get.width ,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2, color: kdarkyellow),
                                            color: Colors.black.withOpacity(0.8),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 15.0),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(bottom: 2.0),
                                                  child: Text(
                                                    "In Time",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: kdarkyellow,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              DigitalClock(
                                                is24HourTimeFormat: false,
                                                showSecondsDigit: false,
                                                areaDecoration: BoxDecoration(
                                                    color: Colors.transparent),
                                                hourMinuteDigitDecoration: BoxDecoration(
                                                    color: kdarkyellow,
                                                    border:
                                                    Border.all(color: Colors.black)),
                                                secondDigitDecoration: BoxDecoration(
                                                    color: kdarkyellow,
                                                    border:
                                                    Border.all(color: Colors.black)),
                                                hourMinuteDigitTextStyle: TextStyle(
                                                    fontFamily: 'Alarm Clock',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                                secondDigitTextStyle: TextStyle(
                                                    fontFamily: 'Alarm Clock',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                                seconds:checkInTime == "-----" ? '--' : checkInTime.toString().split(':')[0],
                                                hour: checkInTime == "-----" ? '--' :checkInTime.toString().split(':')[0],
                                                minute: checkInTime == "-----" ? '--' :checkInTime.toString().split(':')[1].split(' ')[0],
                                                type:checkInTime == "--" ? '--' : 'AM',
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.symmetric(
                                                        vertical: 10),
                                                    width: 140,
                                                    height: 1,
                                                    color: kdarkyellow,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        bottom: 10.0),
                                                    child: Text(
                                                      "In Status",
                                                      style: TextStyle(
                                                          fontSize: 15, color: kdarkyellow),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 25,
                                                width: 100,
                                                child: Center(
                                                  child: Text(
                                                    _status,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: kdarkyellow,
                                                  borderRadius: BorderRadius.circular(3),
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                    Visibility(
                                      visible: checkOutTime != "-----" ,
                                      child: SizedBox(
                                        width: 10,
                                      ),
                                    ),
                                    Visibility(
                                      visible: checkOutTime != "-----" ,
                                      child: Expanded(
                                        child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2, color:kdarkyellow),
                                              color: Colors.black.withOpacity(0.8),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 15.0),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.only(bottom: 2.0),
                                                    child: Text(
                                                      "Out Time",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: kdarkyellow,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                DigitalClock(
                                                  is24HourTimeFormat: false,
                                                  showSecondsDigit: false,
                                                  areaDecoration: BoxDecoration(
                                                      color: Colors.transparent),
                                                  hourMinuteDigitDecoration: BoxDecoration(
                                                      color: kdarkyellow,
                                                      border:
                                                      Border.all(color: Colors.black)),
                                                  secondDigitDecoration: BoxDecoration(
                                                      color: kdarkyellow,
                                                      border:
                                                      Border.all(color: Colors.black)),
                                                  hourMinuteDigitTextStyle: TextStyle(
                                                      fontFamily: 'Alarm Clock',
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold),
                                                  secondDigitTextStyle: TextStyle(
                                                      fontFamily: 'Alarm Clock',
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold),
                                                  seconds:checkOutTime == "-----" ? '--' : checkOutTime.toString().split(':')[0],
                                                  hour: checkOutTime == "-----" ? '--' :checkOutTime.toString().split(':')[0],
                                                  minute: checkOutTime == "-----" ? '--' :checkOutTime.toString().split(':')[1].split(' ')[0],
                                                  type:checkOutTime == "--" ? '--' : 'AM',
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.symmetric(
                                                          vertical: 10),
                                                      width: 140,
                                                      height: 1,
                                                      color: kdarkyellow,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          bottom: 10.0),
                                                      child: Text(
                                                        "Out Status",
                                                        style: TextStyle(
                                                            fontSize: 15, color: kdarkyellow),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  height: 25,
                                                  width: 100,
                                                  child: Center(
                                                    child: Text(
                                                      workingStatus,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: kdarkyellow,
                                                    borderRadius: BorderRadius.circular(3),
                                                  ),
                                                )
                                              ],
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: (){

                                  if (checkInTime != "-----" && checkOutTime == "-----") {
                                    if (checkInTime == "-----") {
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (ctx) {
                                          return AlertDialog(
                                            title:  Text(
                                              'You need to check-in first.',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child:  Text(
                                                  'Dismiss',
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      if (checkOutTime != "-----") {
                                        showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (ctx) {
                                            return AlertDialog(
                                              title:  Text(
                                                'You have Checked out Already',
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child:  Text(
                                                    'Dismiss',
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        _confirmCheckOutDialogBox(
                                          checkin: checkInTime,
                                          differenceFinal: convertedTime,
                                        );
                                      }
                                    }
                                  } else {
                                    if (checkOutTime != "-----") {
                                      Fluttertoast.showToast(msg: 'You have checkout already');
                                    }else{
                                      _confirmCheckInDialogBox();
                                    }

                                  }

                                },
                                child: Container(
                                  // width: Get.width * 0.85,
                                  height: 40,

                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black, width: 2),
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                            'assets/cardbg.png',
                                          ))),
                                  child: Center(
                                    child: Text(
                                      checkInTime == "-----" ? 'Check In' : 'Check Out',
                                      style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2, color: kdarkyellow),
                                  color: Colors.black.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                // width: Get.width * 0.85,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(

                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight:Radius.circular(8) ),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _handleOnPressed();
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 8),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Month Records",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: kdarkyellow),
                                              ),
                                              AnimatedBuilder(
                                                animation: _animationController,
                                                builder: (context, child) => Transform.rotate(
                                                  angle: _arrowAnimation.value,
                                                  child: Icon(
                                                    !_animationController.isCompleted
                                                        ? Icons.keyboard_arrow_down
                                                        : Icons.keyboard_arrow_up,
                                                    size: 30.0,
                                                    color: kdarkyellow,
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
                                    ),
                                    AnimatedContainer(
                                      color: Colors.black.withOpacity(0.5),
                                      height: panelOpen ? null : 0,
                                      duration: Duration(milliseconds: 600),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, bottom: 10, right: 10, top: 10),
                                        child: Visibility(
                                          visible: panelOpen2,
                                          child:


                                          Column(
                                            children:
            AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 700),
            childAnimationBuilder: (widget) => SlideAnimation(
            duration: Duration(milliseconds: 500),
            verticalOffset: 200.0,
            child: FadeInAnimation(
            child: widget,
            ),
            ),
            children:   [
              Row(
                children: [
                      Text(
                        "My Record for",
                        style: TextStyle(
                            fontSize: 15, color: kdarkyellow),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // Container(
                      //   color: kgolder,
                      //   height: 20,
                      //   child: DropdownButton(
                      //     dropdownColor: kgolder,
                      //     hint: Text(
                      //       'Febauray',
                      //       style: TextStyle(
                      //         fontSize: 13,
                      //         color:
                      //             Theme.of(context).hintColor,
                      //       ),
                      //     ),
                      //     items: items
                      //         .map((item) =>
                      //             DropdownMenuItem<String>(
                      //               value: item,
                      //               child: Text(
                      //                 item,
                      //                 style: const TextStyle(
                      //                   fontSize: 12,
                      //                 ),
                      //               ),
                      //             ))
                      //         .toList(),
                      //     value: selectedValue,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         selectedValue = value as String;
                      //       });
                      //     },
                      //   ),
                      // ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                      buildAttendenceCard('Present',present.length.toString(),0),
                      SizedBox(
                        width: 10,
                      ),
                      buildAttendenceCard('Absent',Absent.length.toString(),1),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                      buildAttendenceCard('Leaves',leavesCount.toString(),3),
                      SizedBox(
                        width: 10,
                      ),
                      buildAttendenceCard('Late Entry',lateentry.length.toString(),2),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                      buildAttendenceCard('Work(hrs)',workinghours.round().toString(),4),
                      SizedBox(
                        width: 10,
                      ),
                      buildAttendenceCard('Early Exit',earlyexit.length.toString(),5),
                ],
              ),
            ],
            )

                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 200,
                              )
                            ],
                          ),

                        ),
                      ),
                      Positioned(
                        top: Get.height*0.07,
                        left:differenceintime > 0.43 ? differenceintime + Get.width *0.37 : differenceintime + Get.width *0.48 ,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Transform.rotate(
                              angle: math.pi,
                              child:   ClipPath(
                                clipper: MessageClipper(borderRadius: 2),
                                child: Container(
                                  height: 40,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color:  Colors.black.withOpacity(0.8) ,
                                      border: Border.all(color: kgolder,width: 1),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: SizedBox(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:8.0),
                              child: Text(convertedTime.toString().replaceAll('.', ':'),style: TextStyle(color: kgolder,fontSize: 20),),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            );
          }),
    );
  }

  buildBNBCards(title, image) {
    return Expanded(
      child: InkWell(
        onTap: () {
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
              selectedCard == title
                  ? Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          border: Border.all(color: kgolder, width: 2)),
                      child: Container(
                          padding: EdgeInsets.all(8),
                          width: 60,
                          height: 60,
                          child: Image.asset(
                            image,
                            fit: BoxFit.fill,
                          )),
                    )
                  : Container(
                      width: 30,
                      height: 30,
                      child: Image.asset(
                        image,
                        fit: BoxFit.fill,
                      )),
              Text(
                title,
                style: TextStyle(
                    color: kgolder, fontSize: selectedCard == title ? 16 : 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildAttendenceCard(title, count,int index) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: kgolder),
          color:index.isEven ? Colors.white.withOpacity(0.3) : Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: kgolder),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 12, right: 10),
                child: Text(
                  count,
                  style: TextStyle(
                      fontSize: 90,
                      color: kgolder,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

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
            width: Get.width*0.7,
            height: 50,
            child: Container(
              child: Text('s'),
            )

          // Icon(
          //   isMe ? Icons.face : Icons.tag_faces,
          //   color: Colors.white,
          // ),
        ),
      );
  }

}
