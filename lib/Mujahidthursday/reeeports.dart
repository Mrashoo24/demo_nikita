import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
 import '../Components/api.dart';
import '../Components/constants.dart';
import '../Components/models.dart';
import 'package:pdf/widgets.dart' as pdf;
import 'package:pdf/pdf.dart';


class Reeports extends StatefulWidget {
  final UserModel userModel;

  const Reeports({Key? key, required this.userModel}) : super(key: key);

  @override
  State<Reeports> createState() => _ReeportsState();
}

class _ReeportsState extends State<Reeports> {
  String? selectedValue;
  List<String> items = [
    "Select",
    "Unselect",
  ];
  String? selectedEmployee;
  String? dateSelected;
  String? todateSelected;
  var _certificatePdf = pdf.Document();
  // ignore: unused_field
  File? _certificate;
  // ignore: unused_field
  String? _fileName;
  List<List<String>> delayReportList = [];
  List<List<String>> outGeoReportList = [];
  List<List<String>> adminReportList = [];
  List<List<String>> servicesReportList = [];
  List<List<String>> workingReportList = [];
  var _isDailyReport = false;
  var _isOpening = false;

  @override
  Widget build(BuildContext context) {
    var items = [
      "Absence Report",
      "Delay Report",
      "Daily Report",
      "Attendance Report",
      'OutGeo Login',
      'Certificate report how many employees ask for certificate',
      'Administrative leave report',
      'Working Report',
    ];

    Future _savePdf(String report, String date) async {
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      String documentPath = documentDirectory.path;
      String fileName =
          DateFormat('hh:mm:ss').format(DateTime.now()) + '$report$date.pdf';
      File file = File("$documentPath/$fileName");
      file.writeAsBytesSync(await _certificatePdf.save());
      await OpenFile.open(file.path);
      _certificate = file;
      _fileName = fileName;
    }

    // void genrateAttendenceReport({String userName}) {
    //   _certificatePdf.addPage(
    //     pdf.MultiPage(
    //       pageFormat: PdfPageFormat.a4,
    //       margin: const pdf.EdgeInsets.all(32.0),
    //       build: (pdf.Context context) {
    //         return <pdf.Widget>[
    //           pdf.Header(
    //             child: pdf.Column(
    //               crossAxisAlignment: pdf.CrossAxisAlignment.start,
    //               children: [
    //                 pdf.Text('From Date: ' +
    //                     DateFormat('dd/MM/yyyy').format(
    //                       DateTime.now(),
    //                     )),
    //                 pdf.Text('To Date: ' +
    //                     DateFormat('dd/MM/yyyy').format(
    //                       DateTime.now(),
    //                     )),
    //               ],
    //             ),
    //           ),
    //           pdf.Text(
    //             'Detailed Salary Certificate',
    //             textAlign: pdf.TextAlign.center,
    //             style: pdf.TextStyle(
    //               fontWeight: pdf.FontWeight.bold,
    //               fontSize: 24,
    //               decoration: pdf.TextDecoration.underline,
    //             ),
    //           ),
    //           pdf.Table.fromTextArray(
    //             headers: [
    //               'Date',
    //               'In Time',
    //               'Out Time',
    //               'Status',
    //               'Working Time'
    //             ],
    //             data: [
    //               [
    //                 'job',
    //                 'Job',
    //                 'job',
    //                 'Job',
    //                 'job',
    //               ],
    //             ],
    //             border: pdf.TableBorder.all(),
    //             cellAlignment: pdf.Alignment.centerLeft,
    //             cellAlignments: {
    //               1: pdf.Alignment.center,
    //             },
    //           ),
    //         ];
    //       },
    //     ),
    //   );
    // }

    void delayReport({
      @required String? reportName,
      String? userName,
      String? fromdate,
      String? todate,
      List<List<String>>? listofreport,
    }) {
      _certificatePdf = pdf.Document();

      _certificatePdf.addPage(
        pdf.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pdf.EdgeInsets.all(32.0),
          build: (pdf.Context context) {
            return <pdf.Widget>[
              pdf.Header(
                child: pdf.Column(
                  crossAxisAlignment: pdf.CrossAxisAlignment.start,
                  children: [
                    pdf.Text('From Date: ' + fromdate!),
                    pdf.Text('To Date: ' + todate!),
                  ],
                ),
              ),
              pdf.Text(
                '$reportName for $userName',
                textAlign: pdf.TextAlign.center,
                style: pdf.TextStyle(
                  fontWeight: pdf.FontWeight.bold,
                  fontSize: 24,
                  decoration: pdf.TextDecoration.underline,
                ),
              ),
//               pdf.Paragraph(
//                 margin: const pdf.EdgeInsets.only(top: 12.0),
//                 text: '''
// The Sharjah Education Council of the Government of Sharjah testifies that , an Emirati national, has been working for us since and remains at the helm to date, and the following are their job data:''',
//               ),
              pdf.SizedBox(height: 30),
              pdf.Table.fromTextArray(
                headers: reportName == 'Absence Report'
                    ? [
                  'Date',
                  'In Time',
                  'Out Time',
                  'Status',
                  'Working Time',
                ]
                    : [
                  'Date',
                  'In Time',
                  'Out Time',
                  'Status',
                  'Working Time',
                  'Working Status',
                  'Reason',
                ],
                headerDecoration: pdf.BoxDecoration(
                  color: PdfColor.fromHex('#6392B0FF'),
                ),
                data: listofreport!,
                border: pdf.TableBorder.all(),
                cellAlignment: pdf.Alignment.center,
                cellAlignments: {
                  1: pdf.Alignment.center,
                },
              ),
            ];
          },
        ),
      );
    }

    void alldailyreport({
      String? userName,
      String? date,
      List<List<String>>? listofreport,
    }) {
      _certificatePdf = pdf.Document();
      _certificatePdf.addPage(
        pdf.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pdf.EdgeInsets.all(32.0),
          build: (pdf.Context context) {
            return <pdf.Widget>[
              pdf.Header(
                child: pdf.Column(
                  crossAxisAlignment: pdf.CrossAxisAlignment.start,
                  children: [
                    pdf.Text('Date: ' + date!),
                  ],
                ),
              ),
              pdf.Text(
                'Daily Report',
                textAlign: pdf.TextAlign.center,
                style: pdf.TextStyle(
                  fontWeight: pdf.FontWeight.bold,
                  fontSize: 24,
                  decoration: pdf.TextDecoration.underline,
                ),
              ),
              pdf.SizedBox(height: 30),
              pdf.Table.fromTextArray(
                headers: [
                  'Employee Name',
                  'Designation',
                  'Date',
                  'In Time',
                  'Out Time',
                  'Status',
                  'Working Time',
                  'Working Status',
                  'Reason',
                ],
                headerDecoration: pdf.BoxDecoration(
                  color: PdfColor.fromHex('#6392B0FF'),
                ),
                data: listofreport!,
                border: pdf.TableBorder.all(),
                cellAlignment: pdf.Alignment.center,
                cellAlignments: {
                  1: pdf.Alignment.center,
                },
              ),
            ];
          },
        ),
      );
    }

    void outGeoReport({
      String?fromdate,
      String ? todate,
      List<List<String>>? listofreport,
    }) async {
      final certificatePdf = pdf.Document();
      certificatePdf.addPage(
        pdf.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pdf.EdgeInsets.all(32.0),
          build: (pdf.Context context) {
            return <pdf.Widget>[
              pdf.Header(
                child: pdf.Column(
                  crossAxisAlignment: pdf.CrossAxisAlignment.start,
                  children: [
                    pdf.Text('From Date: ' + fromdate!),
                    pdf.Text('To Date: ' + todate!),
                  ],
                ),
              ),
              pdf.Text(
                'OutGeo Report for Employees',
                textAlign: pdf.TextAlign.center,
                style: pdf.TextStyle(
                  fontWeight: pdf.FontWeight.bold,
                  fontSize: 24,
                  decoration: pdf.TextDecoration.underline,
                ),
              ),
              pdf.SizedBox(height: 30),
              pdf.Table.fromTextArray(
                headers: [
                  'Date',
                  'Name',
                  'Latitude',
                  'Longitude',
                ],
                headerDecoration: pdf.BoxDecoration(
                  color: PdfColor.fromHex('#6392B0FF'),
                ),
                data: listofreport!,
                border: pdf.TableBorder.all(),
                cellAlignment: pdf.Alignment.center,
                cellAlignments: {
                  1: pdf.Alignment.center,
                },
              ),
            ];
          },
        ),
      );
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      String documentPath = documentDirectory.path;
      String fileName =
          DateFormat('hh:mm:ss').format(DateTime.now()) + '_OutGeo Report.pdf';
      File file = File("$documentPath/$fileName");
      file.writeAsBytesSync(await certificatePdf.save());
      await OpenFile.open(file.path);
      _certificate = file;
      _fileName = fileName;
    }

    void adminLeaveReport({
      String? fromdate,
      String? todate,
      List<List<String>>? listofreport,
    }) async {
      final certificatePdf = pdf.Document();
      certificatePdf.addPage(
        pdf.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pdf.EdgeInsets.all(32.0),
          build: (pdf.Context context) {
            return <pdf.Widget>[
              pdf.Header(
                child: pdf.Column(
                  crossAxisAlignment: pdf.CrossAxisAlignment.start,
                  children: [
                    pdf.Text('From Date: ' + fromdate!),
                    pdf.Text('To Date: ' + todate!),
                  ],
                ),
              ),
              pdf.Text(
                'Administrative Leaves Report $todateSelected',
                textAlign: pdf.TextAlign.center,
                style: pdf.TextStyle(
                  fontWeight: pdf.FontWeight.bold,
                  fontSize: 24,
                  decoration: pdf.TextDecoration.underline,
                ),
              ),
              pdf.SizedBox(height: 30),
              pdf.Table.fromTextArray(
                headers: [
                  'Name',
                  'From',
                  'To',
                  'Days',
                ],
                headerDecoration: pdf.BoxDecoration(
                  color: PdfColor.fromHex('#6392B0FF'),
                ),
                data: listofreport!,
                border: pdf.TableBorder.all(),
                cellAlignment: pdf.Alignment.center,
                cellAlignments: {
                  1: pdf.Alignment.center,
                },
              ),
            ];
          },
        ),
      );
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      String documentPath = documentDirectory.path;
      String fileName = DateFormat('hh:mm:ss').format(DateTime.now()) +
          ' ${todateSelected}_Administrative Leaves Report.pdf';
      File file = File("$documentPath/$fileName");
      file.writeAsBytesSync(await certificatePdf.save());
      await OpenFile.open(file.path);
      _certificate = file;
      _fileName = fileName;
    }

    void servicesReport({
      String? fromdate,
      String? todate,
      List<List<String>>? listofreport,
    }) async {
      final certificatePdf = pdf.Document();
      certificatePdf.addPage(
        pdf.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pdf.EdgeInsets.all(32.0),
          build: (pdf.Context context) {
            return <pdf.Widget>[
              pdf.Header(
                child: pdf.Column(
                  crossAxisAlignment: pdf.CrossAxisAlignment.start,
                  children: [
                    pdf.Text('From Date: ' + fromdate!),
                    pdf.Text('To Date: ' + todate!),
                  ],
                ),
              ),
              pdf.Text(
                'Services Report for Employees',
                textAlign: pdf.TextAlign.center,
                style: pdf.TextStyle(
                  fontWeight: pdf.FontWeight.bold,
                  fontSize: 24,
                  decoration: pdf.TextDecoration.underline,
                ),
              ),
              pdf.SizedBox(height: 30),
              pdf.Table.fromTextArray(
                headers: [
                  'Date',
                  'Employee Name',
                  'Certificate Name',
                ],
                headerDecoration: pdf.BoxDecoration(
                  color: PdfColor.fromHex('#6392B0FF'),
                ),
                data: listofreport!,
                border: pdf.TableBorder.all(),
                cellAlignment: pdf.Alignment.center,
                cellAlignments: {
                  1: pdf.Alignment.center,
                },
              ),
            ];
          },
        ),
      );
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      String documentPath = documentDirectory.path;
      String fileName = DateFormat('hh:mm:ss').format(DateTime.now()) +
          '_Administrative Leaves Report.pdf';
      File file = File("$documentPath/$fileName");
      file.writeAsBytesSync(await certificatePdf.save());
      await OpenFile.open(file.path);
      _certificate = file;
      _fileName = fileName;
    }

    void workingReport({
      @required String? reportName,
      String? userName,
      String? fromdate,
      String? todate,
      List<List<String>>? listofreport,
    }) {
      _certificatePdf = pdf.Document();

      _certificatePdf.addPage(
        pdf.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pdf.EdgeInsets.all(32.0),
          build: (pdf.Context context) {
            return <pdf.Widget>[
              pdf.Header(
                child: pdf.Column(
                  crossAxisAlignment: pdf.CrossAxisAlignment.start,
                  children: [
                    pdf.Text('From Date: ' + fromdate!),
                    pdf.Text('To Date: ' + todate!),
                  ],
                ),
              ),
              pdf.Text(
                '$reportName for $userName',
                textAlign: pdf.TextAlign.center,
                style: pdf.TextStyle(
                  fontWeight: pdf.FontWeight.bold,
                  fontSize: 24,
                  decoration: pdf.TextDecoration.underline,
                ),
              ),
              pdf.SizedBox(height: 30),
              pdf.Table.fromTextArray(
                headers: [
                  'Date',
                  'In Time',
                  'Out Time',
                  'Status',
                  'Difference',
                  'Working Status',
                  'Reason',
                ],
                headerDecoration: pdf.BoxDecoration(
                  color: PdfColor.fromHex('#6392B0FF'),
                ),
                data: listofreport!,
                border: pdf.TableBorder.all(),
                cellAlignment: pdf.Alignment.center,
                cellAlignments: {
                  1: pdf.Alignment.center,
                },
              ),
            ];
          },
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
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
            "Reports ",
            style: TextStyle(
                color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
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
        backgroundColor: kGray2,
        body: FutureBuilder<List<UserModel>?>(
            future: AllApi().getAllUsers(companyId: widget.userModel.companyId),
          builder: (context, snapshot) {

            if (!snapshot.hasData) {
              return kprogressbar;
            }

            List<UserModel> employyeList = snapshot.requireData!;
            var dropDownEmployee = employyeList.map((e) {
              if (e.managerid != null && e.managerid == widget.userModel.empId) {
                return e.name;
              }
            }).toList();
            dropDownEmployee.removeWhere((element) => element == null);
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [kGray3, kblack, kGray3,  kblack,],

                  ),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Reports type",
                        style: TextStyle(
                          fontSize: 18,color: kgolder
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      height: 38,
                      width: Get.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: kgolder),
                        gradient: LinearGradient(
                            colors: [ kgradientYellow,kgolder2]
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(9),),
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: DropdownButtonFormField(
                        dropdownColor: kDarkGolder,
                          decoration: InputDecoration(
                              fillColor: kDarkGolder,

                              icon: Align(
                                  alignment: Alignment.centerRight,
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(selectedValue == null ? " Select" : selectedValue!,style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold) ,),
                                      Icon(Icons.keyboard_arrow_down,color: kblack,),
                                    ],
                                  ))),

                          items: items
                              .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                color: kblack,
                                fontSize: 12,
                              ),
                            ),
                          ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Select Employee",
                        style: TextStyle(
                          fontSize: 18,color: kgolder
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      height: 36,
                      width: Get.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: kgolder),
                        gradient: LinearGradient(
                            colors: [ kgradientYellow,kgolder2]
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(9),),
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: DropdownButtonFormField(
                          dropdownColor: kDarkGolder,
                          decoration: InputDecoration(
                              fillColor: kgolder,
                              icon: Align(
                                  alignment: Alignment.centerRight,
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(selectedEmployee == null ? " Select" : selectedEmployee!,style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold) ,),
                                      Icon(Icons.keyboard_arrow_down,color: kblack,),
                                    ],
                                  ))),
                          items: dropDownEmployee
                              .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item!,
                              style: const TextStyle(
                                color: kblack,
                                fontSize: 12,
                              ),
                            ),
                          ))
                              .toList(),
                          value: selectedEmployee,
                          onChanged: (value) {
                            setState(() {
                              selectedEmployee = value as String;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "From",
                        style: TextStyle(
                          fontSize: 18,color: kgolder
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      height: 36,
                      width: Get.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: kgolder),
                        gradient: LinearGradient(
                            colors: [ kgradientYellow,kgolder2]
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(9),),
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: (){
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime.now()
                                  .subtract(const Duration(days: 120)),
                              maxTime: DateTime(2050, 6, 7),
                              onChanged: (date) {
                                setState(() {
                                  dateSelected = date.toString();
                                });
                              },
                              onConfirm: (date) {
                                setState(() {
                                  dateSelected = date.toString();
                                });
                              },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(dateSelected == null
                                        ? "DD-MM-YYYY"
                                        : DateFormat("yyyy-MM-dd")
                                        .parse(dateSelected!)
                                        .day
                                        .toString() +
                                        "-" +
                                        DateFormat("yyyy-MM-dd")
                                            .parse(dateSelected!)
                                            .month
                                            .toString() +
                                        "-" +
                                        DateFormat("yyyy-MM-dd")
                                            .parse(dateSelected!)
                                            .year
                                            .toString(),style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold) ,),
                                    Icon(Icons.keyboard_arrow_down,color: kblack,),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    selectedValue == "Daily Report"
                        ? const SizedBox()
                        :       Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "To",
                        style: TextStyle(
                          fontSize: 18,color: kgolder
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    selectedValue == "Daily Report"
                        ? const SizedBox()
                        :        Container(
                      height: 36,
                      width: Get.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: kgolder),
                        gradient: LinearGradient(
                            colors: [ kgradientYellow,kgolder2]
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(9),),
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: (){
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime.now()
                                  .subtract(const Duration(days: 120)),
                              maxTime: DateTime(2050, 6, 7),
                              onChanged: (date) {
                                setState(() {
                                  todateSelected = date.toString();
                                });
                              },
                              onConfirm: (date) {
                                setState(() {
                                  todateSelected = date.toString();
                                });
                              },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(todateSelected == null
                                        ? "DD-MM-YYYY"
                                        : DateFormat("yyyy-MM-dd")
                                        .parse(todateSelected!)
                                        .day
                                        .toString() +
                                        "-" +
                                        DateFormat("yyyy-MM-dd")
                                            .parse(todateSelected!)
                                            .month
                                            .toString() +
                                        "-" +
                                        DateFormat("yyyy-MM-dd")
                                            .parse(todateSelected!)
                                            .year
                                            .toString(),style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold) ,),
                                    Icon(Icons.keyboard_arrow_down,color: kblack,),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    _isOpening
                        ? kprogressbar
                        :   InkWell(
                      onTap: () async {
                        print('clivked');
                        setState(() {
                          _isOpening = true;
                        });
                        if (selectedValue == "Delay Report") {
                          if (dateSelected != null &&
                              todateSelected != null &&
                              selectedValue != null &&
                              selectedEmployee != null) {
                            List<ReportModel>? newList =
                                await AllApi().getDelayReportList(
                              companyid: widget.userModel.companyId,
                              employeeName: selectedEmployee,
                              fromDate: dateSelected,
                              toDate: todateSelected,
                              status: "late",
                            );

                            delayReportList.clear();
                            await Future.forEach(newList!,
                                    (ReportModel element) {
                                  delayReportList.add([
                                    element.date!,
                                    element.checkin!,
                                    element.checkout!,
                                    element.status!,
                                    element.checkOutDifference
                                        .toString()
                                        .replaceAll("-", ""),
                                    element.workingStatus!,
                                    element.reason ?? '',
                                  ]);
                                });

                            delayReport(
                              reportName: 'Delay Report',
                              userName: selectedEmployee,
                              fromdate: dateSelected,
                              todate: todateSelected,
                              listofreport: delayReportList,
                            );

                            await _savePdf("Delay Report", dateSelected!);
                          } else {
                            Get.snackbar("Error", "Please Fill All Details",
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        }
                        if (selectedValue == "Absence Report") {
                          if (dateSelected != null &&
                              todateSelected != null &&
                              selectedValue != null &&
                              selectedEmployee != null) {
                            List<ReportModel>? newList =
                                await AllApi().getDelayReportList(
                              companyid: widget.userModel.companyId,
                              employeeName: selectedEmployee,
                              fromDate: dateSelected,
                              toDate: todateSelected,
                              status: "absence",
                            );
                            delayReportList.clear();
                            await Future.forEach(newList!,
                                    (ReportModel element) {
                                  delayReportList.add([
                                    element.date!,
                                    element.checkin!,
                                    element.checkout!,
                                    element.status!,
                                    element.checkOutDifference
                                        .toString()
                                        .replaceAll("-", "")
                                  ]);
                                });

                            delayReport(
                              reportName: 'Absence Report',
                              userName: selectedEmployee,
                              fromdate: dateSelected,
                              todate: todateSelected,
                              listofreport: delayReportList,
                            );

                            await _savePdf("Absense Report", dateSelected!);
                          } else {
                            Get.snackbar("Error", "Please Fill All Details",
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        }
                        if (selectedValue == "Attendance Report") {
                          if (dateSelected != null &&
                              todateSelected != null &&
                              selectedValue != null &&
                              selectedEmployee != null) {
                            List<ReportModel>? newList =
                                await AllApi().getDelayReportList(
                              companyid: widget.userModel.companyId,
                              employeeName: selectedEmployee,
                              fromDate: dateSelected,
                              toDate: todateSelected,
                              status: "all",
                            );
                            delayReportList.clear();
                            await Future.forEach(newList!,
                                    (ReportModel element) {
                                  delayReportList.add([
                                    element.date!,
                                    element.checkin!,
                                    element.checkout!,
                                    element.status!,
                                    element.checkOutDifference
                                        .toString()
                                        .replaceAll("-", ""),
                                    element.workingStatus!,
                                    element.reason ?? '',
                                  ]);
                                });

                            delayReport(
                              reportName: 'Attendance Report',
                              userName: selectedEmployee,
                              fromdate: dateSelected,
                              todate: todateSelected,
                              listofreport: delayReportList,
                            );

                            await _savePdf(
                                "Attendance Report", dateSelected!);
                          } else {
                            Get.snackbar("Error", "Please Fill All Details",
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        }
                        if (selectedValue == "Daily Report") {
                          if (dateSelected != null &&
                              selectedValue != null) {
                            List<ReportModel>? newList =
                                await AllApi().getDailyReport(
                              widget.userModel.companyId,
                              dateSelected,
                              'todateSelected',
                            );
                            delayReportList.clear();
                            await Future.forEach(newList!,
                                    (ReportModel element) {
                                  delayReportList.add([
                                    element.empname!,
                                    element.designation!,
                                    element.date!,
                                    element.checkin!,
                                    element.checkout!,
                                    element.status!,
                                    element.checkOutDifference
                                        .toString()
                                        .replaceAll("-", ""),
                                    element.workingStatus!,
                                    element.reason ?? '',
                                  ]);
                                });

                            alldailyreport(
                              date: dateSelected,
                              listofreport: delayReportList,
                              userName: selectedEmployee,
                            );

                            await _savePdf("Daily Report", dateSelected!);
                          } else {
                            Get.snackbar("Error", "Please Fill All Details",
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        }

                        if (selectedValue == "OutGeo Login") {
                          if (dateSelected != null &&
                              todateSelected != null &&
                              selectedValue != null) {
                            List<OutGeoReportModel>? newList =
                                await AllApi().getOutGeoReport(
                              fromDate: dateSelected,
                              toDate: todateSelected,
                              companyId: widget.userModel.companyId,
                            );
                            outGeoReportList.clear();
                            await Future.forEach(newList!,
                                    (OutGeoReportModel element) {
                                  outGeoReportList.add([
                                    element.date!,
                                    element.empname!,
                                    element.latitude!,
                                    element.longitude!,
                                  ]);
                                });

                            outGeoReport(
                              fromdate: dateSelected,
                              todate: todateSelected,
                              listofreport: outGeoReportList,
                            );
                          } else {
                            Get.snackbar("Error", "Please Fill All Details",
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        }
                        if (selectedValue ==
                            "Administrative leave report") {
                          if (dateSelected != null &&
                              todateSelected != null &&
                              selectedValue != null) {
                            List<AdminLeavesModel>? newList =
                                await AllApi().getAdminLeavesReport(
                              fromDate: dateSelected,
                              toDate: todateSelected,
                              companyId: widget.userModel.companyId,
                            );
                            adminReportList.clear();
                            await Future.forEach(newList!,
                                    (AdminLeavesModel element) {
                                  adminReportList.add([
                                    element.employeeName!,
                                    element.from!,
                                    element.to!,
                                    element.days!,
                                  ]);
                                });

                            adminLeaveReport(
                              fromdate: dateSelected,
                              todate: todateSelected,
                              listofreport: adminReportList,
                            );
                          } else {
                            Get.snackbar("Error", "Please Fill All Details",
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        }

                        if (selectedValue ==
                            "Certificate report how many employees ask for certificate") {
                          if (dateSelected != null &&
                              todateSelected != null &&
                              selectedValue != null) {
                            List<ServicesModel>? newList =
                                await AllApi().getServicesReport(
                              fromDate: dateSelected,
                              toDate: todateSelected,
                              companyId: widget.userModel.companyId,
                            );
                            servicesReportList.clear();
                            await Future.forEach(newList!,
                                    (ServicesModel element) {
                                  servicesReportList.add([
                                    element.date!,
                                    element.empname!,
                                    element.certificateName!,
                                  ]);
                                });

                            servicesReport(
                              fromdate: dateSelected,
                              todate: todateSelected,
                              listofreport: servicesReportList,
                            );
                          } else {
                            Get.snackbar("Error", "Please Fill All Details",
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        }
                        if (selectedValue == 'Working Report') {
                          if (dateSelected != null &&
                              todateSelected != null &&
                              selectedValue != null &&
                              selectedEmployee != null) {
                            List<ReportModel>? newList =
                                await AllApi().getDelayReportList(
                              companyid: widget.userModel.companyId,
                              employeeName: selectedEmployee,
                              fromDate: dateSelected,
                              toDate: todateSelected,
                              status: "all",
                            );
                            workingReportList.clear();
                            await Future.forEach(newList!,
                                    (ReportModel element) {
                                  workingReportList.add([
                                    element.date!,
                                    element.checkin!,
                                    element.checkout!,
                                    element.status!,
                                    element.checkOutDifference
                                        .toString()
                                        .replaceAll("-", ""),
                                    element.workingStatus!,
                                    element.reason ?? '',
                                  ]);
                                });

                            workingReport(
                              reportName: 'Working Report',
                              userName: selectedEmployee,
                              fromdate: dateSelected,
                              todate: todateSelected,
                              listofreport: workingReportList,
                            );

                            await _savePdf("Working Report", dateSelected!);
                          } else {
                            Get.snackbar(
                              "Error",
                              "Please Fill All Details",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        }
                        setState(() {
                          _isOpening = false;
                        });
                      },
                          child: Container(
                      height: 40,
                      width: 170,

                      decoration: BoxDecoration(
                          border: Border.all(
                              color: kblack,
                              width: 2),
                          color:kgolder,borderRadius: BorderRadius.all(Radius.circular(12),),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Generate Report',style: TextStyle(color: kblack,fontSize: 18,fontWeight: FontWeight.bold),),

                          ],
                      ),
                    ),
                        ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}