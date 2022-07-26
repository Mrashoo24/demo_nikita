import 'package:demo_nikita/Components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Components/api.dart';
import '../Components/models.dart';


class HREnquiryChat extends StatefulWidget {
  final UserModel? userModel;
  const HREnquiryChat({Key? key, required this.userModel,}) : super(key: key);

  @override
  _HREnquiryChatState createState() => _HREnquiryChatState();
}

class _HREnquiryChatState extends State<HREnquiryChat> {
  final _allApi = AllApi();
  final _messageController = TextEditingController();

  var _message = '';
  bool iconsmessage = false;



  Widget _messageBox({
    required String text,
    required bool isMe,
    required String timeStamp,
  }) {
    return Container(
      constraints: BoxConstraints(maxWidth: Get.width*0.5),
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,

      child: Card(
        color: isMe ? Colors.black.withOpacity(0.6) : kgolder,

        shape: isMe
            ?
        RoundedRectangleBorder(

            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),

            side: BorderSide(color: kgolder2)
        )
            :  RoundedRectangleBorder(

          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),

          side: BorderSide(color: kblack)
        ),
        child: Container(
          padding: const EdgeInsets.all(12.0),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style:  TextStyle(
                    fontSize: 17,
                    color: isMe ? kgolder : Colors.black
                ),
              ),
              Text(
                timeStamp,
                style:  TextStyle(
                    fontSize: 12,
                    color: isMe ? kgolder : Colors.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chatWindow() {
    return Expanded(
      child:
      FutureBuilder<List<EnquiryModel>?>(
        future: _allApi.getEnquiries(
          empEmail: widget.userModel!.email!,
          companyId: widget.userModel!.companyId!,
        ),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return kprogressbar;
          }
          var enquiries = snapshot.data;


          // List<Map> myList = [
          //   { 'description' : 'adam'
          //     ,'subject':"Reply",
          //     'timeStamp' : '2022-06-17'
          //   },
          //   { 'description' : 'ifredom'
          //     ,'subject':"Reply",
          //     'timeStamp' : '2022-06-15'
          //   },
          // ];

          enquiries!.sort((a, b) {


            DateTime tempDate =  DateFormat("dd-MM-yyyy hh:mm a").parse(b.timeStamp!);
            DateTime tempDate2 =  DateFormat("dd-MM-yyyy hh:mm a").parse(a.timeStamp!);
            ///yyyy-MM-
            print ("$tempDate");

            // var newDate =  DateFormat("yyyy-MM-dd hh:mm a").format(tempDate);
            // var newDate2 =  DateFormat("yyyy-MM-dd hh:mm a").format(tempDate2);
            // ///yyyy-MM-

            return  tempDate.compareTo(tempDate2);

            //      print ("$newDate");

            // return newDate.toString().compareTo(newDate2.toString());

          } );

          /// sort List<Map<String,dynamic>>

          return ListView.builder(
            reverse: true,
            itemCount: enquiries!.length,
            itemBuilder: (context, index) {

              return _messageBox(
                text: enquiries[index].description!,
                isMe: !enquiries[index].subject!.contains('Reply'),
                timeStamp: enquiries[index].timeStamp!,
              );
              //   AnimationConfiguration.staggeredList(
              //   position: index,
              //   duration: const Duration(milliseconds: 300),
              //   child: SlideAnimation(
              //     duration: Duration(milliseconds: 100),
              //     horizontalOffset: 200.0,
              //     child: FadeInAnimation(
              //       child:
              //     ),
              //   ),
              // );
            },
          );
        },
      ),
    );
  }

  Widget _messageBar() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.08,
          child: TextField(
            controller: _messageController,
            autocorrect: true,
            enableSuggestions: true,
            showCursor: true,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            minLines: null,
            expands: true,
            decoration:  InputDecoration(
              hintText: 'Type your message',
              filled: true,
              fillColor: Colors.transparent,
              enabledBorder:OutlineInputBorder(
                borderSide: BorderSide(
                    color: kgolder
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: kgolder
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: kgolder
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: kgolder
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _message = value;
              });

            },
          ),
        ),
        iconsmessage ? kprogressbar : Expanded(
          ///       iconsmessage(value is true or false) ?(if value) kprogressbar :(else) Expanded(


          ///
          child: IconButton(


            icon: Center(
              child: const Icon(
                Icons.send_rounded,
              ),
            ),

            onPressed: _message.trim().isEmpty ? null : _sendMessage,

          ),
        ),
      ],
    );
  }

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
        appBar:AppBar(

          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      kblack,
                      kGray
                    ]
                )
            ),
          ),
          automaticallyImplyLeading: true,
          title: Container(margin:EdgeInsets.only(left: 15),child: Text("Enquiry",style: TextStyle(color: kgolder),)),
          titleSpacing: 5,
          shadowColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            _chatWindow(),
            _messageBar(),
          ],
        ),
      ),
    );
  }

  void _sendMessage() async {
    setState(() {
      iconsmessage = true;
    });
    var toEmail = '';
    final _subject = 'Reply to Enquiry email by ${widget.userModel!.name}';
    FocusScope.of(context).unfocus();
    var users = await _allApi.getAllUsers(
      companyId: widget.userModel!.companyId!,
    );
    for (int i = 0; i < users!.length; i++) {
      if (users[i].empId == widget.userModel!.hrId) {
        toEmail = users[i].email!;
      }
    }
    await _allApi.postEnquiry(
      empName: widget.userModel!.name,
      subject: _subject,
      description: _message,
      refId: widget.userModel!.refId,
      companyId: widget.userModel!.companyId,
      empEmail: widget.userModel!.email,
      hrId: widget.userModel!.hrId,
      hrName: widget.userModel!.hrName,
    );
    await _allApi.sendEmail(
      subject: _subject,
      content: _message,
      toEmail: toEmail,
    );
    _messageController.clear();
    setState(() {
      _message = '';
      iconsmessage = false;
    });
  }
}
