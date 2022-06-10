import 'dart:convert';
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
import 'Homepage/homepage.dart';
import 'Leaves/administrative_leave.dart';
import 'MujahidHR/hrdasshboard.dart';
import 'MujahidHR/hrreporrts.dart';
import 'Mujahidthursday/adminleave.dart';
import 'Mujahidthursday/benchlist.dart';
import 'Mujahidthursday/hrenqquiry.dart';
import 'Mujahidthursday/leaves.dart';
import 'Mujahidthursday/managerscreen.dart';
import 'Related sites/related_sites.dart';
import 'Services/Services.dart';


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
      home: HRDassboard()
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late List<ChatModel> messages;
//   late List<ItemModel> menuItems;
//   CustomPopupMenuController _controller = CustomPopupMenuController();
//
//   @override
//   void initState() {
//     messages = [
//       ChatModel('在吗？'),
//       ChatModel('咋了？找我有事吗？', isMe: true),
//       ChatModel('没啥就像看看你在不在'),
//       ChatModel('到底啥事你说啊，我还在工作呢', isMe: true),
//       ChatModel('？', isMe: true),
//       ChatModel('下面开始介绍Flutter'),
//       ChatModel(
//           'Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。'),
//       ChatModel('就这？？？', isMe: true),
//       ChatModel('在吗？'),
//       ChatModel('咋了？找我有事吗？', isMe: true),
//       ChatModel('没啥就像看看你在不在'),
//       ChatModel('到底啥事你说啊，我还在工作呢', isMe: true),
//       ChatModel('？', isMe: true),
//       ChatModel('下面开始介绍Flutter'),
//       ChatModel(
//           'Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。'),
//       ChatModel('就这？？？', isMe: true),
//     ];
//     menuItems = [
//       ItemModel('发起群聊', Icons.chat_bubble),
//       ItemModel('添加朋友', Icons.group_add),
//       ItemModel('扫一扫', Icons.settings_overscan),
//     ];
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('CustomPopupMenu'),
//         actions: <Widget>[
//           CustomPopupMenu(
//             child: Container(
//               child: Icon(Icons.add_circle_outline, color: Colors.white),
//               padding: EdgeInsets.all(20),
//             ),
//             menuBuilder: () => ClipRRect(
//               borderRadius: BorderRadius.circular(5),
//               child: Container(
//                 color: const Color(0xFF4C4C4C),
//                 child: IntrinsicWidth(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: menuItems
//                         .map(
//                           (item) => GestureDetector(
//                         behavior: HitTestBehavior.translucent,
//                         onTap: () {
//                           print("onTap");
//                           _controller.hideMenu();
//                         },
//                         child: Container(
//                           height: 40,
//                           padding: EdgeInsets.symmetric(horizontal: 20),
//                           child: Row(
//                             children: <Widget>[
//                               Icon(
//                                 item.icon,
//                                 size: 15,
//                                 color: Colors.white,
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   margin: EdgeInsets.only(left: 10),
//                                   padding:
//                                   EdgeInsets.symmetric(vertical: 10),
//                                   child: Text(
//                                     item.title,
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                         .toList(),
//                   ),
//                 ),
//               ),
//             ),
//             pressType: PressType.singleClick,
//             verticalMargin: -10,
//             controller: _controller,
//           ),
//         ],
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraint) {
//           return SingleChildScrollView(
//             physics: AlwaysScrollableScrollPhysics(),
//             child: ConstrainedBox(
//               constraints: BoxConstraints(minHeight: constraint.maxHeight),
//               child: Column(
//                 children: messages
//                     .map(
//                       (message) => MessageContent(
//                     message,
//                   ),
//                 )
//                     .toList(),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// // ignore: must_be_immutable
// class MessageContent extends StatelessWidget {
//   MessageContent(this.message);
//
//   final ChatModel message;
//   List<ItemModel> menuItems = [
//     ItemModel('复制', Icons.content_copy),
//     ItemModel('转发', Icons.send),
//     ItemModel('收藏', Icons.collections),
//     ItemModel('删除', Icons.delete),
//     ItemModel('多选', Icons.playlist_add_check),
//     ItemModel('引用', Icons.format_quote),
//     ItemModel('提醒', Icons.add_alert),
//     ItemModel('搜一搜', Icons.search),
//   ];
//
//   Widget _buildLongPressMenu() {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(5),
//       child: Container(
//         width: 220,
//         color: const Color(0xFF4C4C4C),
//         child: GridView.count(
//           padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//           crossAxisCount: 5,
//           crossAxisSpacing: 0,
//           mainAxisSpacing: 10,
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           children: menuItems
//               .map((item) => Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Icon(
//                 item.icon,
//                 size: 20,
//                 color: Colors.white,
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 2),
//                 child: Text(
//                   item.title,
//                   style: TextStyle(color: Colors.white, fontSize: 12),
//                 ),
//               ),
//             ],
//           ))
//               .toList(),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAvatar(bool isMe, double size) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(5),
//       child: Container(
//         color: isMe ? Colors.blueAccent : Colors.pinkAccent,
//         width: size,
//         height: size,
//         child: Icon(
//           isMe ? Icons.face : Icons.tag_faces,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     bool isMe = message.isMe;
//     double avatarSize = 40;
//
//     return Container(
//       margin: EdgeInsets.all(10),
//       child: Row(
//         textDirection: isMe ? TextDirection.rtl : TextDirection.ltr,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             margin: EdgeInsets.only(right: isMe ? 0 : 10, left: isMe ? 10 : 0),
//             child: CustomPopupMenu(
//               child: _buildAvatar(isMe, avatarSize),
//               menuBuilder: () => GestureDetector(
//                 child: _buildAvatar(isMe, 100),
//                 onLongPress: () {
//                   print("onLongPress");
//                 },
//                 onTap: () {
//                   print("onTap");
//                 },
//               ),
//               barrierColor: Colors.transparent,
//               pressType: PressType.singleClick,
//               arrowColor: isMe ? Colors.blueAccent : Colors.pinkAccent,
//               position: PreferredPosition.top,
//             ),
//           ),
//           CustomPopupMenu(
//             child: Container(
//               padding: EdgeInsets.all(10),
//               constraints: BoxConstraints(maxWidth: 240, minHeight: avatarSize),
//               decoration: BoxDecoration(
//                 color: isMe ? Color(0xff98e165) : Colors.white,
//                 borderRadius: BorderRadius.circular(3.0),
//               ),
//               child: Text(message.content),
//             ),
//             menuBuilder: _buildLongPressMenu,
//             barrierColor: Colors.transparent,
//             pressType: PressType.longPress,
//           )
//         ],
//       ),
//     );
//   }
// }
