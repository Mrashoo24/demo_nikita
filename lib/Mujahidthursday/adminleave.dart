import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../Components/constants.dart';
import '../Components/api.dart';
import '../Components/models.dart';

class AdminLeavesss extends StatefulWidget {
  final UserModel userModel;

  const AdminLeavesss({Key? key, required this.userModel}) : super(key: key);

  @override
  _NewAdminState createState() => _NewAdminState();
}

class _NewAdminState extends State<AdminLeavesss> {
  final GlobalKey expansionTile = new GlobalKey();
  UserModel? employeeDetails;
  String? dateSelected;
  String? todateSelected;
  DateTime? dateSelectedfrm;
  DateTime? todateSelectedfrm;

  var _isLoading = false;
  var selectedEmployee = '';
  var isExpanded = false;

  var _jobDescription = '';
  var _selectedValue = 0;
  var _fromDate = '';
  var _toDate = '';
  String _selectedFilter = 'Pending';
  List<AdminLeavesModel>? _allotedList;

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: true,

        // appBar:  AppBar(
        //   leading:  InkWell(
        //     onTap: (){
        //       Get.back();
        //     },
        //     child: Padding(
        //       padding:   EdgeInsets.only(left: 10.0),
        //       child: Icon(Icons.arrow_back,color: kblack),
        //     ),
        //   ),
        //   leadingWidth: 25,
        //   title: Text('Administrative Leave',style: TextStyle(color:kblack,fontWeight: FontWeight.bold),),
        //
        //
        //   flexibleSpace: Container(
        //     decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //           colors: [ kgolder2,kgradientYellow,kgolder2]
        //       ),
        //     ),
        //   ),
        //
        //   toolbarHeight: 55,
        //   elevation: 0,
        // ),

        body: DefaultTabController(
          length: 2,
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(

                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [kGray3, kblack, kGray3,  kblack,]
                  ),

                ),
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [ kgolder2,kgradientYellow,kgolder2]
                        ),

                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              height: 55,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Get.back();
                                    },
                                    child: Padding(
                                      padding:   EdgeInsets.only(left: 10.0),
                                      child: Icon(Icons.arrow_back,color: kblack),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text('Administrative Leave',style: TextStyle(color:kblack,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),

                            TabBar(
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight:FontWeight.w600),

                              labelColor: kgolder2,
                              unselectedLabelColor:  kblack,
                              indicator: BoxDecoration(
                                color: kgolder,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(14),
                                    bottomLeft: Radius.circular(14)),
                                border: Border.all(
                                  color:kgolder,
                                  width: 2,
                                ),
                                gradient: LinearGradient(

                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [   kblack, kGray3,]
                                ),
                              ),
                              tabs: [
                                Tab(child: Text("Search",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.bold),),),
                                // Tab(child: Text("Request",style: TextStyle(fontSize: 16),),),
                                Tab(child: Text("Alloted",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.bold),),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: TabBarView(
                            children :[
                              Padding(
                          padding:   EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                InkWell(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(9),),
                                                ),
                                                child: ExpansionTile(
                                                  onExpansionChanged: (expanding){
                                                    print('expanded $expanding');
                                                    setState((){
                                                      isExpanded = false;
                                                    });
                                                  },
                                                  key: expansionTile,
                                                  // tilePadding: EdgeInsets.only(left: 16),
                                                  trailing:  SizedBox.shrink(),
                                                  expandedCrossAxisAlignment: CrossAxisAlignment.center,
                                                  collapsedIconColor: kblack,
                                                  iconColor: kblack,
                                                  collapsedBackgroundColor:Colors.transparent,
                                                  backgroundColor: Colors.transparent,
                                                  title:  SingleChildScrollView(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 2,
                                                            color: kgolder),
                                                        gradient: LinearGradient(
                                                            colors: [ kgradientYellow,kgolder2]
                                                        ),
                                                        borderRadius: BorderRadius.all(Radius.circular(9),),
                                                      ),
                                                      child: Padding(
                                                        padding:  EdgeInsets.all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text( selectedEmployee == '' ?  'Select Employee' : selectedEmployee,style: TextStyle(color: kblack,fontSize: 19,fontWeight:FontWeight.bold),),
                                                            Icon(Icons.keyboard_arrow_down,color: kblack,)
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  tilePadding: EdgeInsets.only(left: 25),
                                                  children:  [
                                                    isExpanded ? Container(height: 0,) :  Container(
                                                        margin: EdgeInsets.only(left: 25,right: 30),
                                                      width: Get.width,
                                                      decoration: BoxDecoration(
                                                          gradient: LinearGradient(
                                                              colors: [ kgradientYellow,kgolder2]
                                                          ),
                                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                                          border: Border.all(
                                                            color:kgolder,
                                                            width: 2,
                                                          )
                                                      ),
                                                      child:   Padding(
                                                        padding:   EdgeInsets.all(5),
                                                        child: Column(
                                                          children: [
                                                            Container(

                                                              width: Get.width,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                                                  gradient: LinearGradient(
                                                                      colors: [ kGray3,kblack]
                                                                  ),
                                                                  border: Border.all(
                                                                    color:kgolder,
                                                                    width: 2,
                                                                  )
                                                              ),
                                                              child: TextFormField(
                                                                onChanged: (value){
                                                                  setState((){

                                                                  });
                                                                },
                                                                controller: searchController,
                                                                style: TextStyle(color: kgolder2),
                                                                cursorColor: kgolder2,
                                                                decoration: InputDecoration(
                                                                  isDense: true,
                                                                  contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                                                    filled: true,
                                                                    fillColor: Colors.transparent,
                                                                  hintText: 'Search...',
                                                                  hintStyle: TextStyle(color: kgolder2),
                                                                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))

                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(height: 10),
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: FutureBuilder<List<UserModel>?> (
                                                                  future: AllApi().getAllUsers(
                                                                    companyId: widget.userModel.companyId,
                                                                  ),
                                                                  builder: (context, snapshot) {
                                                                    if (!snapshot.hasData) {
                                                                      return kprogressbar;
                                                                    }
                                                                    List<UserModel> employeeList = snapshot.data!;

                                                                    print('controller = ${
                                                                    searchController.text
                                                                    }');
                                                                    employeeList = searchController.text.isNotEmpty ?
                                                                        employeeList.where((element) => element.name!.toLowerCase().contains(searchController.text.toLowerCase())).toList()
                                                                    : employeeList
                                                                    ;

                                                                  return Container(
                                                                    height: 200,
                                                                    child: ListView.builder(
                                                                      shrinkWrap: true,
                                                                      itemCount: employeeList.length,
                                                                      itemBuilder: (context, index) {

                                                                        return
                                                                          InkWell(
                                                                            onTap: (){

                                                                              setState((){
                                                                            selectedEmployee = employeeList[index].name!;
                                                                            isExpanded = true;

                                                                              });

                                                                            },
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.only(bottom: 10.0),
                                                                              child: Text(employeeList[index].name!,style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                                                            ),
                                                                          );

                                                                      }
                                                                    ),
                                                                  );
                                                                }
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                                InkWell(
                                  onTap: (){
                                    if (selectedEmployee != '') {
                                      _onPressedSearch(
                                        name: selectedEmployee,
                                      );
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: 'Please select one employee',
                                      );
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 100,

                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: kblack,
                                          width: 2),
                                      color:kgolder,borderRadius: BorderRadius.all(Radius.circular(12),),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Search',style: TextStyle(color: kblack,fontSize: 18,fontWeight: FontWeight.bold),),

                                      ],
                                    ),
                                  ),
                                ),

                                employeeDetails != null
                                    ? detailCard() : SizedBox()




                              ],
                            ),
                          ),
                        ),
                              FutureBuilder<List<AdminLeavesModel>?>(
                                  future: AllApi().getAdminLeaves(
                                    verify: '1',
                                    companyId: widget.userModel.companyId,
                                  ),
                                builder: (context, snapshot) {

                                  if (!snapshot.hasData) {
                                    return kprogressbar;
                                  } else if (snapshot.data!.isEmpty) {
                                    return Container(
                                      height: MediaQuery.of(context).size.height,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'No Records',
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: kgolder
                                        ),
                                      ),
                                    );
                                  }else{

                                    var adminLeaves = snapshot.data;
                                    _allotedList = adminLeaves;

                                    return ListView.builder(
                                        itemCount: _allotedList!.length,
                                        itemBuilder: (context, index) {
                                        return
                                          AnimationConfiguration.staggeredList(
                                            position: index,
                                            duration: const Duration(milliseconds: 700),
                                            child: SlideAnimation(
                                              duration: Duration(milliseconds: 500),
                                              horizontalOffset: 200.0,
                                              child: FadeInAnimation(
                                                  child:     buildAllotedCard(adminLeaves![index])
                                              ),
                                            ),
                                          );



                                      }
                                    );
                                  }


                                }
                              )
                            ]
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )


    );



  }

  Padding buildAllotedCard(AdminLeavesModel adminLeavesModel) {
    return Padding(
                            padding:   EdgeInsets.all(10),
                            child: Container(
                              width: Get.width,

                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [ kgradientYellow,kgolder2]
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  border: Border.all(
                                    color:kgolder,
                                    width: 2,
                                  )
                              ),
                              child: Padding(
                                padding:   EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 35,

                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          gradient: LinearGradient(
                                              colors: [ kGray3,kblack]
                                          ),
                                          border: Border.all(
                                            color:kgolder,
                                            width: 2,
                                          )
                                      ),
                                      child: Row(
                                        children: [
                                          Center(
                                            child: Padding(
                                              padding:   EdgeInsets.only(left: 10.0),
                                              child: Text(adminLeavesModel.employeeName!,style: TextStyle(color: kgolder,fontSize:20),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Emp ID: ",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                            Text(adminLeavesModel.empId!,style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                          ],
                                        ),     SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Designation: ",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                            Text("Software Engineer",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                          ],
                                        ),     SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("From: ",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                            Text(adminLeavesModel.from!,style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("To: ",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                            Text(adminLeavesModel.to!,style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                          ],
                                        ),     SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("No od Days Alloted: ",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                            Text("3",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Admin Leaves Count: ",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                            Text("3",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                        SizedBox(height: 5,)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
  }
  void _onPressedAllot({
    @required String? numberOfDays,
    @required String? from,
    @required String? to,
  }) async {
    print('adminLeave = ${employeeDetails!.adminLeaves}');
    if (employeeDetails!.adminLeaves! == '0') {
      final result = await AllApi().approveAdminLeave(
        refId: employeeDetails!.refId,
        companyId: employeeDetails!.companyId,
        employeeName: employeeDetails!.name,
        empId: employeeDetails!.empId,
        days: numberOfDays,
        from: from,
        to: to,
      );
      if (result == 'approved') {
        final incrementResult = await AllApi().incrementAdminLeave(
          refId: employeeDetails!.refId,
          companyId: employeeDetails!.companyId,
        );
        if (incrementResult == 'approved') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Leave Alloted.'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to allot leave.'),
            ),
          );
        }
        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to allot leave.'),
          ),
        );
        Navigator.of(context).pop();
      }
    } else {
      Fluttertoast.showToast(msg: 'Administrative leave can only be alloted once in a year.');

    }
  }

  detailCard(){
    return Column(
      children: [
        Container(
          width: Get.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [ kgradientYellow,kgolder2]
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                color:kgolder,
                width: 2,
              )
          ),
          child: Padding(
            padding:   EdgeInsets.all(5),
            child: Column(
              children: [
                Container(
                  height: 35,

                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      gradient: LinearGradient(
                          colors: [ kGray3,kblack]
                      ),
                      border: Border.all(
                        color:kgolder,
                        width: 2,
                      )
                  ),
                  child: Row(
                    children: [
                      Center(
                        child: Padding(
                          padding:   EdgeInsets.only(left: 10.0),
                          child: Text(employeeDetails!.name!,style: TextStyle(color: kgolder,fontSize:20),),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Designation :",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                        Text(employeeDetails!.designation!,style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Employee ID :",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                        Text(employeeDetails!.empId!,style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email :",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                        Text(employeeDetails!.email!,style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone Number :",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                        Text(employeeDetails!.phoneNumber!,style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Admin Leaves Consumed :",style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                        Text('0',style: TextStyle(color: kblack, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Text('From',style: TextStyle(color: kgolder2,fontSize: 19,fontWeight:FontWeight.bold),),
          ],
        ),
        Container(
          height: 36,
          width: Get.width,
          decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: kgolder),
            gradient: LinearGradient(
                colors: [ kgradientYellow,kgolder2]
            ),
            borderRadius: BorderRadius.all(Radius.circular(9),),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: (){
                DatePicker.showDatePicker(
                  context,
                  theme:DatePickerTheme(backgroundColor: kgolder,doneStyle: TextStyle(color: Colors.black)),

                  showTitleActions: true,
                  minTime: DateTime.now()
                     ,
                  maxTime: DateTime(2050, 6, 7),
                  onChanged: (date) {
                    setState(() {
                      dateSelected = date.toString();
                      dateSelectedfrm = date;
                    });
                  },
                  onConfirm: (date) {
                    setState(() {
                      dateSelected = date.toString();
                      dateSelectedfrm = date;
                    });
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.en,
                );
              },
              child: Container(
                padding: EdgeInsets.only(left: 5),
                child: Align(
                    alignment: Alignment.centerRight,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(dateSelected == null
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
                                .toString(),style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold) ,),
                        Icon(Icons.keyboard_arrow_down,color: kblack,),
                      ],
                    )),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Text('To',style: TextStyle(color: kgolder,fontSize: 19,fontWeight:FontWeight.bold),),
          ],
        ),
        SizedBox(height: 10,),
        Container(
          height: 36,
          width: Get.width,
          decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: kgolder),
            gradient: LinearGradient(
                colors: [ kgradientYellow,kgolder2]
            ),
            borderRadius: BorderRadius.all(Radius.circular(9),),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: (){
                DatePicker.showDatePicker(
                  context,
                  theme:DatePickerTheme(
                      backgroundColor: kgolder2,
                      doneStyle: TextStyle(color: Colors.black)),

                  showTitleActions: true,
                  minTime: DateTime.now()
                   ,
                  maxTime: DateTime(2050, 6, 7),
                  onChanged: (date) {
                    setState(() {
                      todateSelected = date.toString();
                      todateSelectedfrm = date;

                    });
                  },
                  onConfirm: (date) {
                    setState(() {
                      todateSelected = date.toString();
                      todateSelectedfrm = date;

                    });
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.en,
                );
              },
              child: Container(
                padding: EdgeInsets.only(left: 5),
                child: Align(
                    alignment: Alignment.centerRight,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(todateSelected == null
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
                                .toString(),style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold) ,),
                        Icon(Icons.keyboard_arrow_down,color: kblack,),
                      ],
                    )),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Text('No of Days',style: TextStyle(color: kgolder,fontSize: 19,fontWeight:FontWeight.bold),),
          ],
        ),
     dateSelectedfrm == null || todateSelectedfrm == null ? SizedBox() :   Container(
          height: 45,

          decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: kgolder),
            gradient: LinearGradient(
                colors: [ kgradientYellow,kgolder2]
            ),
            borderRadius: BorderRadius.all(Radius.circular(9),),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(todateSelectedfrm!.difference(dateSelectedfrm!).inDays.toString(),style: TextStyle(color: kblack,fontSize: 19,fontWeight:FontWeight.bold),),
                Icon(Icons.keyboard_arrow_down,color: kblack,)
              ],
            ),
          ),
        ),
        SizedBox(height: 10,),

        InkWell(
          onTap: (){
            if (dateSelected != null ) {
              _onPressedAllot(
                numberOfDays:todateSelectedfrm!.difference(dateSelectedfrm!).inDays.toString(),
                from: dateSelected,
                to: todateSelected,
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Please fill all the fields.',
                  ),
                ),
              );
            }
          },
          child: Container(
            height: 40,
            width: 100,

            decoration: BoxDecoration(
              border: Border.all(
                  color: kblack,
                  width: 2),
              color:kgolder,borderRadius: BorderRadius.all(Radius.circular(12),),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Allot',style: TextStyle(color: kblack,fontSize: 18,fontWeight: FontWeight.bold),),

              ],
            ),
          ),
        ),
        SizedBox(height: 10,),

      ],
    );
  }

  void _onPressedSearch({@required String? name}) async {
    setState(() {
      _isLoading = true;
    });
    final employeeDetails1 = await AllApi().getUserByName(name: name);
    setState(() {
      _isLoading = false;
      employeeDetails = employeeDetails1;
    });
  }



}