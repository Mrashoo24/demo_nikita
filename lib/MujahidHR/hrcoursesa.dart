import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Components/api.dart';
import '../Components/constants.dart';
import '../Components/models.dart';
import 'corses_detail.dart';

class HRCourses extends StatefulWidget {
  final UserModel userModel;
  const HRCourses({Key? key, required this.userModel}) : super(key: key);

  @override
  _HRCoursesState createState() => _HRCoursesState();
}

class _HRCoursesState extends State<HRCourses> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String? search;
  List<CoursesModel>? newListOfCourse;
  List<CoursesModel>? _completedCourses;
  String? dateSelected;

  var _title = '';
  var _venue = '';

  Widget _upcomingCoursesList() {
    return FutureBuilder<List<CoursesModel>?>(
      future: AllApi().getHRCourses(
        companyid: widget.userModel.companyId!,
        hrId: widget.userModel.empId!,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return kprogressbar;
        }
        List<CoursesModel>? coursesList =
        search == null || search!.toString().isBlank!
            ? snapshot.requireData
            : newListOfCourse;
        if (coursesList!.isEmpty) {
          return const Center(
            child: Text("No courses added."),
          );
        } else {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  style: TextStyle(color: kgolder2),

                  decoration: const InputDecoration(
                    hintText: "Search",

                    hintStyle: TextStyle(color: kgolder2),
                    prefixIcon: Icon(Icons.search,color: kgolder2,),
                    border: UnderlineInputBorder(borderSide: BorderSide(color: kgolder2)),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: kgolder2)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: kgolder2)),
                      disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: kgolder2))



                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please fill this value';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      search = value.removeAllWhitespace;
                      newListOfCourse = coursesList.where(
                            (element) {
                          return element.emp_name!.toLowerCase().contains(
                            search!.removeAllWhitespace.toLowerCase(),
                          );
                        },
                      ).toList();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: search == null || search!.toString().isBlank!
                      ? coursesList.length
                      : newListOfCourse!.length,
                  itemBuilder: (context, index) {
                    var courseDate = coursesList[index]
                        .date!
                        .substring(0, coursesList[index].date!.length - 3) +
                        ':00';
                    var courseDateParsed = DateTime.parse(courseDate);
                    if (courseDateParsed.isAfter(DateTime.now())) {
                      return InkWell(
                        onTap: () {
                          Get.to(
                                () => CoarsesDetails(
                              userModel: widget.userModel,
                              coursesModel: coursesList[index],
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [kgradientYellow, kgolder2]),
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                  color: kgolder,
                                  width: 2,
                                )),
                            child: Column(
                              children: [

                                ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  contentPadding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8),
                                  // trailing: IconButton(
                                  //   onPressed: () {
                                  //     _deleteCourse(
                                  //       coursesList: coursesList,
                                  //       index: index,
                                  //     );
                                  //   },
                                  //   icon: const Icon(
                                  //     Icons.delete,
                                  //     color: kblack,
                                  //   ),
                                  // ),
                                  // title: Container(
                                  //   width: Get.width,
                                  //   decoration: BoxDecoration(
                                  //       borderRadius:
                                  //       BorderRadius.all(Radius.circular(8)),
                                  //       gradient:
                                  //       LinearGradient(colors: [kGray3, kblack]),
                                  //       border: Border.all(
                                  //         color: kgolder,
                                  //         width: 2,
                                  //       )),
                                  //
                                  //
                                  //   child: Padding(
                                  //     padding:   EdgeInsets.all(7.0),
                                  //     child: Text(
                                  //       coursesList[index]!.title!,
                                  //       style:   TextStyle(
                                  //         fontSize: 20,
                                  //         fontWeight: FontWeight.bold,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(8)),
                                            gradient:
                                            LinearGradient(colors: [kGray3, kblack]),
                                            border: Border.all(
                                              color: kgolder,
                                              width: 2,
                                            )),


                                        child: Padding(
                                          padding:   EdgeInsets.all(7.0),
                                          child: Text(
                                            coursesList[index]!.title!,
                                            style:   TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: kgolder
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Time: ${coursesList[index].date}",
                                             style: TextStyle(
                                          color: kblack,
                                          fontWeight: FontWeight.bold),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              _deleteCourse(
                                                coursesList: coursesList,
                                                index: index,
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: kblack,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // const SizedBox(
                                      //   height: 5,
                                      // ),
                                      Text(
                                        "Venue: ${coursesList[index].venue}",
                                        style: TextStyle(
                                            color: kblack,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      FutureBuilder<List<CoursesModel>?>(
                                        future: AllApi().getCoursesDetails(
                                          companyid: widget.userModel.companyId!,
                                          courseId: coursesList[index].courseId!,
                                        ),
                                        builder: (context, snapshot1) {
                                          if (!snapshot1.hasData) {
                                            return kprogressbar;
                                          }
                                          List<CoursesModel> empList =
                                              snapshot1.requireData!;
                                          return Text(
                                            "Total Employees Registered: ${empList.length}",
                                            style: TextStyle(
                                                color: kblack,
                                                fontWeight: FontWeight.bold),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _completedCoursesList() {
    return FutureBuilder<List<CoursesModel>?>(
      future: AllApi().getHRCourses(
        companyid: widget.userModel.companyId!,
        hrId: widget.userModel.empId!,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return kprogressbar;
        }
        List<CoursesModel>? coursesList =
        search == null || search!.toString().isBlank!
            ? snapshot.requireData
            : newListOfCourse;
        _completedCourses = coursesList;
        if (_completedCourses!.isEmpty) {
          return const Center(
            child: Text("No courses added."),
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              var refreshList = await AllApi().getHRCourses(
                companyid: widget.userModel.companyId!,
                hrId: widget.userModel.empId!,
              );
              setState(() {
                _completedCourses = refreshList;
              });
            },
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    style: TextStyle(color: kgolder2),
                    decoration: const InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: kgolder2),
                        prefixIcon: Icon(Icons.search,color: kgolder2,),
                        border: UnderlineInputBorder(borderSide: BorderSide(color: kgolder2)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: kgolder2)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: kgolder2)),
                        disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: kgolder2))



                    ),

                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please fill this value';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        search = value.removeAllWhitespace;
                        newListOfCourse = _completedCourses!.where(
                              (element) {
                            return element.emp_name!.toLowerCase().contains(
                              search!.removeAllWhitespace.toLowerCase(),
                            );
                          },
                        ).toList();
                      });
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: search == null || search!.toString().isBlank!
                        ? _completedCourses!.length
                        : newListOfCourse!.length,
                    itemBuilder: (context, index) {
                      var courseDate = _completedCourses![index].date!.substring(
                          0, _completedCourses![index].date!.length - 3) +
                          ':00';
                      var courseDateParsed = DateTime.parse(courseDate);
                      if (courseDateParsed.isBefore(DateTime.now())) {
                        return InkWell(
                          onTap: () {
                            Get.to(
                                  () => CoarsesDetails(
                                userModel: widget.userModel,
                                coursesModel: _completedCourses![index],
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    kgolder2,
                                    kgradientYellow,
                                    kgolder2
                                  ]),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8)),
                                  border: Border.all(
                                    color: kblack,
                                    width: 2,
                                  )),
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                contentPadding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8),
                                 subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width : Get.width,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                          gradient:
                                          LinearGradient(colors: [kGray3, kblack]),
                                          border: Border.all(
                                            color: kgolder,
                                            width: 2,
                                          )),
                                      child: Padding(
                                        padding:   EdgeInsets.all(7.0),
                                        child: Text(
                                          _completedCourses![index].title!,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: kgolder
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Time: ${_completedCourses![index].date!}",
                                          style: TextStyle(
                                              color: kblack,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            _deleteCourse(
                                              coursesList: _completedCourses!,
                                              index: index,
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: kblack,
                                          ),
                                        ),
                                      ],
                                    ),

                                    Text(
                                      "Venue: ${_completedCourses![index].venue!}",
                                      style: TextStyle(
                                          color: kblack,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // const SizedBox(
                                    //   height: 5,
                                    // ),
                                    FutureBuilder<List<CoursesModel>?>(
                                      future: AllApi().getCoursesDetails(
                                        companyid: widget.userModel.companyId!,
                                        courseId:
                                        _completedCourses![index].courseId!,
                                      ),
                                      builder: (context, snapshot1) {
                                        if (!snapshot1.hasData) {
                                          return kprogressbar;
                                        }
                                        List<CoursesModel> empList =
                                            snapshot1.requireData!;
                                        var presentCount = 0;
                                        var absentCount = 0;
                                        for (int i = 0; i < empList.length; i++) {
                                          if (empList[i].checkin != "") {
                                            presentCount++;
                                          } else {
                                            absentCount++;
                                          }
                                        }
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Total Employees Registered: ${empList.length}",
                                              style: TextStyle(
                                                  color: kblack,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Total Employees Present: $presentCount",
                                              style: TextStyle(
                                                  color: kblack,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Total Employees Absent: $absentCount",
                                              style: TextStyle(
                                                  color: kblack,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Icon(Icons.arrow_back, color: kblack),
                ),
              ),
              leadingWidth: 25,
              title: Text(
                "Courses ",
                style: TextStyle(
                    color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
              toolbarHeight: 55,
              backgroundColor: kgolder2,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [kgolder2, kgradientYellow, kgolder2]),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
              ),
            ),
            backgroundColor: Colors.transparent,
            body:
            Container(
              color: kgolder2,

              child: DefaultTabController(
                length: 1,

                child: Scaffold(

                  body: Container(
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
                    child: Column(
                      children: [
                        SizedBox(height: 10),

                        Container(
                          child: Expanded(
                            child: DefaultTabController(
                              length: 2,

                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 45,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            kgolder2,
                                            kgradientYellow,
                                            kgolder2
                                          ]),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          border: Border.all(
                                            color: kblack,
                                            width: 2,
                                          )),
                                      child: Container(
                                        child: TabBar(
                                          labelStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                          labelColor: kgolder,
                                          unselectedLabelColor: kblack,
                                          indicator: BoxDecoration(
                                            color: kGray2,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            border: Border.all(
                                              color: kgolder,
                                              width: 1,
                                            ),
                                          ),
                                          tabs: [
                                            Tab(
                                              child: Text(
                                                "Upcoming",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily:
                                                    'Typo Round',
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ),
                                            Tab(
                                              child: Text(
                                                "Completed",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily:
                                                    'Typo Round',
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),

                                  Container(
                                    child: Expanded(
                                      child: TabBarView(
                                        children: [
                                          _upcomingCoursesList(),

                                          _completedCoursesList(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButton: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient:LinearGradient(
                  colors: [

                    kgolder,
                    kgradientYellow,
                    kgolder,
                    kgradientYellow
                    //add more colors for gradient
                  ],
                  begin: Alignment.topRight, //begin of the gradient color
                  end: Alignment.bottomLeft,
                ),
              ),
              child: FloatingActionButton(
                child: Icon(
                  Icons.add,
                  color: kblack,
                ),
                backgroundColor: Colors.transparent,
                onPressed: _addCourse,
              ),
            ),
          ),
        ),
      ),
    );
  }


  void _addCourse() {
    bool _isLoading = false;

    Get.defaultDialog(
        title: "Add Courses",

        titleStyle: TextStyle(color: kgolder),
        titlePadding: EdgeInsets.only(right: 100,top: 5),
        backgroundColor: Colors.transparent,

        content: StatefulBuilder(
            builder: (context, setState1) {
              return Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  gradient: LinearGradient(
                      colors: [ kGray3,kblack]
                  ),
                  border: Border.all(
                    color:kgolder,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding:   EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(
                        children: [
                          buildGoldenTextfield('Venue', (value){
                            _title = value;
                          }),

                          buildGoldenTextfield('Description', (value){
                            _venue = value;
                          }
                          ),

                          InkWell(
                            child: Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(
                                    Radius.circular(
                                        8)),
                                gradient:
                                LinearGradient(
                                    colors: [
                                      kgradientYellow,
                                      kgolder2
                                    ]),
                                border: Border.all(
                                  color: kgolder,
                                  width: 2,
                                ),
                              ),
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                    hintText:    dateSelected ?? "Date & Time",

                                    filled: true,
                                    fillColor: Colors.transparent,
                                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                                ),
                              ),
                            ),
                            onTap: () async {
                              DatePicker.showDateTimePicker(
                                context,
                                theme:DatePickerTheme(backgroundColor: kgolder2,doneStyle: TextStyle(color: Colors.black)),
                                showTitleActions: true,
                                minTime: DateTime.now(),
                                maxTime: DateTime(2050, 6, 7),
                                onChanged: (date) {
                                  setState1(() {
                                    dateSelected =
                                        DateFormat('yyyy-MM-dd hh:mm a')
                                            .format(date);
                                  });
                                },
                                onConfirm: (date) {
                                  setState1(() {
                                    dateSelected =
                                        DateFormat('yyyy-MM-dd hh:mm a')
                                            .format(date);
                                  });

                                },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en,
                              );
                            },
                          ),

                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () async {

                                  if (dateSelected != null) {
                                    setState1(() {
                                      _isLoading = true;
                                    });
                                    await AllApi().postCourses(
                                      coursesModel: CoursesModel(
                                        title: _title,
                                        venue: _venue,
                                        date: dateSelected,
                                        hrId: widget.userModel.empId,
                                        companyId: widget.userModel.companyId,
                                      ),
                                      hrName: widget.userModel.name!,
                                    );
                                    setState1(() {
                                      _isLoading = false;
                                    });
                                    Get.back();
                                    setState((){});
                                  } else {
                                    Fluttertoast.showToast(
                                      msg: 'Please fill all the details.',
                                    );
                                  }
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: kgolder,

                                  ),
                                  child:Padding(
                                    padding:  EdgeInsets.only(left: 8,right: 8),
                                    child: Center(child: Text("Add",style: TextStyle(color: kblack,fontSize:18),)),
                                  ) ,
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child: Padding(
                                  padding:  EdgeInsets.only(left: 8,right: 8),
                                  child: Center(child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
        ),
        radius: 50
    );

  }

  void _deleteCourse(
      {
    required List<CoursesModel> coursesList,
    required int index,
  }
  ) {
    bool _isLoading = false;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState1) {
            return AlertDialog(
              title: _isLoading
                  ? null
                  : const Text(
                'Delete Courses',
              ),
              content: _isLoading
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
                  : const Text(
                "Are you sure you want to delete this course?",
              ),
              actions: _isLoading
                  ? null
                  : [
                TextButton(
                  onPressed: () async {
                    setState1(() {
                      _isLoading = true;
                    });

                    await AllApi().deleteCourses(
                        widget.userModel.companyId!,
                        coursesList[index].title!);
                    setState1(() {
                      _isLoading = false;
                    });
                    Get.back();
                    setState(() {});
                  },
                  child: const Text('Delete'),
                ),
                TextButton(
                  onPressed: () async {
                    Get.back();
                  },
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
