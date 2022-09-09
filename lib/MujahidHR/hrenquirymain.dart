import 'package:demo_nikita/Components/api.dart';
import 'package:demo_nikita/MujahidHR/hrenquiryDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/constants.dart';
import '../Components/models.dart';

class HREnquiry extends StatefulWidget {
  final UserModel usermodel;

  const HREnquiry({Key? key, required this.usermodel}) : super(key: key);

  @override
  State<HREnquiry> createState() => _HREnquiryState();
}

class _HREnquiryState extends State<HREnquiry> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Container(
        decoration: BoxDecoration(
          gradient:LinearGradient(
            colors: [
              kGray3, kblack, kGray3,  kblack,
              //add more colors for gradient
            ],
            begin: Alignment.topRight, //begin of the gradient color
            end: Alignment.bottomLeft,
          ),
        ),
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
            leadingWidth: 35,
            title: Text(
              "Enquiry",
              style: TextStyle(
                  color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8))),
            toolbarHeight: 55,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [kgolder2,kgradientYellow,kgolder2]
                  ),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15))
              ),
            ),
            backgroundColor: kGray3,
            // bottom: TabBar(
            //   indicator: BoxDecoration(
            //       color: kblack,
            //       borderRadius: BorderRadius.only(
            //           bottomRight: Radius.circular(12),
            //           bottomLeft: Radius.circular(12)),
            //
            //       border: Border.all(
            //           width: 2)
            //
            //
            //   ),
            //   labelColor: kgolder2,
            //   unselectedLabelColor: kblack,
            //   tabs: const [
            //     Tab(
            //       child: Text('Upcoming'),
            //     ),
            //     Tab(
            //       child: Text('Completed'),
            //     ),
            //   ],
            // ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40,),
                Padding(
                  padding:   EdgeInsets.only(left: 20,right: 20),
                  child: SingleChildScrollView(
                    child: FutureBuilder<List<EnquiryModel>?>(
                        future: AllApi().getAllEnquiries(
                          hrId: widget.usermodel.empId!,
                          companyId: widget.usermodel.companyId!,
                        ),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return kprogressbar;
                          } else
                            if (snapshot.data!.isEmpty) {
                            return const Center(
                              child: Text('No Records'),
                            );
                          }
                         else {
                            var users = snapshot.data;

                            List listOfUsers =[];
                            Set userUids = {};

                            for (var element in users!) {
                              userUids.add(element.refId );
                            }
                            listOfUsers =   userUids.toList();





                            return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: listOfUsers.length ,
                              itemBuilder: (context, index) {

                                var userModel1 = users.firstWhere((element) => element.refId == listOfUsers[index]);


                                return BuilLeaveCard(userModel1.empName,userModel1);
                              },
                            );
                          }
                      }
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

   BuilLeaveCard(string,EnquiryModel userModel) {
    return FutureBuilder<UserModel?>(
      future: AllApi().getemployeeBenchList(name: string),
      builder: (context, snapshot) {

        if(!snapshot.hasData){
          return SizedBox();
        }

        UserModel userModel1 = snapshot.requireData!;

        return InkWell(
          onTap: () async {

            UserModel userModelNew = await AllApi().getUser(userModel.refId!);

            Get.to(HREnquiryChat(userModel: userModelNew));
          },
          child: Container(
                margin: EdgeInsets.only(top: 8),

            decoration: BoxDecoration(
             // borderRadius: BorderRadius.all(Radius.circular(5)),
                borderRadius:
                BorderRadius
                    .all(
                    Radius
                        .circular(
                        8)),
                gradient:
                LinearGradient(
                    colors: [
                      kgradientYellow,
                      kgolder
                    ]),
                border:
                Border
                    .all(
                  color:
                  kgolder,
                  width:
                  2,
                )
            ) ,




            child: Padding(
              padding: const EdgeInsets.all( 10),
              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,


                                children: [
                                  CircleAvatar(
                                    backgroundColor: kblack,
                                    backgroundImage: NetworkImage('${mainurl}assets/images/employee/profile/${userModel1.image}'),
                                  ),
                                  SizedBox(width: 50,),
                                  Text(string,style: TextStyle(color: kblack,fontSize: 20),)
                                ],
                              ),
            ),
          ),
        );
      }
    );
  }
}
