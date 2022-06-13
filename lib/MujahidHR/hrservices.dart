import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/constants.dart';

class HrSerrvices extends StatefulWidget {
  const HrSerrvices({Key? key}) : super(key: key);

  @override
  State<HrSerrvices> createState() => _HrSerrvicesState();
}

class _HrSerrvicesState extends State<HrSerrvices> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                gradient: LinearGradient(

                    colors: [kgolder,
                      kgradientYellow,
                      kgolder])),
          ),
          leading: InkWell(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.arrow_back,color: kblack,)),
          title: Text(
            "Services",
            style: TextStyle(color: kblack),
          ),
          titleSpacing: 5,

        ),
backgroundColor: kGray2,
        body: Container(
          height: Get.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [kGray3, kblack, kGray3,  kblack,],

            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding:   EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Report type",
                        style: TextStyle(fontSize: 18, color: kgradientYellow),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,


                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Select",
                          suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                              BorderSide(color: Colors.yellow, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: kgradientYellow),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Select Employee",
                        style: TextStyle(fontSize: 18, color: kgradientYellow),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Select",
                          suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.yellow, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: kgradientYellow),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "From",
                        style: TextStyle(fontSize: 18, color: kgradientYellow),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "DD/MM/YYYY",
                          suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.yellow, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: kgradientYellow),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "To",
                        style: TextStyle(fontSize: 18, color: kgradientYellow),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "DD/MM/YYYY",
                          suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.yellow, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: kgradientYellow),
                    ),
                  ), SizedBox(
                    height: 40,
                  ),
                  InkWell(onTap: () {

                  },
                    child: Container(
                        height: 35,
                        width: 150,


                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [kgolder,
                              kgradientYellow,
                              kgolder],

                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Genarate report",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

