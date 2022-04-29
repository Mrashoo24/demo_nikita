import 'package:demo_nikita/Authentication/loginpage.dart';
import 'package:demo_nikita/Reports/reports.dart';
import 'package:demo_nikita/Splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Leaves/administrative_leave.dart';
import 'Related sites/related_sites.dart';
import 'Services/Services.dart';

void main() {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText2:TextStyle(fontFamily: 'Typo Round'),
          button: TextStyle(fontFamily: 'Typo Round'),
        )

      ),

      home: AdminstrativLeave()

    );

  }
}
