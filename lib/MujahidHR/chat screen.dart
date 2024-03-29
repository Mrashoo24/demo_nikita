import 'package:demo_nikita/Components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../Components/api.dart';
import '../Components/models.dart';



class HRchat extends StatefulWidget {

  const HRchat({Key? key,}) : super(key: key);

  @override
  _HRchatState createState() => _HRchatState();
}

class _HRchatState extends State<HRchat> {
  final _allApi = AllApi();
  final _messageController = TextEditingController();

  var _message = '';

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
            ?  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              30
          ),
        )
            :  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              30
          ),
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
    return ListView.builder(
            reverse: true,
            itemCount: 5,
            itemBuilder: (context, index) {

              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 700),
                child: SlideAnimation(
                  duration: Duration(milliseconds: 500),
                  horizontalOffset: 200.0,
                  child: FadeInAnimation(
                    child: Text(
                      ""
                    )
                      // text: "enquiries[index].description!",
                      // // isMe: "!enquiries[index].subject!.contains('Reply')",
                      // timeStamp: "enquiries[index].timeStamp!",

                  ),
                ),
              );
            },
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
              // setState(() {
              //   _message = value;
              // });
            },
          ),
        ),
        Expanded(
          child: IconButton(

            icon: Center(
              child: const Icon(
                Icons.send_rounded,
              ),
            ),
            onPressed: (){},
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
          automaticallyImplyLeading: false,
          title: Container(margin:EdgeInsets.only(left: 15),child: Text("Enquiry",style: TextStyle(color: kgolder),)),
          titleSpacing: 5,
          shadowColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            _chatWindow(),
            _messageBar(),
            SizedBox(height: Get.height*0.15,),
          ],
        ),
      ),
    );
  }

  // void _sendMessage() async {
  //   var toEmail = '';
  //   final _subject = 'Enquiry email by';
  //   FocusScope.of(context).unfocus();
  //   var users = await _allApi.getAllUsers(
  //     companyId: widget.userModel!.companyId!,
  //   );
  //   for (int i = 0; i < users!.length; i++) {
  //     if (users[i].empId == widget.userModel!.hrId) {
  //       toEmail = users[i].email!;
  //     }
  //   }
  //   await _allApi.postEnquiry(
  //     empName: widget.userModel!.name,
  //     subject: _subject,
  //     description: _message,
  //     refId: widget.userModel!.refId,
  //     companyId: widget.userModel!.companyId,
  //     empEmail: widget.userModel!.email,
  //     hrId: widget.userModel!.hrId,
  //     hrName: widget.userModel!.hrName,
  //   );
  //   await _allApi.sendEmail(
  //     subject: _subject,
  //     content: _message,
  //     toEmail: toEmail,
  //   );
  //   _messageController.clear();
  //   setState(() {
  //     _message = '';
  //   });
  // }
}
