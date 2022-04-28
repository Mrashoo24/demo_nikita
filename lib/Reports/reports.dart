import 'package:demo_nikita/Components/constants.dart';
import 'package:flutter/material.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.arrow_back),
          title: Text("Reports"),
          titleSpacing: -5,
          shadowColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right:20),
              child: Icon(Icons.abc_sharp),
            )
          ],
          flexibleSpace: Stack(
            children: [
              Container(
                height: H*.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/bg.jpg"),
                    fit: BoxFit.cover
                  )
                ),
              ),
              Container(

                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          kblack,kGray
                        ]
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              ),
            ],
          )
        ),
        body: Column(
          children: [
              Container(
                margin: EdgeInsets.all(8),
                height: 50,
                decoration: BoxDecoration(
                  color: kgolder,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: Colors.black,width: 2)
                ),
                child: TabBar(
                  labelColor: kgolder,
                  indicator: BoxDecoration(
                      color: kGray,
                      borderRadius: BorderRadius.circular(4),
                  ),
                  unselectedLabelColor: kblack,
                  tabs: [
                    Text("All"),
                    Text("Perfect"),
                    Text("Early",style: TextStyle(fontSize: 13),),
                    Text("Late")
                  ],
                ),
              ),
            Expanded(
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("From"),
                              SizedBox(height: 10,),
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 25,
                                decoration: BoxDecoration(
                                  color: kGray,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  border: Border.all(color: Colors.black)
                                ),
                                child: Row(
                                  children: [
                                    Text("DD/MM/YYYY"),SizedBox(width: 5,),
                                    CircleAvatar(
                                      backgroundColor: kgolder,
                                      minRadius: 5,
                                      child: Image.asset("assets/icons/dropdown.png",color: kGray,)),
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("To"),
                              SizedBox(height: 10,),
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 25,
                                decoration: BoxDecoration(
                                    color: kGray,
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(color: Colors.black)
                                ),
                                child: Row(
                                  children: [
                                    Text("DD/MM/YYYY"),SizedBox(width: 5,),
                                    CircleAvatar(
                                        backgroundColor: kgolder,
                                        minRadius: 5,
                                        child: Image.asset("assets/icons/dropdown.png",color: kGray,)),
                                  ],
                                ),
                              ),


                            ],
                          ),
                          Icon(Icons.abc_sharp),
                          Icon(Icons.star)
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(4),
                        color: Colors.red,
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Date : 28/01/2022"),
                                  Row(
                                    children: [
                                      Icon(Icons.star),
                                      Text("OT:2.45 Hrs")
                                    ],
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: Center(
                      child: Text("das"),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text("das"),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text("das"),
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
