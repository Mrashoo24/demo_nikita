import 'dart:convert';

import 'package:demo_nikita/Components/constants.dart';
import 'package:demo_nikita/Homepage/homepage.dart';
import 'package:demo_nikita/MujahidHR/hrdasshboard.dart';
import 'package:demo_nikita/demo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Components/api.dart';
import '../Mujahidthursday/managerscreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  bool loading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _trySubmit() {
    var isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
    }
    return isValid;
  }

  bool selectedRemember = false;

  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(
         backgroundColor: Colors.transparent,
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                 fit: BoxFit.fill,

                image: AssetImage('assets/bg.png'))
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: Get.height*0.12,top: Get.height * 0.15),
                  width: 150,
                  height: 100,
                  child: Hero(tag:'logo',child: ClipRRect(child: Image.asset('assets/hudurlogo.png',fit: BoxFit.fill,),)),
                ),



                Card(
                  color: Colors.grey.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Container(
                    width: Get.width*0.8,

                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      border: Border.all(width: 2,color: kgolder),
                      borderRadius: BorderRadius.circular(20)
                    ),

                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 25.0,horizontal: 15),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [

                            buildTextFormField( email,'Email Id',Icons.email ),

                            buildTextFormField( password,'Password',Icons.lock ),

                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 25.0,top: 25.0),
                                child: InkWell(
                                    onTap: (){

                                      print('Clicked');

                                    },
                                    child: Text('Forgot Password ?',style: TextStyle(fontSize: 12,color: kgolder),),
                                ),
                              ),
                            ),


                         loading ? kprogressbar :   InkWell(
                              onTap: () async {

                                var canSignIn = _trySubmit();
                                if (canSignIn) {
                                  setState(() {
                                    loading = true;
                                  });

                                  var result =
                                      await AllApi().getUser(email.text);

                                  print('designationofuser = ${result.designation}');
                                  if (password.text == result.pass &&
                                      email.text == result.email) {
                                    if(result.designation == 'manager'
                                        || result.designation == 'hr'
                                    ){


                                      var token = await FirebaseMessaging
                                          .instance
                                          .getToken();
                                      var tokenResult =
                                      await AllApi().putToken(
                                        email: email.text,
                                        token: token,
                                      );
                                      if (tokenResult == 'success') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                            Text('Sign in succesful.'),
                                          ),
                                        );

                                        var pref = await SharedPreferences.getInstance();

                                        pref.setBool("loggedin", true);

                                        pref.setString(
                                            "user", jsonEncode(result));

                                        setState(() {
                                          loading = false;
                                        });

                                        result.designation == 'hr' ?
                                        Get.to(HRDassboard( usermodel: result,),transition: Transition.rightToLeft)
                                            : Get.to(ManagerScreeen(    userModel: result,),transition: Transition.rightToLeft);

                                      } else {
                                        setState(() {
                                          loading = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Something went wrong. Try again.',
                                            ),
                                          ),
                                        );
                                      }                                      // ScaffoldMessenger.of(context)
                                      //     .showSnackBar(
                                      //   const SnackBar(
                                      //     content:
                                      //     Text('You cannot login with this email'),
                                      //   ),
                                      // );
                                      // setState(() {
                                      //   loading = false;
                                      // });
                                    }else{
                                      var token = await FirebaseMessaging
                                          .instance
                                          .getToken();
                                      var tokenResult =
                                          await AllApi().putToken(
                                        email: email.text,
                                        token: token,
                                      );
                                      if (tokenResult == 'success') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                            Text('Sign in succesful.'),
                                          ),
                                        );

                                        var pref = await SharedPreferences.getInstance();

                                        pref.setBool("loggedin", true);

                                        pref.setString(
                                            "user", jsonEncode(result));

                                        setState(() {
                                          loading = false;
                                        });

                                        Get.to(Welcome(    userModel: result,),transition: Transition.rightToLeft);

                                      } else {
                                        setState(() {
                                          loading = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Something went wrong. Try again.',
                                            ),
                                          ),
                                        );
                                      }
                                    }
                                  } else {
                                    setState(() {
                                      loading = false;
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Incorrect User id or password.'),
                                      ),
                                    );
                                  }
                                }



                              },
                              child: Container(
                                width: Get.width,

                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage('assets/cardbg.png')

                                  ),
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.transparent,
                                  // gradient: LinearGradient(colors: [kgolder,Colors.white.withOpacity(0.2),kgolder],
                                  //   stops: [
                                  //     0.1,
                                  //     0.3,
                                  //     0.9
                                  //   ])



                                ),
                                child: Center(child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('LOGIN',style: TextStyle(letterSpacing: 2,color: Colors.black,fontWeight: FontWeight.bold),),
                                )),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),


        ),

      ),
    );
  }

  // TextFormField buildTextFormField(controller,hint) {
  //   return TextFormField(
  //                 controller: controller,
  //                 decoration: InputDecoration(
  //                   hintText: hint
  //                 ),
  //
  //               );
  // }

  ///For Password Hiding
  TextFormField buildTextFormField(controller,hint,image) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please input correct details';
        }

        return null;
      },
      style: TextStyle(color: kgolder),
      decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(image,color: kgolder,size: 20,),
          ),
          contentPadding: EdgeInsets.only(bottom: 10,top: 15),

        hintStyle: TextStyle(color: kgolder),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: kgolder)
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kgolder)
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kgolder)
        ),
      ),

      obscureText: hint == 'Password' ? true : false,

    );
  }

}
