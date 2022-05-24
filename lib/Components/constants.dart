import 'package:flutter/material.dart';
import 'package:get/get.dart';

const kblack = Colors.black;
const kgolder = Color(0xFFDBA82D);
const kDarkGolder =Color(0xFFDC9833);
const kGray =Color(0xFF7E7E7E);
const kgolder2 = Color(0xFFAF860A);
const kGray2 = Color(0xFF464646);
const kGray3 = Color(0xFF545454);
const kGreen = Color(0xFF4CD137);
const kdarkyellow = Color(0xFFA97700);
const kgradientYellow = Color(0xFFFFE7AF);
const kred = Color(0xFFE84118);
const kGray7 = Color(0xFF7E7E7E);


var kprogressbar = Center(child: CircularProgressIndicator(color: kgolder,));

var kprogressbarFull = Container(
  decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/bg.jpg"),
          fit: BoxFit.cover
      )
  ),
  width: Get.width,
  height: Get.height,
  child: Center(child: CircularProgressIndicator(color: kgolder,)),);

String mainurl = 'http://www.faizeetech.com/';
String adminurl = 'http://admin.faizeetech.com';




///astagfirullah astagfirullah astagfirullah astagfirullah astagfirullah