import 'dart:async';
import 'dart:convert';

import 'package:demo_nikita/Authentication/loginpage.dart';
import 'package:demo_nikita/Components/constants.dart';
import 'package:demo_nikita/Homepage/homepage.dart';
import 'package:demo_nikita/MujahidHR/hrdasshboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Components/api.dart';
import '../Components/models.dart';
import '../Mujahidthursday/managerscreen.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({Key? key}) : super(key: key);

  @override
  _SplashScreeenState createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {

  @override
  void initState() {

    super.initState();
    Timer(Duration(milliseconds: 2000), () async {




        SharedPreferences pref =   await SharedPreferences.getInstance();

        var usersString = pref.getString("user");

        var converted = usersString == null ? "" : jsonDecode(usersString);

        Map<String, dynamic>? converted1 = usersString == null
            ? null
            : json.decode(json.encode(converted)) as Map<String, dynamic>;

        var users =
        usersString == null ? "" : UserModel().fromJson(converted1!);

        var loggein = pref.getBool("loggedin");

        UserModel? user1 =  loggein != true
            ? null : await AllApi().getUser(users.email);



        loggein != true
            ?  Get.offAll(LoginPage(),transition: Transition.rightToLeft,duration: Duration(seconds: 2))
        :
        Get.offAll(user1!.designation == 'manager' ?
        ManagerScreeen( userModel: user1,) :
        user1.designation == 'hr' ? HRDassboard( usermodel: user1,) :
        Welcome(userModel: user1),transition: Transition.rightToLeft,duration: Duration(seconds: 2));


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
