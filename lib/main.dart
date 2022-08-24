import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:demo_nikita/Authentication/loginpage.dart';
import 'package:demo_nikita/Components/constants.dart';
import 'package:demo_nikita/Splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BenchList/benchlist_page.dart';
import 'Components/api.dart';
import 'Components/models.dart';

import 'Enquiry.dart';
import 'Homepage/homepage.dart';
import 'Leaves/administrative_leave.dart';
import 'MujahidHR/chat screen.dart';
import 'MujahidHR/hrdasshboard.dart';

import 'Mujahidthursday/adminleave.dart';
import 'Mujahidthursday/benchlist.dart';
import 'Mujahidthursday/leaves.dart';
import 'Mujahidthursday/managerscreen.dart';
import 'Related sites/related_sites.dart';
import 'Services/Services.dart';
import 'mannan HR screen/hrservies.dart';
import 'MujahidHR/services2.dart';
import 'mjumattermos.dart';


const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.',
  importance: Importance.max,
  playSound: true,
  // sound: RawResourceAndroidNotificationSound('notification'),
  enableLights: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
Future<void> firebaseMessgaingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class MyHttpOverrides extends HttpOverrides{


  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessgaingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true
  );

  HttpOverrides.global =  MyHttpOverrides();

  runApp(const MyApp());

}

// class ChatModel {
//   String content;
//   bool isMe;
//
//   ChatModel(this.content, {this.isMe = false});
// }
//
// class ItemModel {
//   String title;
//   IconData icon;
//
//   ItemModel(this.title, this.icon);
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  var listofuser = [];

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen(
          (RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification!.android;

        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                // sound:
                //     const RawResourceAndroidNotificationSound('notification'),
                // other properties...
                importance: channel.importance,
              ),
            ),
          );
        }
      },
    );
  }



  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText1:TextStyle(fontFamily: 'Typo Round'),
          bodyText2:TextStyle(fontFamily: 'Typo Round'),
          button: TextStyle(fontFamily: 'Typo Round'),
             headline1:TextStyle(fontFamily:'Typo Round'),   
             headline2:TextStyle(fontFamily:'Typo Round'),  
             headline3:TextStyle(fontFamily:'Typo Round'), 
             headline4:TextStyle(fontFamily:'Typo Round'), 
             headline5:TextStyle(fontFamily:'Typo Round'), 
             headline6:TextStyle(fontFamily:'Typo Round'),  
             subtitle1:TextStyle(fontFamily:'Typo Round'),  
             subtitle2:TextStyle(fontFamily:'Typo Round'),
             caption:TextStyle(fontFamily:'Typo Round'),
             overline:TextStyle(fontFamily:'Typo Round'),
        )

      ),
      home:SplashScreeen(),
     builder: (context, child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: child!,
      );
    },
    );
  }
}

