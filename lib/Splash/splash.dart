import 'dart:async';

import 'package:demo_nikita/Authentication/loginpage.dart';
import 'package:demo_nikita/Components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({Key? key}) : super(key: key);

  @override
  _SplashScreeenState createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {

  @override
  void initState() {

    super.initState();
    Timer(Duration(milliseconds: 2000), (){
      Get.to(LoginPage(),transition: Transition.rightToLeft,duration: Duration(seconds: 2));
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kblack,
      body: Center(

        child: Hero(
          tag: 'logo',
          child: ClipRRect(
              child: Image.asset('assets/hudurlogo.png',fit: BoxFit.fill,)
          ),
        ),

      ),
    );

  }
}
