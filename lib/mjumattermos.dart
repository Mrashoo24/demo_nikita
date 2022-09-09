import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 100.0, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Image(image: AssetImage("assets/bennnchlist.png")),
            Container(
                height: Get.height * 0.8,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(45),
                        topLeft: Radius.circular(45)),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all( 18.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Row(children: [

                        ],)
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 50, width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person,color: Colors.grey.shade300,),
                             focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10)),
                              border: OutlineInputBorder( borderRadius: BorderRadius.circular(10)),
                              hintText: 'First name',

                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 50, width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person,color: Colors.grey.shade300,),
                            focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder( borderRadius: BorderRadius.circular(10)),
                            hintText: 'Last name',

                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 50, width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email,color: Colors.grey.shade300,),
                            focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder( borderRadius: BorderRadius.circular(10)),
                            hintText: 'Email Addres',

                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 50, width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone,color: Colors.grey.shade300,),
                            focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder( borderRadius: BorderRadius.circular(10)),
                            hintText: 'Phone number',

                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    ));
  }
}
