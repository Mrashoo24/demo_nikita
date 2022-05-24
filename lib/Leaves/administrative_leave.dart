import 'package:demo_nikita/Components/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get_core/get_core.dart';

import '../Components/constants.dart';
import '../Components/models.dart';

class AdminstrativLeave extends StatefulWidget {
  final UserModel? userModel;

  const AdminstrativLeave({Key? key, this.userModel}) : super(key: key);

  @override
  State<AdminstrativLeave> createState() => _AdminstrativLeaveState();
}

class _AdminstrativLeaveState extends State<AdminstrativLeave> {
  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:  AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    kblack,
                    kGray
                  ]
              )
          ),
        ),
        leading: SizedBox(),
        title: Text("Administrative Leaves",style: TextStyle(color: kgolder),),
        titleSpacing: 5,
        shadowColor: Colors.transparent,
      ),
      body: DefaultTabController(
        length: 1,
        child: Scaffold(

          body: Column(
            children: [
              FutureBuilder<List<AdminLeavesModel>?>(
                  future: AllApi().getAdminLeaves(
                    verify: '1',
                    companyId: widget.userModel!.companyId,
                    refId: widget.userModel!.refId,
                  ),
                builder: (context, snapshot) {


                  if (!snapshot.hasData) {
                    return kprogressbar;
                  }
                  if (snapshot.data!.isEmpty) {
                    return kprogressbarFull;
                  }

                  var adminLeavesList = snapshot.data;


                  return ListView.builder(
                      itemCount: adminLeavesList!.length,
                      itemBuilder: (context, index) {                    var adminleave= adminLeavesList[index];
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 700),
                          child: SlideAnimation(
                            duration: Duration(milliseconds: 500),
                            horizontalOffset: 200.0,
                            child: FadeInAnimation(
                              child: Container(
                                margin: EdgeInsets.all(8),
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
                                          image: DecorationImage(
                                              image: AssetImage("assets/bg.jpg"),
                                              fit: BoxFit.cover
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(adminleave.employeeName!),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Designation:",style: TextStyle(color: kgolder)),Text(widget.userModel!.designation!,style: TextStyle(color: kgolder),)
                                            ],
                                          ),
                                          // Row(
                                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //   children: [
                                          //     Text("Designation:",style: TextStyle(color: kgolder)),Text("HR",style: TextStyle(color: kgolder),)
                                          //   ],
                                          // ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Employee ID",style: TextStyle(color: kgolder)),Text(adminleave.empId!,style: TextStyle(color: kgolder),)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Email",style: TextStyle(color: kgolder)),Text(widget.userModel!.email!,style: TextStyle(color: kgolder),)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Phone Number",style: TextStyle(color: kgolder)),Text(widget.userModel!.phoneNumber!,style: TextStyle(color: kgolder),)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Office",style: TextStyle(color: kgolder)),Text(widget.userModel!.allotedOffice!,style: TextStyle(color: kgolder),)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("From",style: TextStyle(color: kgolder)),Text(adminleave.from!,style: TextStyle(color: kgolder),)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("To",style: TextStyle(color: kgolder)),Text(adminleave.to!,style: TextStyle(color: kgolder),)
                                            ],
                                          ),
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                          ),
                        );

                    }
                  );
                }
              ),
              SizedBox(height: 80,)
            ],
          )
        ),
      ),
    );
  }
}
