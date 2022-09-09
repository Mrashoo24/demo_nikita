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



 Container buildGoldenTextfield(title,onChangeFunction) {
  return
    Container(
      margin: EdgeInsets.only(bottom: 10),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.all(
            Radius.circular(
                8)),
        gradient:
        LinearGradient(
            colors: [
              kgradientYellow,
              kgolder2
            ]),
        border: Border.all(
          color: kgolder,
          width: 2,
        ),

      ),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: title,

            filled: true,
            fillColor: Colors.transparent,
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
            disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill this value';
          }
          return null;
        },
        onSaved: onChangeFunction,
        onChanged: onChangeFunction,
      ),
    );
}

Container buildMultiGoldenTextfield(title,onChangeFunction) {
  return
    Container(
      margin: EdgeInsets.only(bottom: 10),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.all(
            Radius.circular(
                8)),
        gradient:
        LinearGradient(
            colors: [
              kgradientYellow,
              kgolder2
            ]),
        border: Border.all(
          color: kgolder,
          width: 2,
        ),

      ),
      child: TextFormField(
          minLines: 1,
        maxLines: 3,
        decoration: InputDecoration(
            hintText: title,

            filled: true,
            fillColor: Colors.transparent,
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
            disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill this value';
          }
          return null;
        },
        onSaved: onChangeFunction,
        onChanged: onChangeFunction,
      ),
    );
}

Container buildGradientFloating() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
          colors: [kgolder2,kgradientYellow,kgolder2]
      ),
      // borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15))
    ),
    child: Icon(
      Icons.add,
      color: kblack,
    ),
  );
}





