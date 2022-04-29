import 'package:demo_nikita/Components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  TextEditingController services = TextEditingController();
  TextEditingController request = TextEditingController();
  TextEditingController moreRequest = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
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
          title: Text("Services",style: TextStyle(color: kgolder),),
          titleSpacing: 5,
          shadowColor: Colors.transparent,
        ),
        body: Column(
          children: [Stack(
            children: [Container(
              height: H*0.07,
              width: W,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg.jpg"),
                  fit: BoxFit.cover
                )
              ),
            ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  gradient:  LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,

                      colors: [
                        kblack,
                        kGray
                      ]
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight:  Radius.circular(20)
                  ),
                ),
                child: TabBar(
                  labelColor: Colors.black,
                  indicator: BoxDecoration(
                      color: kgolder,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kblack,width: 3)
                  ),
                  unselectedLabelColor: kgolder,
                  tabs: [
                    Text("Services"),
                    Text("Requests"),
                    Text("More Requests",style: TextStyle(fontSize: 13),)
                  ],
                ),
              ),
            ],
          ),

            Expanded(
              child: TabBarView(
                  children: [
                   Container(
                     height: H,
                     width: W,
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: AssetImage("assets/bg.jpg"),
                         fit: BoxFit.cover
                       )
                     ),
                     child: ListView.builder(
                       itemBuilder: (BuildContext context, int index) {
                         return  buildCertificate(H, W);
                       },

                     ),
                   ),
                DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      appBar: AppBar(
                        shadowColor: Colors.transparent,
                        flexibleSpace: Stack(
                          children: [
                            Container(
                              height: H*0.5,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/bg.jpg"),
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              height: 50,
                              decoration: BoxDecoration(
                                  color: kgolder,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)
                                  ),
                                  border: Border.all(color: kblack,width: 2)
                              ),
                              child: TabBar(
                                labelColor: kgolder,
                                indicator: BoxDecoration(
                                  color: kGray3,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                unselectedLabelColor: kblack,
                                tabs: [
                                  Text("Pending"),
                                  Text("Accepted"),
                                  Text("Rejected",style: TextStyle(fontSize: 13),)
                                ],
                              ),
                            ),
                          ],
                        )
                      ),
                      body:TabBarView(
                        children: [
                          Container(
                            height: H,
                            width: W,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/bg.jpg"),
                                    fit: BoxFit.cover
                                )
                            ),
                            child: ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                return buildCertificateName();

                              },

                            ),
                          ),
                          Container(
                            height: H,
                            width: W,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/bg.jpg"),
                                    fit: BoxFit.cover
                                )
                            ),
                            child: ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                return buildCertificateName();

                              },

                            ),
                          ),
                          Container(
                            height: H,
                            width: W,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/bg.jpg"),
                                    fit: BoxFit.cover
                                )
                            ),
                            child: ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                return buildCertificateReject();

                              },

                            ),
                          ),
                        ],
                      )
                    )),
                    DefaultTabController(
                        length: 3,
                        child: Scaffold(
                            appBar: AppBar(
                                shadowColor: Colors.transparent,
                                flexibleSpace: Stack(
                                  children: [
                                    Container(
                                      height: H*0.5,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage("assets/bg.jpg"),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(8),
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: kgolder,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)
                                          ),
                                          border: Border.all(color: kblack,width: 2)
                                      ),
                                      child: TabBar(
                                        labelColor: kgolder,
                                        indicator: BoxDecoration(
                                          color: kGray3,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        unselectedLabelColor: kblack,
                                        tabs: [
                                          Text("Pending"),
                                          Text("Accepted"),
                                          Text("Rejected",style: TextStyle(fontSize: 13),)
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            body:TabBarView(
                              children: [
                                Container(
                                  height: H,
                                  width: W,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("assets/bg.jpg"),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                  child: ListView.builder(
                                    itemBuilder: (BuildContext context, int index) {
                                      return buildCertificateMoreRequest();

                                    },

                                  ),
                                ),
                                Container(
                                  height: H,
                                  width: W,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("assets/bg.jpg"),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                  child: ListView.builder(
                                    itemBuilder: (BuildContext context, int index) {
                                      return buildCertificateMoreRequest();

                                    },

                                  ),
                                ),
                                Container(
                                  height: H,
                                  width: W,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("assets/bg.jpg"),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                  child: ListView.builder(
                                    itemBuilder: (BuildContext context, int index) {
                                      return buildCertificateMoreRequest();

                                    },

                                  ),
                                ),
                              ],
                            )
                        )),
              ]),
            )
          ],
        )
      ),
    );
  }

  Container buildCertificateName() {
    return Container(
                                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      kGray,
                                      kblack
                                    ]
                                  ),
                                  borderRadius:BorderRadius.circular(10),
                                  border: Border.all(color: kgolder,width: 3)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Certificate Name:",style: TextStyle(color: kgolder),),
                                        Text(""),
                                        Text("Date:",style: TextStyle(color: kgolder)),
                                        Text("Status:",style: TextStyle(color: kgolder))
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,

                                      children: [
                                        Text("Certificate With",style: TextStyle(color: kgolder)),
                                        Text("Detail Salary",style: TextStyle(color: kgolder)),
                                        Text("12/04/2022",style: TextStyle(color: kgolder)),
                                        Text("Pending from HR",style: TextStyle(color: kgolder))
                                      ],
                                    )
                                  ],
                                )
                              );
  }
  Container buildCertificateMoreRequest() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kGray,
                  kblack
                ]
            ),
            borderRadius:BorderRadius.circular(10),
            border: Border.all(color: kgolder,width: 3)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date:",style: TextStyle(color: kgolder)),
                Text("Status:",style: TextStyle(color: kgolder))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Text("12/04/2022",style: TextStyle(color: kgolder)),
                Text("Pending from HR",style: TextStyle(color: kgolder))
              ],
            )
          ],
        )
    );
  }
  Container buildCertificateReject() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kGray,
                  kblack
                ]
            ),
            borderRadius:BorderRadius.circular(10),
            border: Border.all(color: kgolder,width: 3)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Certificate Name:",style: TextStyle(color: kgolder),),
                Text(""),
                Text("Date:",style: TextStyle(color: kgolder)),
                Text("Status:",style: TextStyle(color: kgolder)),
                Text("Reason:",style: TextStyle(color: kgolder))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Text("Certificate With",style: TextStyle(color: kgolder)),
                Text("Detail Salary",style: TextStyle(color: kgolder)),
                Text("12/04/2022",style: TextStyle(color: kgolder)),
                Text("Pending from HR",style: TextStyle(color: kgolder)),
                Text("xyz",style: TextStyle(color: kgolder)),
              ],
            )
          ],
        )
    );
  }

  Container buildCertificate(double H, double W) {
    return Container(
                       height: H*.1,
                       width: double.infinity,
                       margin: EdgeInsets.symmetric(horizontal: W*.03,vertical: H*0.008),
                       decoration: BoxDecoration(
                         border: Border.all(color: kgolder,width: 3),
                         gradient: LinearGradient(
                           begin: Alignment.topRight,
                           end: Alignment.bottomLeft,
                           colors: [
                             kblack ,
                             kGray
                           ]
                         ),
                         borderRadius: BorderRadius.all(Radius.circular(8))
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Text("Certificate With Detail Salary",style: TextStyle(color: kgolder),),
                           ElevatedButton(
                               onPressed: (){
                                Get.defaultDialog(
                                  title: "Request for the service?",

                                  titlePadding: EdgeInsets.only(right: W*.1,top: H*0.03,left: W*0.04),
                                  contentPadding:EdgeInsets.only(right: W*.03,top: H*0.03,left: W*0.06) ,
                                  radius: 10,
                                  backgroundColor: kgolder,
                                  content: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Are you sure do you want to request for \nthe service?",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                      SizedBox(height: H*0.05,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 10,right: 10,top: 8,),
                                            height: H*0.05,
                                           decoration: BoxDecoration(
                                             color: kGray3,
                                             borderRadius: BorderRadius.circular(15),
                                             border: Border.all(color: kblack)
                                           ),
                                            child: Text("Request",style: TextStyle(
                                                fontSize: 15,
                                                color: kgolder),),

                                          ),
                                          SizedBox(width: 10,),
                                          Text("Cancel",style: TextStyle(fontWeight: FontWeight.w500),)
                                        ],
                                      )
                                    ],

                                  )
                                );
                               },
                               child: Text("Request"),
                              style: ElevatedButton.styleFrom(
                                primary: kgolder,
                                onPrimary: kblack
                              ),
                           )
                         ],
                       ),
                     );
  }

}
