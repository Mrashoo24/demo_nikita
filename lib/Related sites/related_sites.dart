import 'package:demo_nikita/Components/api.dart';
import 'package:demo_nikita/Components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../Components/models.dart';

class RelatedSites extends StatefulWidget {
  final UserModel? userModel;

  const RelatedSites({Key? key, this.userModel}) : super(key: key);

  @override
  State<RelatedSites> createState() => _RelatedSitesState();
}

class _RelatedSitesState extends State<RelatedSites> {
var  selectedTitle = '';
List<RelatedSitesModel>? _relatedSites;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:Radius.circular(15) ),
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
        leading: SizedBox(width: 10,),
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
        child: FutureBuilder
        <List<RelatedSitesModel>?>(
            future: AllApi().getRelatedSites(
              companyId: widget.userModel!.companyId,
            ),
          builder: (context, snapshot) {

            if (!snapshot.hasData) {
              return kprogressbar;
            }
            if (snapshot.data!.isEmpty) {
              return const Text('No Records');
            }
            var relatedSitesList = snapshot.data;


            return ListView.builder(
                itemCount: relatedSitesList!.length,
                itemBuilder: (context, index) {
                  return  AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 700),
                    child: SlideAnimation(
                      duration: Duration(milliseconds: 500),
                      horizontalOffset: 200.0,
                      child: FadeInAnimation(
                        child:   buildContainer(relatedSitesList[index].name!,relatedSitesList[index].description!,relatedSitesList[index].url!),
                      ),
                    ),
                  );



                }
            );
          }
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
  