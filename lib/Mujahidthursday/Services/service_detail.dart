import 'dart:io';

import 'package:demo_nikita/Components/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdf;
import 'package:permission_handler/permission_handler.dart';

import '../../Components/api.dart';
import '../../Components/models.dart';

class ServiceDetailsHR extends StatefulWidget {
  final ServicesModel servicesList;
  final UserModel userModel;
  const ServiceDetailsHR({Key? key, required this.servicesList, required this.userModel})
      : super(key: key);

  @override
  _ServiceDetailsHRState createState() => _ServiceDetailsHRState();
}

class _ServiceDetailsHRState extends State<ServiceDetailsHR> {
  final _allApi = AllApi();
  final _certificatePdf = pdf.Document();
  final _formKey = GlobalKey<FormState>();
  String selectedStatus = '0';
  File? _certificate;
  String? _fileName;
  Map<String, String> detailedSalaryFields = {};
  Map<String, String> totalSalaryFields = {};
  Map<String, String> withoutSalaryFields = {};
  bool sent = false;
  //
  Dio? dio = Dio();
  bool isloadingfile = false;
  Directory? directory;


  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  void _writeWithoutSalary({
    required UserModel? employeeDetails,
    required Map<String, String> fields,companyDetails
  }) {
    print('withputsalary print $fields');
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
                  pdf.Text(
                    'Date: ' +
                        DateFormat('dd/MM/yyyy').format(
                          DateTime.now(),
                        ) +
                        ' M',
                  ),
                  pdf.Text(
                    'Number: ' + fields['certificateNumber']! + ' m',
                  ),
                ],
              ),
            ),
            pdf.Container(
              alignment: pdf.Alignment.center,
              child: pdf.Text(
                'Testimony to whoever it is.',
                textAlign: pdf.TextAlign.center,
                style: const pdf.TextStyle(
                  fontSize: 24,
                  decoration: pdf.TextDecoration.underline,
                ),
              ),
            ),
            pdf.Paragraph(
              margin: const pdf.EdgeInsets.only(top: 12.0),
              text: '''
${companyDetails['cname']} certifies that the employee ${employeeDetails!.name} - ${fields['nationality']} Nationality, we have worked since "${employeeDetails.joinDate} M" and currently fill the job of  "${employeeDetails.designation}" Sheremains at the helm to date.
''',
            ),
            pdf.Paragraph(
              text: ''' 
To present it to: ${fields['toPresent']} 
I gave him  this certificate at the request of the Department without the chamber taking the slightest responsibility for the rights of others.
''',
              textAlign: pdf.TextAlign.justify,
              margin: const pdf.EdgeInsets.only(top: 12.0),
            ),
            pdf.Paragraph(
              text: ''' 
And you are very kind with respect and appreciation.
''',
              textAlign: pdf.TextAlign.justify,
              margin: const pdf.EdgeInsets.only(top: 12.0),
            ),
            pdf.Container(
              alignment: pdf.Alignment.bottomRight,
              child: pdf.Paragraph(
                text: ''' 
            


${companyDetails['mname']}
${companyDetails['cname']}
            ''',
                style: pdf.TextStyle(
                  fontSize: 20,
                  fontWeight: pdf.FontWeight.bold,
                ),
                textAlign: pdf.TextAlign.left,
                margin: const pdf.EdgeInsets.only(top: 12.0),
              ),
            ),
            pdf.Container(
              alignment: pdf.Alignment.bottomLeft,
              child: pdf.Paragraph(
                text: ''' 
Reviews: 


1. The validity of the certificate is one month from the date it was issued.
2. Any scraping or change in this certificate cancels it.
            ''',
                style: const pdf.TextStyle(
                  fontSize: 10,
                ),
                margin: const pdf.EdgeInsets.only(top: 12.0),
              ),
            ),
          ];
        },
      ),
    );
  }

  void _writeTotalSalary({
    required UserModel employeeDetails,
    required Map<String, String> fields,companyDetails
  }) {
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
                  pdf.Text(
                    'Date: ' +
                        DateFormat('dd/MM/yyyy').format(
                          DateTime.now(),
                        ) +
                        ' M',
                  ),
                  pdf.Text(
                    'Number: ' + fields['certificateNumber']!! + ' m',
                  ),
                ],
              ),
            ),
            pdf.Container(
              alignment: pdf.Alignment.center,
              child: pdf.Text(
                'Testimony to whoever it is.',
                textAlign: pdf.TextAlign.center,
                style: const pdf.TextStyle(
                  fontSize: 24,
                  decoration: pdf.TextDecoration.underline,
                ),
              ),
            ),
            pdf.Paragraph(
              margin: const pdf.EdgeInsets.only(top: 12.0),
              text: '''
${companyDetails['cname']} that the employee ${employeeDetails.name} - a Emirati national, has been working for us since "${employeeDetails.joinDate} M" and currently holds the position of  "${employeeDetails.designation}" And you get a total monthly salary and the amount of it ${totalSalaryFields['totalMonthlySalary']} Only a dirham for others - and still on top of its work to date.
''',
            ),
            pdf.Paragraph(
              text: ''' 
To present them to: ${fields['toPresent']} 
The person was given this certificate at their request without the Chamber taking the slightest responsibility for the rights of others.
''',
              textAlign: pdf.TextAlign.justify,
              margin: const pdf.EdgeInsets.only(top: 12.0),
            ),
            pdf.Paragraph(
              text: ''' 
And you are very kind with respect and appreciation.
''',
              textAlign: pdf.TextAlign.justify,
              margin: const pdf.EdgeInsets.only(top: 12.0),
            ),
            pdf.Container(
              alignment: pdf.Alignment.bottomRight,
              child: pdf.Paragraph(
                text: ''' 
            


${companyDetails['mname']}
${companyDetails['cname']}
            ''',
                style: pdf.TextStyle(
                  fontSize: 20,
                  fontWeight: pdf.FontWeight.bold,
                ),
                textAlign: pdf.TextAlign.left,
                margin: const pdf.EdgeInsets.only(top: 12.0),
              ),
            ),
            pdf.Container(
              alignment: pdf.Alignment.bottomLeft,
              child: pdf.Paragraph(
                text: ''' 
Reviews: 


1. The validity of the certificate is one month from the date it was issued.
2. Any scraping or change in this certificate cancels it.
            ''',
                style: const pdf.TextStyle(
                  fontSize: 10,
                ),
                margin: const pdf.EdgeInsets.only(top: 12.0),
              ),
            ),
          ];
        },
      ),
    );
  }

  void _writeDetailedSalary({
    required UserModel employeeDetails,
    required Map<String, String> fields,companyDetails
  }) {
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
                  pdf.Text(
                    'Date: ' +
                        DateFormat('dd/MM/yyyy').format(
                          DateTime.now(),
                        ) +
                        ' M',
                  ),
                  pdf.Text(
                    'Number: ' + fields['certificateNumber']!,
                  ),
                ],
              ),
            ),
            pdf.Text(
              'Detailed Salary Certificate',
              textAlign: pdf.TextAlign.center,
              style: pdf.TextStyle(
                fontWeight: pdf.FontWeight.bold,
                fontSize: 24,
                decoration: pdf.TextDecoration.underline,
              ),
            ),
            pdf.Paragraph(
              margin: const pdf.EdgeInsets.only(top: 12.0),
              text: '''
The ${companyDetails['cname']} testifies that ${employeeDetails.name}, an Emirati national, has been working for us since ${employeeDetails.joinDate} and remains at the helm to date, and the following are their job data:''',
            ),
            pdf.Table.fromTextArray(
              data: [
                ['', 'Functional Data'],
                [
                  'Job',
                  fields['job'],
                ],
                [
                  'Grade',
                  fields['grade'],
                ],
                [
                  'Contract Status',
                  fields['contractStatus'],
                ],
                [
                  'Base Salary',
                  fields['baseSalary'],
                ],
                [
                  'Cost of living',
                  fields['costOfLiving'],
                ],
                [
                  'Social Allowance',
                  fields['socialAllowance'],
                ],
                [
                  'Total',
                  fields['total'],
                ],
                [
                  'Discount Insurance',
                  fields['discountInsurance'],
                ],
                [
                  'Net',
                  fields['net'],
                ],
                [
                  'Housing Allowance',
                  fields['housingAllowance'],
                ],
                [
                  'Tickets',
                  'Not to spend',
                ],
                [
                  'Tuition fees for children',
                  'Not to spend',
                ],
                [
                  'Instead of consuming water and electricity',
                  'Not to spend',
                ],
                [
                  'Furniture allowance grant',
                  'Not to spend',
                ],
                [
                  'Legal Status',
                  'Governmental',
                ],
                [
                  'Workplace',
                  '${companyDetails['address']}',
                ],
              ],
              border: pdf.TableBorder.all(),
              cellAlignment: pdf.Alignment.centerLeft,
              cellAlignments: {
                1: pdf.Alignment.center,
              },
            ),
            pdf.Paragraph(
              text: ''' 
To present them to: ${fields['toPresent']} 
The person was given this certificate at their request without the Chamber taking the slightest responsibility for the rights of others.
            ''',
              textAlign: pdf.TextAlign.justify,
              margin: const pdf.EdgeInsets.only(top: 12.0),
            ),
            pdf.Paragraph(
              text: ''' 
            


${companyDetails['mname']}
${companyDetails['cname']}
            ''',
              style: pdf.TextStyle(
                fontSize: 20,
                fontWeight: pdf.FontWeight.bold,
              ),
              textAlign: pdf.TextAlign.left,
              margin: const pdf.EdgeInsets.only(top: 12.0),
            ),
            pdf.Paragraph(
              text: ''' 
-	Any scraping or change in this certificate is cancelled bya.
-	The validity of the certificate is three months from its date.
            ''',
              style: const pdf.TextStyle(
                fontSize: 10,
              ),
              textAlign: pdf.TextAlign.right,
              margin: const pdf.EdgeInsets.only(top: 12.0),
            ),
          ];
        },
      ),
    );
  }

  Future _savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    String fileName =
        DateFormat('hh:mm:ss').format(DateTime.now()) + '_certificate.pdf';
    File file = File("$documentPath/$fileName");
    file.writeAsBytesSync(await _certificatePdf.save());
    await OpenFile.open(file.path);
    setState(() {
      _certificate = file;

      _fileName = fileName;
    });

  }

  Future<bool> viewPDF(String url, String fileName) async {
    print("url $url");
    try {
      setState(() {
        isloadingfile = true;
      });
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = await getExternalStorageDirectory();
          // String newPath = "";
          // print(directory);
          // List<String> paths = directory.path.split("/");
          // for (int x = 1; x < paths.length; x++) {
          //   String folder = paths[x];
          //   if (folder != "Android") {
          //     newPath += "/" + folder;
          //   } else {
          //     break;
          //   }
          // }
          // newPath = newPath + "/Download";
          // directory = Directory(newPath);

        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.storage)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }

      if (!await directory!.exists()) {
        await directory!.create(recursive: false);
      }
      if (await directory!.exists()) {
        File saveFile = File(directory!.path + "/$fileName");
        await dio!.download(
          url,
          saveFile.path,
          onReceiveProgress: (value1, value2) {
            print('Receve: ${value1.toStringAsFixed(0)}');
            print('Total: ${value2.toStringAsFixed(0)}');
          },
          options: Options(
            contentType: 'Content-Type',
          ),
        );
        if (Platform.isIOS) {}
        return true;
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isloadingfile = false;
      });
      OpenFile.open(directory!.path + "/$fileName");
    }
    return false;
  }

  Widget _buildCard({
    required   onPressedFillDetails,
    required  onPressedSend,
  }) {
    print(widget.servicesList.fileName == '');

    return Card(
      elevation: 8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [kgradientYellow, kgolder2]),
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: kgolder,
              width: 2,
            )),
        padding: const EdgeInsets.all(12.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.servicesList.fileName == '' ||
                widget.servicesList.fileName != null
                ? InkWell(
              onTap: () async {
                await viewPDF(
                    'http://faizeetech.com/pdf/${widget.servicesList.fileName}',
                    '${widget.servicesList.fileName}');
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "View PDF 1",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                color: kgolder2,
              ),
            )
                : sent
                ? InkWell(
              onTap: () async {
                await viewPDF(
                    'http://faizeetech.com/pdf/${widget.servicesList.fileName}',
                    '${widget.servicesList.fileName}');
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("View PDF 3",
                      style: TextStyle(color: Colors.white)),
                ),
                color: kgolder2,
              ),
            )
                : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: onPressedFillDetails,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)),
                        color: kGray2,
                        border: Border.all(
                          color: kblack,
                          width: 2,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'Fill Details',
                        style: TextStyle(fontSize: 18,color: kgolder2),
                      ),
                    ),
                  ),
                ),
                _certificate != null ?   ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(kgolder2),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'Send',
                      style: TextStyle(fontSize: 18,color: kblack),
                    ),
                  ),
                  onPressed: onPressedSend,
                ) : SizedBox.shrink(),

              ],
            ),
          ],
        ),
      ),
    );
  }

  // bool _trySubmit() {
  //   FocusScope.of(context).unfocus();
  //   final isValid = _formKey.currentState!.validate();
  //   if (isValid) {
  //     _formKey.currentState!.save();
  //   }
  //   return isValid;
  // }

  _detailedSalaryForm({required UserModel employeeDetails,companyDetails}) {
    return     Get.defaultDialog(
        title: 'Details',

        titleStyle: TextStyle(color: kgolder),
        titlePadding: EdgeInsets.only(right: 100,top: 5),
        backgroundColor: Colors.transparent,

        content: StatefulBuilder(
            builder: (context, setState1) {
              return Container(
                width: Get.width,
                height: Get.height * 0.4,
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
                  child: Form(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          buildGoldenTextfield('M.B./...../.....', (value){
                            print('valueofcerti = $value');
                            setState1((){
                              detailedSalaryFields
                                  .addAll({'certificateNumber': value!});
                            });

                          }),
                          buildGoldenTextfield('Job', (value){
                            setState1((){
                              detailedSalaryFields.addAll({'job': value!});
                            });

                          }),
                          buildGoldenTextfield('Grade', (value){
                            setState1((){
                              detailedSalaryFields.addAll({'grade': value!});
                            });

                          }),

                          buildGoldenTextfield('Contract Status', (value){
                            setState1((){
                              detailedSalaryFields.addAll({'contractStatus': value!});
                            });

                          }),


                          buildGoldenTextfield('Base Salary', (value){
                            setState1((){
                              detailedSalaryFields.addAll({'baseSalary': value!});
                            });

                          }),

                          buildGoldenTextfield('Cost of Living', (value){
                            setState1((){
                              detailedSalaryFields.addAll({'costOfLiving': value!});
                            });

                          }),

                          buildGoldenTextfield('Social Allowance', (value){
                            setState1((){
                              detailedSalaryFields.addAll({'socialAllowance': value!});
                            });
                          }),

                          buildGoldenTextfield('Total', (value){
                            setState1((){
                              detailedSalaryFields.addAll({'total': value!});
                            });

                          }),

                          buildGoldenTextfield('Discount Insurance', (value){
                            setState1((){
                              detailedSalaryFields.addAll({'discountInsurance': value!});
                            });


                          }),

                          buildGoldenTextfield('Net', (value){
                            setState1((){
                              detailedSalaryFields.addAll({'net': value!});
                            });


                          }),

                          buildGoldenTextfield('Housing Allowance', (value){
                            setState1((){

                              detailedSalaryFields
                                  .addAll({'housingAllowance': value!});                            });

                          }),

                          buildGoldenTextfield('To present', (value){
                            setState1((){
                              detailedSalaryFields
                                  .addAll({'toPresent': value!});                      });

                          }),

                          // buildGoldenTextfield('To present', (value){
                          //
                          //
                          //   detailedSalaryFields
                          //       .addAll({'toPresent': value!});
                          // }),

                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () async {
                                  // final canSubmit = _trySubmit();

                                  Navigator.of(context).pop();
                                  _writeDetailedSalary(
                                      employeeDetails: employeeDetails,
                                      fields: detailedSalaryFields,companyDetails:companyDetails
                                  );
                                  await _savePdf();
                                  print('file = $_certificate');

                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: kgolder,

                                  ),
                                  child:Padding(
                                    padding:  EdgeInsets.only(left: 8,right: 8),
                                    child: Center(child: Text("Generate Certificate",style: TextStyle(color: kblack,fontSize:18),)),
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

  _totalSalaryForm({required UserModel employeeDetails,companyDetails}) {
    return     Get.defaultDialog(
        title: 'Details',

        titleStyle: TextStyle(color: kgolder),
        titlePadding: EdgeInsets.only(right: 100,top: 5),
        backgroundColor: Colors.transparent,

        content: StatefulBuilder(
            builder: (context, setState1) {
              return Container(
                width: Get.width,
                height: Get.height * 0.4,
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
                  child: Form(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          buildGoldenTextfield('M.B./...../.....', (value){
                            detailedSalaryFields
                                .addAll({'certificateNumber': value!});
                          }),
                          buildGoldenTextfield('Total Monthly Salary', (value){
                            detailedSalaryFields.addAll({'totalMonthlySalary': value!});
                          }),
                          buildGoldenTextfield('To present', (value){
                            detailedSalaryFields.addAll({'toPresent': value!});
                          }),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () async {
                                  // final canSubmit = _trySubmit();

                                  Navigator.of(context).pop();
                                  _writeTotalSalary(
                                      employeeDetails: employeeDetails,
                                      fields: totalSalaryFields,companyDetails:companyDetails
                                  );
                                  await _savePdf();

                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: kgolder,

                                  ),
                                  child:Padding(
                                    padding:  EdgeInsets.only(left: 8,right: 8),
                                    child: Center(child: Text("Generate Certificate",style: TextStyle(color: kblack,fontSize:18),)),
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

  _withoutSalaryForm({required UserModel employeeDetails,companyDetails}) {

    return     Get.defaultDialog(
        title: 'Details',

        titleStyle: TextStyle(color: kgolder),
        titlePadding: EdgeInsets.only(right: 100,top: 5),
        backgroundColor: Colors.transparent,

        content: StatefulBuilder(
            builder: (context, setState1) {
              return Container(
                width: Get.width,
                height: Get.height * 0.4,
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
                  child: Form(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          buildGoldenTextfield('M.B./...../.....', (value){
                            setState1((){
                              withoutSalaryFields
                                  .addAll({'certificateNumber': value!});
                            });

                          }),
                          buildGoldenTextfield('Nationality', (value){
                            setState1((){
                              withoutSalaryFields.addAll({'nationality': value!});
                            });

                          }),
                          buildGoldenTextfield('To present', (value){
                            setState1((){
                              withoutSalaryFields.addAll({'toPresent': value!});
                            });

                          }),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () async {
                                  // final canSubmit = _trySubmit();


                                  _writeWithoutSalary(
                                      employeeDetails: employeeDetails,
                                      fields: withoutSalaryFields,companyDetails:companyDetails
                                  );
                                  await _savePdf();
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: kgolder,

                                  ),
                                  child:Padding(
                                    padding:  EdgeInsets.only(left: 8,right: 8),
                                    child: Center(child: Text("Generate Certificate",style: TextStyle(color: kblack,fontSize:18),)),
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                kGray3,
                kblack,
              ],
            )),
        child: Scaffold(
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
            leadingWidth: 25,
            title: Text(
              widget.servicesList.empname!,
              style: TextStyle(
                  color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            toolbarHeight: 55,
            backgroundColor: kgolder2,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [kgolder2, kgradientYellow, kgolder2]),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildCard(
                    onPressedFillDetails: () async {
                      var companyDetails =       await AllApi().getCompanyDetails(companyid: widget.userModel!.companyId);


                      var employeeDetails = await _allApi.getUserByRefId(
                        refId: widget.servicesList.refid!,
                      );

                      if (widget.servicesList.certificateName!
                          .toLowerCase()
                          .contains('certificate with detailed salary')) {
                        _detailedSalaryForm(
                            employeeDetails: employeeDetails!,companyDetails :companyDetails
                        );
                      } else if (widget.servicesList.certificateName!
                          .toLowerCase()
                          .contains('certificate with total salary')) {
                        _totalSalaryForm(
                            employeeDetails: employeeDetails!,companyDetails :companyDetails
                        );
                      } else if (widget.servicesList.certificateName!
                          .toLowerCase()
                          .contains('certificate without salary')) {
                        _withoutSalaryForm(
                            employeeDetails: employeeDetails!,
                            companyDetails :companyDetails
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              '''
No template has been provided for the requested certificate.''',
                            ),
                          ),
                        );
                      }
                    },
                    onPressedSend: _certificate != null
                        ? () async {
                      if (_certificate != null) {
                        var result = await _allApi.setFile(_certificate!);

                        var documentNameSent =
                        await _allApi.putCertificateName(
                            companyId: widget.userModel.companyId!,
                            refId: widget.servicesList.refid!,
                            fileName: _fileName!,date: widget.servicesList.date,certificatename: widget.servicesList.certificateName
                        );

                        if (documentNameSent == 'updated' &&
                            result == '1') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Document Sent.'),
                            ),
                          );
                          setState(() {
                            sent = true;
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to send document.'),
                            ),
                          );
                        }
                      }
                    }
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}