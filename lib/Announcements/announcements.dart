import 'package:demo_nikita/Components/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../Components/api.dart';
import '../Components/models.dart';
import 'announcement_detail.dart';

class Announcements extends StatefulWidget {
  final UserModel? userModel;
  const Announcements({Key? key, this.userModel}) : super(key: key);

  @override
  _AnnouncementsState createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  final _allApi = AllApi();

  late List<AnnounceModel> _announcementList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar:
        AppBar(automaticallyImplyLeading: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      kblack,
                      kGray
                    ]
                )
            ),
          ),
          title: Text("Announcements",style: TextStyle(color: kgolder),),
          titleSpacing: 5,
          shadowColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: FutureBuilder<List<AnnounceModel>>(
          future: _allApi.getAnnounce(
            companyId: widget.userModel!.companyId,
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return kprogressbar;
            } else if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No Records'),
              );
            }
            var announcementList = snapshot.data;
            _announcementList = announcementList!;
            return RefreshIndicator(
              onRefresh: () async {
                var refreshList = await _allApi.getAnnounce(
                  companyId: widget.userModel!.companyId,
                );
                setState(() {
                  _announcementList = refreshList;
                });
              },
              child: ListView.builder(
                itemCount: _announcementList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(
                        () => AnnouncementDetail(
                          announceModel: _announcementList[index],
                        ),
                      );
                    },
                    child: Card(
                      elevation: 8,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kgolder,width: 3),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  kblack ,
                                  kGray
                                ]
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height * 0.15,
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(
                                _announcementList[index].name!,
                                style: TextStyle(color: kgolder),
                              ),
                              leading: const Icon(Icons.notifications,color: kgolder,),
                            )
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     const Text(
                            //       'Name: ',
                            //       style: TextStyle(
                            //         fontSize: 20,
                            //       ),
                            //     ),
                            //     Text(
                            //       announcementList[index].name,
                            //       style: const TextStyle(
                            //         fontSize: 20,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     const Text(
                            //       'Text: ',
                            //       style: TextStyle(
                            //         fontSize: 20,
                            //       ),
                            //     ),
                            //     Text(
                            //       announcementList[index].text,
                            //       style: const TextStyle(
                            //         fontSize: 20,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     const Text(
                            //       'Timestamp: ',
                            //       style: TextStyle(
                            //         fontSize: 20,
                            //       ),
                            //     ),
                            //     Text(
                            //       announcementList[index].timestamp,
                            //       style: const TextStyle(
                            //         fontSize: 20,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
