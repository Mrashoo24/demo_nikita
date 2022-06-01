import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Components/constants.dart';

class NewAdmin extends StatefulWidget {
  const NewAdmin({Key? key}) : super(key: key);

  @override
  _NewAdminState createState() => _NewAdminState();
}

class _NewAdminState extends State<NewAdmin> {

  var _isLoading = false;
  var _employeeName = 'Select Employee';
  var _jobDescription = '';
  var _selectedValue = 0;
  var _fromDate = '';
  var _toDate = '';
  String _selectedFilter = 'Pending';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(

         leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: kgolder,
            ),
            onPressed: () {
              // do something
            },
          ),
        leadingWidth: 25,

        title: Text('Administrative Leave',style: TextStyle(color:kgolder),),


        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    kblack,
                    kblack,
                  ]
              )
          ),
        ),
      ),

      body:

//       Container(
//       decoration: BoxDecoration(
//       gradient: LinearGradient(
//       begin: Alignment.topCenter,
//
//       end: Alignment.center,
//       colors: [
//         Colors.white,
//         kgolder,
//       ],
//     )
//     ),
//
// )
        DefaultTabController(
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
                    height: 59,
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
                          SizedBox(height: 8,),
                          TabBar(

                            labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight:FontWeight.w600),
                            labelColor: Colors.black,
                            unselectedLabelColor:  kgolder,
                            indicator: BoxDecoration(
                                color: kgolder,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(14),
                                    bottomLeft: Radius.circular(14))
                            ),
                            tabs: [
                              Tab(child: Text("Search",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),),
                              // Tab(child: Text("Request",style: TextStyle(fontSize: 16),),),
                              Tab(child: Text("Alloted",style: TextStyle(fontSize: 18,fontFamily:'Typo Round',fontWeight: FontWeight.w400),),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 45,
                    width: Get.width*0.9,
                    decoration: BoxDecoration(border: Border.all(color: kgolder),color:kblack,borderRadius: BorderRadius.all(Radius.circular(9),),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Select Employee',style: TextStyle(color: kgolder,fontSize: 19),),
                          Icon(Icons.keyboard_arrow_down,color: kgolder,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(border: Border.all(color: kgolder),color:kblack,borderRadius: BorderRadius.all(Radius.circular(9),),
                          ),
                          child: DropdownSearch(
                            emptyBuilder: (context, searchEntry) => Center(
                              child: Text(
                                "No results found for '$searchEntry'",
                              ),
                            ),
                            mode: Mode.MENU,
                            items: [],
                            showSearchBox: true,
                            // onChanged: (String? value) {
                            //   setState(() {
                            //     _employeeName = value as String;
                            //   });
                            // },
                            selectedItem: _employeeName,
                            dropdownSearchDecoration:  InputDecoration(
                              label: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Select Employee',style:TextStyle(color:kgolder,fontSize: 28),),
                              ),
                              // icon: Image.asset('assets/Images/employee.png',width: 40,height: 40,),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 45,
                          width: Get.width*0.3,
                          decoration: BoxDecoration(border: Border.all(color: kblack,width: 3),color:kgolder,borderRadius: BorderRadius.all(Radius.circular(17),),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Search',style: TextStyle(color: kblack,fontSize: 19),),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),

                ],
              ),
            ),
          ),
        )


    );
  }
}
