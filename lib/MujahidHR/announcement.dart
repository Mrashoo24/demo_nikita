import 'dart:io';

import 'package:demo_nikita/Components/constants.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as basename;

import '../Announcements/announcement_detail.dart';
import '../Components/api.dart';
import '../Components/models.dart';
import 'annoucedetailsr.dart';

class Announcement extends StatefulWidget {
  final UserModel usermodel;
  const Announcement({Key? key, required this.usermodel})
      : super(key: key);

  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _formKeyEdit = GlobalKey<FormState>();

  File? image;

  var imageName = '';
  var _title = '';
  var _description = '';

  bool _trySubmit() {
    FocusScope.of(context).unfocus();
    final _isValid = _formkey.currentState!.validate();
    if (_isValid) {
      _formkey.currentState!.save();
    }
    return _isValid;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:LinearGradient(
          colors: [
            Colors.grey,
            Colors.black,

            Colors.grey,
            Colors.black,
            //add more colors for gradient
          ],
          stops: [
            0.2,
            0.8,
            0.4,
            0.2
          ],
          begin: Alignment.topRight, //begin of the gradient color
          end: Alignment.bottomLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Icon(Icons.arrow_back, color: kblack),
            ),
          ),
          leadingWidth: 35,
          title: Text(
            "Announcements",
            style: TextStyle(
                color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8))),
          toolbarHeight: 55,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [kgolder2,kgradientYellow,kgolder2]
                ),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15))
            ),
          ),
          backgroundColor: kGray3,
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder<List<AnnounceModel>>(
              future: AllApi().getAnnounce( companyId: widget.usermodel.companyId),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return kprogressbar;
                } else {
                  var announceList = snapshot.data;
                  return ListView.builder(
                    itemCount: announceList!.length,
                    itemBuilder: (ctx, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius
                                .all(
                                Radius
                                    .circular(
                                    8)),
                            gradient:
                            LinearGradient(
                                colors: [
                                  kgradientYellow,
                                  kgolder
                                ]),
                            border:
                            Border
                                .all(
                              color:
                              kgolder,
                              width:
                              2,
                            )) ,
                        child: ListTile(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                          contentPadding:  EdgeInsets.symmetric(horizontal: 12.0,vertical: 2),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.remove_red_eye_rounded,
                                ),
                                onPressed: () {
                                  Get.to(
                                        () => AnnouncementDetailHR(
                                      announceModel: announceList[index],
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                ),
                                onPressed: () {
                                  editAnnnoucement(
                                    announcementId:
                                    announceList[index].announcementId!,
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,

                                ),
                                onPressed: () {
                                  _deleteAnnouncement(
                                    announceList: announceList,
                                    index: index,
                                  );
                                },
                              ),

                            ],
                          ),
                          title: Text(
                            announceList[index].name!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // subtitle: Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       announceList[index].text,
                          //     ),
                          //     Text(
                          //       announceList[index].timestamp,
                          //     ),
                          //   ],
                          // ),
                        ),
                      );
                    },
                  );
                }
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addAnnouncement,
          child: buildGradientFloating(),
          // backgroundColor: kgolder2,

        ),
      ),
    );
  }



  void _deleteAnnouncement({
    required List<AnnounceModel> announceList,
    required int index,
  }) {
    bool _isLoading = false;
    Get.defaultDialog(
        title: "",

        titleStyle: TextStyle(color: kgolder),
        titlePadding: EdgeInsets.only(right: 100,top: 5),
        backgroundColor: Colors.transparent,

        content: StatefulBuilder(
            builder: (context, setState1) {
              return Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  gradient: LinearGradient(
                      colors: [ kGray3,kblack]
                  ),
                  border: Border.all(
                    color:kgolder,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding:   EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: _isLoading
                        ? Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      alignment: Alignment.center,
                      child: Row(
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(
                            width: 30,
                          ),
                          Text('Please wait'),
                        ],
                      ),
                    )
                        :  Column(
                          children: [
                            Text(
                      "Are you sure you want to delete this announcement?",
                              style: TextStyle(color: kgolder2),
                    ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    setState1(() {
                                      _isLoading = true;
                                    });
                                    await AllApi().deleteAnnouncement(
                                      announcementId: announceList[index].announcementId!,
                                      companyid: widget.usermodel.companyId!,
                                    );
                                    setState1(() {
                                      _isLoading = false;
                                    });
                                    Get.back();
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: kgolder,

                                    ),
                                    child:Padding(
                                      padding:  EdgeInsets.only(left: 8,right: 8),
                                      child: Center(child: Text("Delete",style: TextStyle(color: kblack,fontSize:18),)),
                                    ) ,
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    Get.back();
                                  },
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: 8,right: 8),
                                    child: Center(child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),)),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                  ),
                ),
              );
            }
        ),
        radius: 50
    );
  }

  void _addAnnouncement() {
    bool _isLoading = false;
    File? addImage;
    Get.defaultDialog(
        title: "Add Announcement",

        titleStyle: TextStyle(color: kgolder),
        titlePadding: EdgeInsets.only(right: 100,top: 5),
        backgroundColor: Colors.transparent,

        content: StatefulBuilder(
            builder: (context, setState1) {
              return Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  gradient: LinearGradient(
                      colors: [ kGray3,kblack]
                  ),
                  border: Border.all(
                    color:kgolder,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding:   EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(
                        children: [
                          buildGoldenTextfield('Title', (value){
                            _title = value;
                          }),
                          buildMultiGoldenTextfield('Description', (value){
                            _description = value;
                          }),
                          image == null
                              ?

                          InkWell(
                            child: Text('Upload Image',style: TextStyle(color: kgolder),),
                            onTap: () async {
                              addImage = await _imagePicker();
                              setState1(() {
                                image = addImage!;
                                imageName =
                                    basename.basename(addImage!.path);
                              });
                            },
                          )
                              : SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.file(image!),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                             _isLoading ? kprogressbar :  InkWell(
                                onTap: () async {
                                  // var _canSubmit = _trySubmitEdit();
                                  if (image != null) {
                                    setState1(() {
                                      _isLoading = true;
                                    });
                                    await AllApi().postAddAnnounce(
                                      name: _title,
                                      text: _description,
                                      companyid: widget.usermodel.companyId!,
                                      imageName: imageName,
                                    );
                                    await AllApi().setImage(image!);
                                    setState1(() {
                                      _isLoading = false;
                                      image = null;
                                      imageName = '';
                                    });
                                    setState((){

                                    });
                                    Get.back();
                                  } else {
                                    Fluttertoast.showToast(
                                      msg: 'Please upload photo.',
                                    );
                                  }
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: kgolder,

                                  ),
                                  child:Padding(
                                    padding:  EdgeInsets.only(left: 8,right: 8),
                                    child: Center(child: Text("Add",style: TextStyle(color: kblack,fontSize:18),)),
                                  ) ,
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child: Padding(
                                  padding:  EdgeInsets.only(left: 8,right: 8),
                                  child: Center(child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
        ),
        radius: 50
    );
  }




  void editAnnnoucement({required String announcementId}){
    bool _isLoading = false;
    File? addImage;
    Get.defaultDialog(
        title: "Edit Announcement",

        titleStyle: TextStyle(color: kgolder),
        titlePadding: EdgeInsets.only(right: 100,top: 5),
        backgroundColor: Colors.transparent,

        content: StatefulBuilder(
          builder: (context, setState1) {
            return Container(
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                    colors: [ kGray3,kblack]
                ),
                border: Border.all(
                  color:kgolder,
                  width: 2,
                ),
              ),
              child: Padding(
                padding:   EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      children: [
                        buildGoldenTextfield('Title', (value){
                          _title = value;
                        }),
                        buildMultiGoldenTextfield('Description1', (value){
                          _description = value;
                        }),
                        image == null
                            ?

                        InkWell(
                          child: Text('Upload Image',style: TextStyle(color: kgolder),),
                          onTap: () async {
                            addImage = await _imagePicker();
                            setState1(() {
                              image = addImage!;
                              imageName =
                                  basename.basename(addImage!.path);
                            });
                          },
                        )
                            : SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.file(image!),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                          _isLoading ? kprogressbar :  InkWell(
                              onTap: () async {
                               // var _canSubmit = _trySubmitEdit();
                                if ( image != null) {
                                  setState1(() {
                                    _isLoading = true;
                                  });
                                  await AllApi().editAnnouncement(
                                    name: _title,
                                    text: _description,
                                    companyid: widget.usermodel.companyId!,
                                    imageName: imageName,
                                    announcementId: announcementId,
                                  );
                                  await AllApi().setImage(image!);
                                  setState1(() {
                                    _isLoading = false;
                                    image = null;
                                    imageName = '';
                                  });
                                  Get.back();
                                  setState((){});
                                } else {
                                  Fluttertoast.showToast(
                                    msg: 'Please upload photo.',
                                  );
                                }
                              },
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: kgolder,

                                ),
                                child:Padding(
                                  padding:  EdgeInsets.only(left: 8,right: 8),
                                  child: Center(child: Text("Edit",style: TextStyle(color: kblack,fontSize:18),)),
                                ) ,
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Get.back();
                              },
                              child: Padding(
                                padding:  EdgeInsets.only(left: 8,right: 8),
                                child: Center(child: Text("Cancel",style: TextStyle(color: kgolder,fontSize:18),)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        ),
        radius: 50
    );

  }

  Future<File?> _imagePicker() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return null;
      }
      final imageTemporary = File(image.path);
      return imageTemporary;
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message!),
        ),
      );
      return null;
    }
  }
}
