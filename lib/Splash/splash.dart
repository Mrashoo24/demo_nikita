import 'package:demo_nikita/Components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({Key? key}) : super(key: key);

  @override
  _SplashScreeenState createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 500,
              height: 500,
              child: ClipRRect(
                  child: Image.asset('assets/hudurlogo.png',fit: BoxFit.fill,)
              ),
            ),


            Text('HUDUR',style: TextStyle(color: kgolder,fontSize: 24),),


          ],
        ),

      ),
    );
  }
}
