import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import '../Components/constants.dart';

class Reeports extends StatefulWidget {
  const Reeports({Key? key}) : super(key: key);

  @override
  State<Reeports> createState() => _ReeportsState();
}

class _ReeportsState extends State<Reeports> {
  String? selectedValue;
  List<String> items = [
    "Select",
    "Unselect",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar:AppBar(
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
            "Reports ",
            style: TextStyle(
                color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
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
        ),
        backgroundColor: kGray2,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [kGray3, kblack, kGray3,  kblack,],

              ),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Reports type",
                    style: TextStyle(
                      fontSize: 18,color: kgolder
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 38,
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
                    child: DropdownButtonFormField(

                      decoration: InputDecoration(
                          fillColor: kDarkGolder,

                          icon: Align(
                              alignment: Alignment.centerRight,
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(" Select",style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold) ,),
                                  Icon(Icons.keyboard_arrow_down,color: kblack,),
                                ],
                              ))),

                      items: items
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            color: kblack,
                            fontSize: 12,
                          ),
                        ),
                      ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select Employee",
                    style: TextStyle(
                      fontSize: 18,color: kgolder
                    ),
                  ),
                ),
                SizedBox(height: 5,),
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
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          fillColor: kgolder,
                          icon: Align(
                              alignment: Alignment.centerRight,
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(" Select",style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold) ,),
                                  Icon(Icons.keyboard_arrow_down,color: kblack,),
                                ],
                              ))),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            color: kgolder2,
                            fontSize: 12,
                          ),
                        ),
                      ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "From",
                    style: TextStyle(
                      fontSize: 18,color: kgolder
                    ),
                  ),
                ),
                SizedBox(height: 5,),
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
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          fillColor: kDarkGolder,
                          icon:  Align(
                              alignment: Alignment.centerRight,
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(" DD/MM/YYYY",style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold) ,),
                                  Icon(Icons.keyboard_arrow_down,color: kblack,),
                                ],
                              ))),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            color: kblack,
                            fontSize: 12,
                          ),
                        ),
                      ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "To",
                    style: TextStyle(
                      fontSize: 18,color: kgolder
                    ),
                  ),
                ),
                SizedBox(height: 5,),
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
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          fillColor: kDarkGolder,
                          icon:  Align(
                              alignment: Alignment.centerRight,
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(" Select",style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold) ,),
                                  Icon(Icons.keyboard_arrow_down,color: kblack,),
                                ],
                              ))),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            color: kblack,
                            fontSize: 12,
                          ),
                        ),
                      ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 40,
                  width: 170,

                  decoration: BoxDecoration(
                    border: Border.all(
                        color: kblack,
                        width: 2),
                    color:kgolder,borderRadius: BorderRadius.all(Radius.circular(12),),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Generate Report',style: TextStyle(color: kblack,fontSize: 18,fontWeight: FontWeight.bold),),

                    ],
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