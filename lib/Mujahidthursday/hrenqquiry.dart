import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/constants.dart';

class Enqquiry extends StatefulWidget {
  const Enqquiry({Key? key}) : super(key: key);

  @override
  State<Enqquiry> createState() => _EnqquiryState();
}

class _EnqquiryState extends State<Enqquiry> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Padding(
              padding:   EdgeInsets.only(left: 10.0),
              child: Icon(Icons.arrow_back,color: kblack),
            ),
          ),

          leadingWidth: 25,
          title:      Text("Enquiry",style: TextStyle(color: kblack,fontSize: 20,fontWeight: FontWeight.bold),),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15))
          ),


          toolbarHeight: 55,
          backgroundColor: kgolder2,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [kgolder2,kgradientYellow,kgolder2]
                ),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15))
            ),
          ),
        ),
       body : Container(
         height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            gradient:LinearGradient(
              colors: [
                Colors.grey,
                Colors.black,

                Colors.grey,

                //add more colors for gradient
              ],
              begin: Alignment.topRight, //begin of the gradient color
              end: Alignment.bottomLeft,
            ),
          ),
         child: Padding(
           padding:   EdgeInsets.only(left: 20,top: 20),
           child: SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: 20,),
                 Row(

                   children: [
                     Icon(Icons.person,color: kGray7,size: 25,),
                     SizedBox(width: 30),
                     Text("HR1",style: TextStyle(color: Colors.white,fontSize: 15),)
                   ],
                 ),SizedBox(height: 25,),
 Row(

                   children: [
                     Icon(Icons.person,color: kGray7,size: 25,),
                     SizedBox(width: 30),
                     Text("Manager1",style: TextStyle(color: Colors.white,fontSize: 15),)
                   ],
                 ),SizedBox(height: 25,),
 Row(

                   children: [
                     Icon(Icons.person,color: kGray7,size: 25,),
                     SizedBox(width: 30),
                     Text("Arsalan Khan",style: TextStyle(color: Colors.white,fontSize: 15),)
                   ],
                 ),SizedBox(height: 25,),
 Row(

                   children: [
                     Icon(Icons.person,color: kGray7,size: 25,),
                     SizedBox(width: 30),
                     Text("Fahad Kharadi",style: TextStyle(color: Colors.white,fontSize: 15),)
                   ],
                 ),SizedBox(height: 25,),
                 Row(

                   children: [
                     Icon(Icons.person,color:kGray7,size: 25,),
                     SizedBox(width: 30),
                     Text("Khalid Walid",style: TextStyle(color: Colors.white,fontSize: 15),)
                   ],
                 ),SizedBox(height: 25,), Row(

                   children: [
                     Icon(Icons.person,color:kGray7,size: 25,),
                     SizedBox(width: 30),
                     Text("Julfikhar Shaikh HR",style: TextStyle(color: Colors.white,fontSize: 15),)
                   ],
                 ),SizedBox(height: 25,),


               ],
             ),
           ),
         ),

        ),
      ),
    );
  }
}
