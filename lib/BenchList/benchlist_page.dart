import 'package:demo_nikita/Components/constants.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:intl/intl.dart';

import '../Components/api.dart';
import '../Components/models.dart';

class BenchList extends StatefulWidget {
  final UserModel? userModel;
  const BenchList({Key? key, this.userModel}) : super(key: key);

  @override
  _BenchListState createState() => _BenchListState();
}

class _BenchListState extends State<BenchList> {
  final _formKey = GlobalKey<FormState>();
  final _allApi = AllApi();

  List<BenchListModel>? _historyList;

  UserModel? _employeeDetails;
  var _isLoading = false;
  var _employeeName = 'Select Employee';
  var _jobDescription = '';
  var _selectedValue = 0;
  var _fromDate = '';
  var _toDate = '';
  String _selectedFilter = 'Pending';

  final List _filters = [
    'Pending',
    'Accepted',
    'Rejected',
  ];

  bool _trySubmit() {
    FocusScope.of(context).unfocus();
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
    return isValid;
  }

  Widget _requestForm() {
    return SingleChildScrollView(
      child: FutureBuilder<List<UserModel>?>(
        future: _allApi.getAllUsers(
          companyId: widget.userModel!.companyId,
        ),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return kprogressbar;
          } else {
            var employeeList = snapshot.data;
            employeeList=    employeeList!.where((element) => element.designation != 'hr' && element.designation != 'manager').toList();
            return Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    DropdownSearch(
                      emptyBuilder: (context, searchEntry) => Center(
                        child: Text(
                          "No results found for '$searchEntry'",
                        ),
                      ),
                      mode: Mode.MENU,
                      items: employeeList.map((e) => e.name).toList(),
                      showSearchBox: true,
                      // onChanged: (value) {
                      //   setState(() {
                      //     _employeeName = (value as String?)! ;
                      //   });
                      // },
                      onChanged: (String? data) => setState((){
                        _employeeName = data!;
                      }),

                      selectedItem: _employeeName,
                      dropdownSearchDecoration:  InputDecoration(
                        label: Text('Select Employee'),
                        // icon: Image.asset('assets/Images/employee.png',width: 40,height: 40,),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        expands: true,

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please write the job description';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _jobDescription = value as String;
                        },
                        onChanged: (value) {
                          _jobDescription = value;
                        },
                        decoration:  InputDecoration(
                          label: Text('Job Description',style: TextStyle(color: kblack),),
                          hintText: 'Write details of the job to be assigned',
                          // icon: Image.asset('assets/Images/description.png',width: 40,height: 40,),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      child: const Text(
                        'Type of replacement:',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: RadioListTile(
                            activeColor: kgolder,
                            value: 1,
                            title: const FittedBox(
                              child: Text(
                                'Temporary',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            groupValue: _selectedValue,
                            onChanged: (value) => setState(
                              () {
                                _selectedValue = value as int;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: RadioListTile(
                            activeColor: kgolder,
                            value: 2,
                            title: const FittedBox(
                              child: Text(
                                'Permanent',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            groupValue: _selectedValue,
                            onChanged: (value) => setState(
                              () {
                                _selectedValue = value as int;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (_selectedValue == 1)
                      Column(
                        children: [
                          InkWell(
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                label: Text(
                                  _fromDate == '' ? 'From' : _fromDate,
                                ),
                                icon: const Icon(Icons.calendar_today),
                              ),
                              keyboardType: TextInputType.datetime,
                            ),
                            onTap: () {
                              DatePicker.showDateTimePicker(
                                context,
                                showTitleActions: true,
                                minTime: DateTime.now(),
                                maxTime: DateTime(2050, 6, 7),
                                onChanged: (date) {
                                  setState(() {
                                    _fromDate = DateFormat('dd/MM/yyyy hh:mm a')
                                        .format(date);
                                  });
                                },
                                onConfirm: (date) {
                                  setState(() {
                                    _fromDate = DateFormat('dd/MM/yyyy hh:mm a')
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
                              enabled: false,
                              decoration: InputDecoration(
                                label: Text(
                                  _toDate == '' ? 'To' : _toDate,
                                ),
                                icon: const Icon(Icons.calendar_today),
                              ),
                              keyboardType: TextInputType.datetime,
                            ),
                            onTap: () {
                              DatePicker.showDateTimePicker(
                                context,
                                showTitleActions: true,
                                minTime: DateTime.now(),
                                maxTime: DateTime(2050, 6, 7),
                                onChanged: (date) {
                                  setState(() {
                                    _toDate = DateFormat('dd/MM/yyyy hh:mm a')
                                        .format(date);
                                  });
                                },
                                onConfirm: (date) {
                                  setState(() {
                                    _toDate = DateFormat('dd/MM/yyyy hh:mm a')
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
                    const SizedBox(
                      height: 20,
                    ),
                    if (_employeeDetails != null)
                      Column(
                        children: [
                          Container(
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
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Employee Details:',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,color: kgolder
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Name: ${_employeeDetails!.name}',
                                  style: const TextStyle(
                                    fontSize: 16,color: kgolder
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Id: ${_employeeDetails!.empId}',
                                  style: const TextStyle(
                                    fontSize: 16,color: kgolder
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Phone: ${_employeeDetails!.phoneNumber}',
                                  style: const TextStyle(
                                    fontSize: 16,color: kgolder
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Email: ${_employeeDetails!.email}',
                                  style: const TextStyle(
                                    fontSize: 16,color: kgolder
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Manager: ${_employeeDetails!.manager}',
                                  style: const TextStyle(
                                    fontSize: 16,color: kgolder
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(kgolder),
                              shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                              ),
                            ),
                            child: const Text('Submit',style: TextStyle(color: kblack),),
                            onPressed: () async {
                              final canSubmit = _trySubmit();
                              if (canSubmit) {
                                setState(() {
                                  _isLoading = true;
                                });
                                var result = await _allApi.postBenchList(
                                    userModel: widget.userModel,
                                    replacementUserModel: _employeeDetails,
                                    jobDescription: _jobDescription,
                                    replacementType: _selectedValue == 1
                                        ? 'Temporary'
                                        : 'Permanent',
                                    fromDate: _fromDate,
                                    toDate: _toDate,
                                    hr_refid: widget.userModel!.hrId,
                                    manager_refid: widget.userModel!.managerid);
                                setState(() {
                                  _isLoading = false;
                                });
                                if (result == 'Success') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Request sent successfully'),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Request failed',
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                Fluttertoast.showToast(
                                  msg: 'Please fill all the details',
                                );
                              }
                            },
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    if (_isLoading)
                      kprogressbar,
                    if (!_isLoading && _employeeDetails == null)
                      ElevatedButton(
                        child: const Text('Search',style: TextStyle(color: kblack),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            kgolder,
                          ),
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          final canSearch = _trySubmit();
                          print('gotdetail = $_employeeName = ');
                          if (canSearch && _employeeName != 'Select Employee') {
                            setState(() {
                              _isLoading = true;
                            });
                            _employeeDetails =
                                await _allApi.getemployeeBenchList(
                              name: _employeeName,
                            );
                            setState(() {
                              _isLoading = false;
                            });
                            if (_employeeDetails == null) {
                              Fluttertoast.showToast(msg: 'Please Fill All Details1');

                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(
                              //     content: Text(
                              //       'Employee details were not found. Please check the name and try again.',
                              //     ),
                              //   ),
                              // );
                            }
                          } else {
                            Fluttertoast.showToast(msg: 'Please Fill All Details');
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(
                            //     content: Text(
                            //       'Please fill all the details.',
                            //     ),
                            //   ),
                            // );
                          }
                        },
                      ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _acceptedRequests() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
              color: _selectedFilter == 'Accepted'
                  ? Colors.green
                  : _selectedFilter == 'Rejected'
                  ? Colors.red
                  : Colors.amber,
            ),
            padding: const EdgeInsets.all(12.0),
            height: MediaQuery.of(context).size.height * 0.07,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                iconDisabledColor: Colors.black,
                iconEnabledColor: Colors.black,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                isExpanded: true,
                value: _selectedFilter,
                onChanged: (value) {
                  setState(() {
                    _selectedFilter = value as String;
                  });
                },
                hint: const Text('Select Filter'),
                items: _filters.map(
                      (e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e,),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder<List<BenchListModel>?>(
            future: _allApi.getBenchListRequests(
              verify: _selectedFilter == 'Accepted'
                  ? '1'
                  : _selectedFilter == 'Rejected'
                      ? '-1'
                      : '0',
              companyId: widget.userModel!.companyId,
              empId: widget.userModel!.empId,
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Image.asset("assets/Images/loading.gif"),
                );
              } else if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No Records'),
                );
              } else {
                var list = snapshot.data;
                _historyList = list;
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      var refreshList = await _allApi.getBenchListRequests(
                        verify: _selectedFilter == 'Accepted'
                            ? '1'
                            : _selectedFilter == 'Rejected'
                                ? '-1'
                                : '0',
                        companyId: widget.userModel!.companyId,
                        empId: widget.userModel!.empId,
                      );
                      setState(() {
                        _historyList = refreshList;
                      });
                    },
                    child: ListView.builder(
                      itemCount: _historyList!.length,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 700),
                          child: SlideAnimation(
                            duration: Duration(milliseconds: 500),
                            horizontalOffset: 200.0,
                            child: FadeInAnimation(
                              child:  Card(
                                color: Colors.transparent,
                                elevation: 8,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                                child: Container(

                                  decoration: BoxDecoration(
                                    gradient:  LinearGradient(
                                      colors: [Colors.black, Colors.grey.shade600],
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,),

                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Employee Name: ',
                                            style: TextStyle(color: kgolder),
                                          ),
                                          Text(
                                            _historyList![index].replacementName!,
                                            style: TextStyle(color: kgolder),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Employee Id: ',
                                            style: TextStyle(color: kgolder),
                                          ),
                                          Text(
                                            _historyList![index].replacementEmpId!,
                                            style: TextStyle(color: kgolder),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Date: ',
                                            style: TextStyle(color: kgolder),
                                          ),
                                          Text(
                                            _historyList![index].timeStamp!,
                                            style: TextStyle(color: kgolder),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Status: ',
                                            style: TextStyle(color: kgolder),
                                          ),
                                          Text(
                                            _historyList![index].verify == '1'
                                                ? 'Accepted'
                                                : _historyList![index].verify == '0'
                                                ? 'Pending'
                                                : 'Rejected',
                                            style: TextStyle(color: kgolder),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );

                      },
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          // backgroundColor: Colors.transparent,
          // appBar: AppBar(
          //   automaticallyImplyLeading: false,
          //   backgroundColor: Colors.black,
          //   title: const Text('Bench List',style: TextStyle(color: kgolder),),
          //   bottom: TabBar(
          //     indicator: BoxDecoration(
          //         color: kgolder,
          //         borderRadius: BorderRadius.only(
          //             bottomRight: Radius.circular(12),
          //             bottomLeft: Radius.circular(12)),
          //
          //         border: Border.all(
          //             width: 2)
          //
          //
          //     ),
          //     tabs: const [
          //       Tab(
          //         // text: 'Request Form',
          //         child: Text('Request Form',style: TextStyle(color: kblack),),
          //       ),
          //       Tab(
          //         child: Text('Request',style: TextStyle(color: kblack),),
          //       ),
          //     ],
          //   ),
          // ),
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
                  // height: screenHeight / 5.5,
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
                            SizedBox( width: 10,),
                            // InkWell(
                            //     onTap: (){
                            //       // Get.back();
                            //     },
                            //     child: Icon(Icons.arrow_back,color: kgolder,)),
                            SizedBox(width: 15),
                            Text("Bench List",style: TextStyle(color: kgolder,fontSize: 18),)
                          ],
                        ),
                        SizedBox(height: 8,),
                        TabBar(
                          indicator: BoxDecoration(
                              color: kgolder,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12)),

                              border: Border.all(
                                  width: 2)


                          ),
                          tabs: const [
                            Tab(
                              // text: 'Request Form',
                              child: Text('Request Form',style: TextStyle(color: kblack),),
                            ),
                            Tab(
                              child: Text('Request',style: TextStyle(color: kblack),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: TabBarView(
                      children: [
                        _requestForm(),
                        _acceptedRequests(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
