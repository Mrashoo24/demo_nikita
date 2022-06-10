import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Components/constants.dart';
class HRReport extends StatefulWidget {
  const HRReport({Key? key}) : super(key: key);

  @override
  State<HRReport> createState() => _HRReportState();
}

class _HRReportState extends State<HRReport> {
  String? selectedValue;
  List<String> items = [
    "Absence Report",
    "Delay Report",
    "Daily Report",
    "Attendance Report",
    "OutGeo Login",
    "Certificate report how ",
  ];
  String? selectedValue1;
  List<String> atom = [
    "HR1",
    "Manager",
    "Arsalan khan",
    "Sarkar akbar",
    "Abrar",
    "Fahad ",
  ];
  DateTime startdate = DateTime(2022,12,24, 5, 30);
  DateTime endsdate = DateTime(2022,12,24, 5, 30);
  @override
  Widget build(BuildContext context) {
    final hours = startdate.hour.toString().padLeft(2, '0');
    final minutes = startdate.minute.toString().padLeft(2, '0');
    final endhours = endsdate.hour.toString().padLeft(2, '0');
    final endminutes = endsdate.minute.toString().padLeft(2, '0');

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 14.0),
              child: Icon(Icons.arrow_back, color: kgradientYellow),
            ),
          ),
          leadingWidth: 40,
          title: Text(
            "Reports ",
            style: TextStyle(
                color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
          toolbarHeight: 50,
          backgroundColor: kgolder2,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [kgolder, kgradientYellow, kgolder],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
          ),
        ),
        backgroundColor: kblack,
        body: Container(
            decoration: BoxDecoration(

              gradient: LinearGradient(
                colors: [kGray2, kblack, kGray],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 50 ,
                    width: Get.width,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(

                      ),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            item,
                            style: TextStyle(
                              color:kblack   ,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ))
                          .toList(),
                      value: selectedValue,focusColor: kDarkGolder,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                    ),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        gradient: LinearGradient(colors: [
                          kgradientYellow,kgolder
                        ]),
                        border: Border.all(
                          color: kdarkyellow,
                          width: 2,

                        )
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 50 ,
                    width: Get.width,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(

                      ),
                      items: atom
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            item,
                            style: TextStyle(
                              color:kblack   ,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ))
                          .toList(),
                      value: selectedValue1,
                      onChanged: (value) {
                        setState(() {
                          selectedValue1 = value as String;
                        });
                      },
                    ),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        gradient: LinearGradient(colors: [
                          kgradientYellow,  kgolder,
                        ]),
                        border: Border.all(
                          color: kdarkyellow,
                          width: 2,

                        )),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(onTap: ()  async {
                        final date = await endpickDate();
                        if (date == null) return;

                        final newDateTime = DateTime(
                            date.year,
                            date.month,
                            date.day,
                            endsdate.hour,
                            endsdate.minute
                        );
                        setState(() => endsdate = newDateTime);
                      },
                        child: Container(
                          height: 40,
                          width: 100,
                          child: Center(child: Text("From date",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),)),
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              gradient: LinearGradient(colors: [
                                kgradientYellow,kgolder
                              ]),
                              border: Border.all(
                                color: kgolder2,
                                width: 2,

                              )
                          ),
                        ),
                      ),SizedBox(width: 35,),
                      InkWell(onTap: () async {
                        final date = await pickDate();
                        if (date == null) return;

                        final newDateTime = DateTime(
                            date.year,
                            date.month,
                            date.day,
                            startdate.hour,
                            startdate.minute
                        );
                        setState(() => startdate = newDateTime);
                      },
                        child: Container(
                          height: 40,
                          width: 100,
                          child: Center(child: Text("To Date",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),)),
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              gradient: LinearGradient(colors: [
                                kgradientYellow,kgolder
                              ]),
                              border: Border.all(
                                color: kgolder2,
                                width: 2,

                              )
                          ),
                        ),
                      ),

                    ],
                  ),SizedBox(height: 35,),
                  InkWell(onTap: () {

                  },
                    child: Container(
                      height: 40,
                      width: 150,
                      child: Center(child: Text("Generate Report",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),)),
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          gradient: LinearGradient(colors: [
                            kgradientYellow,kgolder
                          ]),
                          border: Border.all(
                            color: kgolder2,
                            width: 2,

                          )
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
  Future<DateTime?> pickDate() => showDatePicker(context: context, initialDate: endsdate, firstDate: DateTime(1900), lastDate: DateTime(2500));
  Future<TimeOfDay?> pickTime() => showTimePicker(context: context, initialTime: TimeOfDay(hour: endsdate.hour, minute: endsdate.minute));

  Future<DateTime?> endpickDate() => showDatePicker(context: context, initialDate: endsdate, firstDate: DateTime(1900), lastDate: DateTime(2500));
  Future<TimeOfDay?> endpickTime() => showTimePicker(context: context, initialTime: TimeOfDay(hour: endsdate.hour, minute: endsdate.minute));

}