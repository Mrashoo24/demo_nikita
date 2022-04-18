import 'package:demo_nikita/Components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  bool selectedRemember = false;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
       backgroundColor: Colors.black,
      body: Container(
        width: Get.width,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //       fit: BoxFit.fill,
        //       image: AssetImage('assets/bg.jpg'))
        // ),
        child: Column(
          children: [
            Container(
              width: 500,
              height: 500,
              child: ClipRRect(child: Image.asset('assets/hudurlogo.png',fit: BoxFit.fill,),),
            ),

            Card(
              color: Colors.white10,
              child: Container(
                width: Get.width * 0.3,
                color: Colors.white10,
                child: Padding(
                  padding:  EdgeInsets.all(25.0),
                  child: Column(
                    children: [

                      buildTextFormField(email,'Email'),

                      buildTextFormField(password,'Password'),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Checkbox(value: selectedRemember, onChanged: (value){

                              setState(() {

                                selectedRemember = value!;

                              });

                            }),
                            Text('Remember Me')

                          ]),

                          InkWell(
                              onTap: (){

                                print('Clicked');

                              },
                              child: Text('Forgot Password'),
                          ),


                        ],
                      ),


                      Container(
                        width: Get.width,
                        child: ElevatedButton(onPressed: (){}, child: Text('Login'),

                          style: ButtonStyle(

                              backgroundColor: MaterialStateProperty.all(kgolder),


                          ),

                        ),
                      )

                    ],
                  ),
                ),
              ),
            )

          ],
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
  TextFormField buildTextFormField(controller,hint) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
          hintText: hint,
      ),

      obscureText: hint == 'Password' ? true : false,

    );
  }

}
