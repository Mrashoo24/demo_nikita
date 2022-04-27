import 'package:demo_nikita/Components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RelatedSites extends StatefulWidget {
  const RelatedSites({Key? key}) : super(key: key);

  @override
  State<RelatedSites> createState() => _RelatedSitesState();
}

class _RelatedSitesState extends State<RelatedSites> {
var  selectedTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                kblack,
                kGray
              ]
            )
          ),
        ),
        leading: Icon(Icons.arrow_back),
        title: Text("Related sites",style: TextStyle(color: kgolder),),
        titleSpacing: -8,
        backgroundColor: kgolder2,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.fill
          )
        ),
        child: Column(
          children: [
              buildContainer("Mehendi","  Lorem ipsum dolor sit amet,consectetuer \nadipiscing elit,sed diam nonummy nibh \neuismod tincidunt","web-it-services.com"),
            buildContainer("Facebook","  Lorem ipsum dolor sit amet,consectetuer \nadipiscing elit,sed diam nonummy nibh \neuismod tincidunt","facebook.com/"),
            buildContainer("Twitter","  Lorem ipsum dolor sit amet,consectetuer \nadipiscing elit,sed diam nonummy nibh \neuismod tincidunt","twitter.com/i/flow/login"),
          ],
        ),
      )
    );
  }

   buildContainer(String title,String subtitle, String bottomtitle) {
    return InkWell(onTap: (){
      setState(() {
        selectedTitle = title;
      });

    },
      child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 10,right: 10,top: 15,),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kGray  ,
                  kblack
                ]
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text(title,style: TextStyle(fontSize: 25,color: kgolder),),
                  SizedBox(height: 5,),
                  AnimatedContainer(
                      height: selectedTitle == title ? 100 : 0,
                      duration: Duration(milliseconds: 300),
                      child: Text(subtitle,style: TextStyle(fontSize: 17,color: kgolder),)),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: kDarkGolder,
                            width: 2.0
                          )
                        )
                      ),
                      child: Text(bottomtitle,style: TextStyle(fontSize: 17,color: kDarkGolder),)),
                  SizedBox(height: 15,)
                ],
              ),
            ),
          ),
    );
  }
}
  