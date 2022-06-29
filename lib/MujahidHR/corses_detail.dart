import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Components/api.dart';
import '../Components/constants.dart';
import '../Components/models.dart';

class CoarsesDetails extends StatefulWidget {
  final CoursesModel? coursesModel;
  final UserModel? userModel;
  const CoarsesDetails({Key? key, this.coursesModel, this.userModel})
      : super(key: key);

  @override
  _CoarsesDetailsState createState() => _CoarsesDetailsState();
}

class _CoarsesDetailsState extends State<CoarsesDetails> {
  String? search;
  bool loading = false;
  List<CoursesModel>? newListOfCoarse;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              kGray3,
              kblack,
            ],
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
            widget.coursesModel!.title!,
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
        body: loading
            ? kprogressbar
            : FutureBuilder< List<CoursesModel> ?>(
                future: AllApi().getCoursesDetails(
                  companyid: widget.userModel!.companyId!,
                  courseId: widget.coursesModel!.courseId!,
                ),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return kprogressbar;
                  }
                  List<CoursesModel>? coursesList =
                      search == null || search.toString().isBlank!
                          ? snapshot.requireData
                          : newListOfCoarse;

                  return Container(
                    height: Get.height,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            kGray3,
                            kblack,
                          ],
                        )),
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
                                search = value!.removeAllWhitespace;
                                newListOfCoarse = coursesList!
                                    .where((element) => element.emp_name!
                                        .toLowerCase()
                                        .contains(search!.removeAllWhitespace
                                            .toLowerCase()))
                                    .toList();
                              });
                            },
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                search == null || search.toString().isBlank!
                                    ? coursesList!.length
                                    : newListOfCoarse!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        """
Employee Name: ${coursesList![index].emp_name}""",
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        """
Employee Number: ${coursesList[index].emp_phone}""",
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    _onPressedCheckIn(
                                                      coursesList:
                                                          coursesList,
                                                      index: index,
                                                    );
                                                  },
                                                  child:
                                                      const Text("CheckIn",style: TextStyle(color: kblack),),
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(
                                                      kgolder2,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  coursesList[index].checkin!,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    _onPressedCheckOut(
                                                      coursesList:
                                                          coursesList,
                                                      index: index,
                                                    );
                                                  },
                                                  child: const Text(
                                                    "CheckOut",style: const TextStyle(color: kblack
                                                  ),
                                                  ),
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(kgolder2),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  coursesList[index].checkout!,
                                                  style: const TextStyle(
                                                    fontSize: 18,color: kblack
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  );
                }),
      ),
    );
  }

  void _onPressedCheckIn({
    required List<CoursesModel> coursesList,
    required int index,
  }) async {
    setState(() {
      loading = true;
    });
    await AllApi().updateCheckinCourses(
      CoursesModel(
        checkin: DateFormat("hh:mm a").format(DateTime.now()).toString(),
        companyId: widget.userModel!.companyId,
        empid: coursesList[index].empid,
        courseId: coursesList[index].courseId,
      ),
    );
    setState(() {
      loading = false;
    });
  }

  void _onPressedCheckOut({
    required List<CoursesModel> coursesList,
    required int index,
  }) async {
    setState(() {
      loading = true;
    });
    await AllApi().updateCheckoutCourses(
      CoursesModel(
        checkout: DateFormat("hh:mm a").format(DateTime.now()).toString(),
        companyId: widget.userModel!.companyId,
        empid: coursesList[index].empid,
        courseId: coursesList[index].courseId,
      ),
    );
    setState(() {
      loading = false;
    });
  }
}
