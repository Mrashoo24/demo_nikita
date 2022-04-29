import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/constants.dart';

class AdminstrativLeave extends StatelessWidget {
  const AdminstrativLeave({Key? key}) : super(key: key);

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
        leading: Icon(Icons.arrow_back),
        title: Text("Administrative Leaves",style: TextStyle(color: kgolder),),
        titleSpacing: 5,
        shadowColor: Colors.transparent,
      ),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            flexibleSpace: Container(
              height: H*0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        kblack,
                        kGray
                      ]
                  )
              ),
              child: TabBar(
                labelColor: kblack,
                unselectedLabelColor: kgolder,
                indicator: BoxDecoration(
                    color: kgolder,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                    border: Border.all(color: kblack,width: 3)
                ),
                tabs: [
                  Text("Search"),
                  Text("Alloted")
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
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
                              Text("Arsalan Khan"),
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
                              Text("Department:",style: TextStyle(color: kgolder)),Text("Inventory",style: TextStyle(color: kgolder),)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Designation:",style: TextStyle(color: kgolder)),Text("HR",style: TextStyle(color: kgolder),)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Employee ID",style: TextStyle(color: kgolder)),Text("638764",style: TextStyle(color: kgolder),)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Email",style: TextStyle(color: kgolder)),Text("arsalankhan@gmail.com",style: TextStyle(color: kgolder),)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Phone Number",style: TextStyle(color: kgolder)),Text("9930389046",style: TextStyle(color: kgolder),)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Office",style: TextStyle(color: kgolder)),Text("Seraj bhai",style: TextStyle(color: kgolder),)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Admin Leaves",style: TextStyle(color: kgolder)),Text("---",style: TextStyle(color: kgolder),)
                            ],
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
