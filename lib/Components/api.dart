import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_utils/src/extensions/double_extensions.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'models.dart';

class AllApi {
  Future<UserModel> getUser(String email) async {
    var getUserUrl =
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugGetUser";

    var response = await http.get(Uri.parse("$getUserUrl?email=$email"));
    print('respnse use ${response.body}');
    if (response.statusCode == 200) {
      var list = json.decode(response.body);
      if (list != null) {
        var model = UserModel().fromJson(list);
        return model;
      } else {
        return UserModel();
      }
    } else {
      return UserModel();
    }
  }

  Future<void> postCheckIn({
    @required String? checkInTime,
    @required String? checkOutTime,
    @required String? refId,
    @required String? date,
    @required String? companyId,
    @required String? designation,
    @required int? hours,
    String? status,
    String? reason,
  }) async {
    var postCheckInUrl = Uri.parse(
        'https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugPostCheckIn');


  if( checkOutTime != '-----'){
      var checkOutDifference1 = DateFormat('hh:mm a')
          .parse(checkOutTime!)
          .difference(DateFormat('hh:mm a').parse(checkInTime!));

      var differenceFinal =
      ((checkOutDifference1.inSeconds / 3600)).toDouble().toPrecision(2);

      print('differenc ${differenceFinal.toString()}');

      var workingstatus = differenceFinal > double.parse(hours.toString())
          ? 'extra'
          : differenceFinal < double.parse(hours.toString())
          ? 'early'
          : 'perfect';


      var response = await http.post(postCheckInUrl, body: {
        'checkin': checkInTime,
        'checkout': checkOutTime,
        'refid': refId,
        'date': date,
        'companyid': companyId,
        'reason': reason ?? '',
        'status': status,
        'designation': designation,
        'check_out_difference': differenceFinal.toString(),
        'workingstatus': workingstatus.toString(),


      });
      if (response.statusCode == 200) {
        return;
      } else {
        Fluttertoast.showToast(msg: response.body);
      }
    }else{

    var response = await http.post(postCheckInUrl, body: {
      'checkin': checkInTime,
      'checkout': checkOutTime,
      'refid': refId,
      'date': date,
      'companyid': companyId,
      'reason': reason ?? '',
      'status': status,
      'designation': designation,
      'check_out_difference': '',
      'workingstatus': '',
    });
    if (response.statusCode == 200) {
      return;
    } else {
      Fluttertoast.showToast(msg: response.body);
    }
  }


  }

  Future<dynamic> getCheckIn({
    @required String? refId,
    @required String? date,
  }) async {
    var postCheckInUrl = Uri.parse(
        'https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugGetCheckIn?date=$date&refid=$refId');

    var response = await http.get(postCheckInUrl);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      Fluttertoast.showToast(msg: response.body);
    }
  }

  Future<dynamic> getVicinity({
    @required String? refId,
    @required double? latitude,
    @required double? longitude,
  }) async {
    var getVicinityUrl = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugGetOfficeLocation?lat=$latitude&long=$longitude&refid=$refId");

    var response = await http.get(getVicinityUrl);
    print('viicnity ${response.body}');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return;
    }
  }

  Future<void> postCheckInRequest({
    @required String? refId,
    @required String? date,
    @required String? lat,
    @required String? lon,
    @required String? name,
    @required String? companyId,
    @required String? designation,
  }) async {
    var postCheckInRequestUrl = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugPostCheckInRequest");

    var response = await http.post(postCheckInRequestUrl, body: {
      'refid': refId,
      'date': date,
      'status': 'pending',
      'lat': lat,
      'lon': lon,
      'name': name,
      'companyid': companyId,
      'designation': designation,
    });
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: response.body);
      return;
    } else {
      Fluttertoast.showToast(msg: response.body);
      return;
    }
  }

  Future<void> postOuterGeoList({
    @required String? refId,
    @required String? date,
    @required String? lat,
    @required String? lon,
    @required String? companyId,
    @required String? empName,
    @required String? designation,
  }) async {
    var reqno = 'cr' + DateTime.now().microsecond.toString();
    var postCheckInRequestUrl = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugPostOuterGeoList");

    var response = await http.post(postCheckInRequestUrl, body: {
      'refid': refId,
      'date': date,
      'lat': lat,
      'lon': lon,
      'companyid': companyId,
      'reqno': reqno,
      'empname': empName,
      'designation': designation,
    });
    if (response.statusCode == 200) {
      return;
    } else {
      Fluttertoast.showToast(msg: response.body);
      return;
    }
  }

  Future<List<CoursesModel>?> getCourses(String companyId) async {
    var getCoursesUrl = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugGetCourses?companyId=$companyId");

    var response = await http.get(getCoursesUrl);

    if (response.statusCode == 200) {
      List courseList = json.decode(response.body);
      Iterable<CoursesModel> courses = courseList.map((e) {
        return CoursesModel().fromJson(e);
      });
      return courses.toList();
    } else {
      return null;
    }
  }

  Future<List<LeaveRequestsModel>?> getLeaveRequests(String companyId) async {
    var getLeaveRequestsUrl = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugGetLeaveRequests?companyId=$companyId");

    var response = await http.get(getLeaveRequestsUrl);

    if (response.statusCode == 200) {
      List leaveRequestsList = json.decode(response.body);
      Iterable<LeaveRequestsModel> leaveRequests = leaveRequestsList.map((e) {
        return LeaveRequestsModel().fromJson(e);
      });
      return leaveRequests.toList();
    } else {
      return null;
    }
  }

  Future<String> postLeaveRequest(
      {@required String? refId,
      @required String? date,
      @required String? title,
      @required List? details,
      @required String? companyId,
      @required String? fromDate,
      @required String? toDate,
      @required String? empName,
      @required String? requestId,
      String? manager_refid,
      String? hr_refid}) async {
    var postLeaveRequestUrl = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugPostLeaveRequest");

    var response = await http.post(
      postLeaveRequestUrl,
      body: {
        'refid': refId,
        'date': date,
        'title': title,
        'details': details.toString(),
        'verify': '0',
        'companyid': companyId,
        'from': fromDate,
        'to': toDate,
        'empname': empName,
        'requestid': requestId,
        'manager_refid': manager_refid ?? '',
        'hr_refid': hr_refid ?? ''
      },
    );
    if (response.statusCode == 200) {
      return 'success';
    } else {
      return 'failed';
    }
  }

  Future<UserModel?> getemployeeBenchList({@required String? name}) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugGetEmployeeBenchList?name=$name");
    var response = await http.get(url);

    var employeeDetailsJSON = json.decode(response.body);
    if (employeeDetailsJSON != "no details found") {
      var employeeDetails = UserModel().fromJson(employeeDetailsJSON);
      return employeeDetails;
    } else {
      return null;
    }
  }

  Future<dynamic> postBenchList(
      {@required UserModel? userModel,
      @required UserModel? replacementUserModel,
      @required String? jobDescription,
      @required String? replacementType,
      String? fromDate,
      String? toDate,
      String? manager_refid,
      String? hr_refid}) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugPostBenchlist");
    var response = await http.post(url, body: {
      'user_empid': userModel!.empId,
      'user_name': userModel.name,
      'user_phone': userModel.phoneNumber,
      'replacement_empid': replacementUserModel!.empId,
      'replacement_name': replacementUserModel.name,
      'replacement_phone': replacementUserModel.phoneNumber,
      'replacement_address': replacementUserModel.address,
      'replacement_allotedOffice': replacementUserModel.allotedOffice,
      'replacement_designation': replacementUserModel.designation,
      'replacement_email': replacementUserModel.email,
      'replacement_manager': replacementUserModel.manager,
      'replacement_refId': replacementUserModel.refId,
      'job_description': jobDescription,
      'replacement_type': replacementType,
      'from': fromDate,
      'to': toDate,
      'verify': '0',
      'benchid': DateTime.now().microsecond.toString(),
      'companyid': replacementUserModel.companyId,
      'timestamp': DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.now()),
      'manager_refid': manager_refid ?? '',
      'hr_refid': hr_refid ?? ''
    });
    if (response.statusCode != 200) {
      return 'Request failed';
    } else {
      return 'Success';
    }
  }

  Future<List<RelatedSitesModel>> getRelatedSites(
      {@required String? companyId}) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugGetRelatedSites?companyId=$companyId");
    var response = await http.get(url);
    var body = json.decode(response.body);
    if (body != []) {
      List relatedSitesList = body;
      Iterable<RelatedSitesModel> relatedSites = relatedSitesList.map((e) {
        return RelatedSitesModel().fromJson(e);
      });
      return relatedSites.toList();
    } else {
      return [];
    }
  }

  Future<List<AttendanceReportModel>?> getCheckInHistory({
    @required String? empId,
    @required String? companyId,
    @required String? status,
    @required String? fromDate,
    @required String? toDate,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugGetCheckInHistory?empId=$empId&companyId=$companyId&status=$status");
    var response = await http.get(url);
    var body = json.decode(response.body);
    if (response.statusCode == 200 && body != '[]') {
      List preCheckInHistoryList = body;

      var checkInHistoryList = preCheckInHistoryList.where((element) {
        return DateFormat("yyyy-MM-dd").parse(element['date']).isAfter(
                  DateFormat("yyyy-MM-dd").parse(fromDate!).subtract(
                        const Duration(days: 1),
                      ),
                ) &&
            DateFormat("yyyy-MM-dd").parse(element['date']).isBefore(
                  DateFormat("yyyy-MM-dd").parse(toDate!).add(
                        const Duration(days: 1),
                      ),
                );
      });

      Iterable<AttendanceReportModel> checkInHistory =
          checkInHistoryList.map((e) {
        return AttendanceReportModel().fromJson(e);
      });
      return checkInHistory.toList();
    }
    return null;
  }

  Future<void> postEnquiry({
    @required String? subject,
    @required String? description,
    @required String? refId,
    @required String? companyId,
    @required String? empName,
    @required String? empEmail,
    @required String? hrId,
    @required String? hrName,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugPostEnquiry");
    var response = await http.post(
      url,
      body: {
        'refid': refId,
        'companyid': companyId,
        'subject': subject,
        'description': description,
        'timestamp': DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.now()),
        'empname': empName,
        'empemail': empEmail,
        'hrid': hrId,
        'hrname': hrName,
      },
    );
    if (response.statusCode != 200) {
      return;
    }
  }

  Future<List<BenchListModel>?> getBenchListRequests({
    @required String? verify,
    @required String? companyId,
    @required String? empId,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugGetBenchListRequests?verify=$verify&companyId=$companyId&empId=$empId");
    var response = await http.get(url);
    var body = json.decode(response.body);
    if (response.statusCode == 200 && body != '[]') {
      List requestList = body;
      Iterable<BenchListModel> request = requestList.map((e) {
        return BenchListModel().fromJson(e);
      });
      return request.toList();
    } else {
      return null;
    }
  }

  Future<dynamic> postAdminLeave({
    @required String? days,
    @required String? refId,
    @required String? employeeName,
    @required String? companyId,
    @required String? verify,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugPostAdminLeave");
    var response = await http.post(url, body: {
      'days': days,
      'refid': refId,
      'employee_name': employeeName,
      'companyid': companyId,
      'verify': verify,
    });
    var body = json.decode(response.body);
    if (response.statusCode == 200 && body == 'success') {
      return 'success';
    } else {
      return 'failed';
    }
  }

  Future<List<AdminLeavesModel>?> getAdminLeaves({
    @required String? verify,
    @required String? companyId,
    @required String? refId,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugGetAdminLeaves?verify=$verify&companyId=$companyId&refId=$refId");
    var response = await http.get(url);
    var body = json.decode(response.body);
    if (body != '[]' && response.statusCode == 200) {
      List responseList = body;
      Iterable<AdminLeavesModel> adminLeaves = responseList.map((e) {
        return AdminLeavesModel().fromJson(e);
      });
      return adminLeaves.toList();
    } else {
      return null;
    }
  }

  Future<void> postAttendanceReport({
    @required String? empId,
    @required String? companyId,
    @required String? status,
    @required String? checkOutDifference,
    @required String? checkInDelayInHours,
    @required String? checkInDelayInMinutes,
    @required String? checkInTime,
    @required String? checkOutTime,
    @required String? employeeName,
    @required String? designation,
    String? reason,
    @required int? hours,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugPostAttendanceReport");

    var checkOutDifference1 = DateFormat('hh:mm a')
        .parse(checkOutTime!)
        .difference(DateFormat('hh:mm a').parse(checkInTime!));

    var differenceFinal =
        ((checkOutDifference1.inSeconds / 3600)).toDouble().toPrecision(2);

    print('differenc ${differenceFinal.toString()}');

    var workingstatus = differenceFinal > double.parse(hours.toString())
        ? 'extra'
        : differenceFinal < double.parse(hours.toString())
            ? 'early'
            : 'perfect';

    var response = await http.post(
      url,
      body: {
        'empid': empId,
        'companyid': companyId,
        'status': status,
        'check_out_difference': differenceFinal.toString(),
        'check_in_delay_in_hours': checkInDelayInHours,
        'check_in_delay_in_minutes': checkInDelayInMinutes,
        'timestamp': DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.now()),
        'checkin': checkInTime,
        'checkout': checkOutTime,
        'empname': employeeName,
        'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
        'designation': designation,
        'workingstatus': workingstatus,
        'reason': reason ?? ''
      },
    );
    var body = json.decode(response.body);
    if (body == "null" || response.statusCode != 200) {
      return;
    }
  }

  Future<List<UserModel>?> getAllUsers({@required String? companyId}) async {
    var url =
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugGetUsers?companyid=$companyId";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List requestList = json.decode(response.body);
      Iterable<UserModel> requests = requestList.map((e) {
        return UserModel().fromJson(e);
      });
      return requests.toList();
    } else {
      return null;
    }
  }

  Future<List<AnnounceModel>> getAnnounce({@required String? companyId}) async {
    var getAnnounceUrl = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugGetAnnouncements?companyid=$companyId");

    var response = await http.get(getAnnounceUrl);
    var body = json.decode(response.body);

    if (response.statusCode == 200 && body != []) {
      List announceList = body;
      Iterable<AnnounceModel> announce = announceList.map((e) {
        return AnnounceModel().fromJson(e);
      });
      return announce.toList();
    } else {
      return [];
    }
  }

  Future<String> registerCourse(
      {@required CoursesModel? coursesModel,
      @required String? empName,
      @required String? empId,
      @required String? empPhone,
      String? hr_id,
      String? manager_id}) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugRegisterCourse");
    var response = await http.post(url, body: {
      'hrid': coursesModel!.hrId,
      'title': coursesModel.title,
      'date': coursesModel.date,
      'companyid': coursesModel.companyId,
      'venue': coursesModel.venue,
      'emp_name': empName,
      'emp_id': empId,
      'checkin': '',
      'checkout': '',
      'emp_phone': empPhone,
      'courseid': coursesModel.courseId,
      'hr_id': hr_id ?? '',
      'manager_id': manager_id ?? ''
    });
    var body = json.decode(response.body);
    return body;
  }

  Future<List<PresentCoursesModel>?> getPresentCourses({
    @required String? companyId,
    @required String? empId,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugGetPresentCourses?companyId=$companyId&empId=$empId");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      List courseList = json.decode(response.body);
      Iterable<PresentCoursesModel> courses = courseList.map((e) {
        return PresentCoursesModel().fromJson(e);
      });
      return courses.toList();
    } else {
      return null;
    }
  }

  Future<String> postServices(
      {@required String? refId,
      @required String? date,
      @required String? verify,
      @required String? companyId,
      @required String? certificateName,
      @required String? empName,
      String? manager_refid,
      String? hr_refid}) async {
    var serviceId = 'SERVICE' + DateTime.now().microsecond.toString();
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugPostServices");

    var response = await http.post(
      url,
      body: {
        'refid': refId,
        'date': date,
        'verify': verify,
        'companyid': companyId,
        'certificatename': certificateName,
        'empname': empName,
        'serviceid': serviceId,
        'hr_refid': hr_refid ?? '',
        'manager_refid': manager_refid ?? '',
      },
    );
    var body = json.decode(response.body);
    return body;
  }

  Future<List<ServicesModel>?> getServices({
    @required String? companyId,
    @required String? verify,
    @required String? refId,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugGetServicesEmployee?companyId=$companyId&refId=$refId&verify=$verify");
    var response = await http.get(url);
    var body = json.decode(response.body);
    if (body != '[]' && response.statusCode == 200) {
      List list = body;

      Iterable<ServicesModel> servicesList = list.map((e) {
        return ServicesModel().fromJson(e);
      });

      return servicesList.toList();
    } else {
      return null;
    }
  }

  Future<List<ServicesModel>?> getServicesManager({
    @required String? companyId,
    @required String? verify,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugGetServicesManager?companyId=$companyId&verify=$verify");
    var response = await http.get(url);
    var body = json.decode(response.body);
    if (body != '[]' && response.statusCode == 200) {
      List list = body;
      Iterable<ServicesModel> servicesList = list.map((e) {
        return ServicesModel().fromJson(e);
      });
      return servicesList.toList();
    } else {
      return null;
    }
  }

  Future<File> loadFile({@required String? url, @required fileName}) async {
    final response = await http.get(Uri.parse(url!));
    final bytes = response.bodyBytes;
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  Future<String> setFile(File file) async {
    var url = Uri.parse("http://faizeetech.com/pdf-upload.php");

    String value1 = "";

    var request = http.MultipartRequest('POST', url);
    request.files.add(http.MultipartFile(
        'file', file.readAsBytes().asStream(), file.lengthSync(),
        filename: file.path));
    await request.send().then((response) async {
      if (response.statusCode == 200) {
        response.stream
            .transform(utf8.decoder)
            .listen((value) {})
            .onData((data) {
          value1 = data;
        });
        return value1;
      } else {
        value1 = "Error";
        return value1;
      }
    });
    return value1;
  }

  Future<List<EmployeeLeaveRequestsModel>?> getEmployeeLeaveRequests({
    @required String? refId,
    @required String? verify,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugGetEmployeeLeaveRequests?refId=$refId&verify=$verify");
    var response = await http.get(url);
    var body = json.decode(response.body);
    if (body != '[]' && response.statusCode == 200) {
      List list = body;
      Iterable<EmployeeLeaveRequestsModel> requests = list.map((e) {
        return EmployeeLeaveRequestsModel().fromJson(e);
      });
      return requests.toList();
    } else {
      return null;
    }
  }

  Future<List<EmployeeLeaveRequestsModel>?> getManagerLeaveRequests({
    @required String? companyId,
    @required String? verify,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/hudurapp/incoming_webhook/getEmployeeLeaveRequests?companyId=$companyId&verify=$verify");
    var response = await http.get(url);
    var body = json.decode(response.body);
    if (body != '[]' && response.statusCode == 200) {
      List list = body;
      Iterable<EmployeeLeaveRequestsModel> requests = list.map((e) {
        return EmployeeLeaveRequestsModel().fromJson(e);
      });
      return requests.toList();
    } else {
      return null;
    }
  }

  Future<String> sendEmail({
    @required String? subject,
    @required String? content,
    @required String? toEmail,
  }) async {
    var url = Uri.parse(
        "http://faizeetech.com/post-mail.php?to=$toEmail&subject=$subject&content=$content");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return 'success';
    } else {
      return 'failed';
    }
  }

  Future<String> putToken({
    @required String? email,
    @required String? token,@required String? macid
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/putTokenEmployee?email=$email&token=$token&macid=$macid");
    var response = await http.put(url);
    if (response.statusCode == 200) {
      return 'success';
    } else {
      return 'failed';
    }
  }

  Future<void> postLateCheckInReason({
    @required String? subject,
    @required String? description,
    @required String? employeeId,
    @required String? companyId,
    @required String? empName,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugPostLateCheckInReason");
    var response = await http.post(
      url,
      body: {
        'empid': employeeId,
        'companyid': companyId,
        'subject': subject,
        'description': description,
        'timestamp': DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.now()),
        'empname': empName,
      },
    );
    if (response.statusCode != 200) {
      return;
    }
  }

  Future<String> removeRegisteration({
    @required String? courseId,
    @required String? empId,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/hudurapp/incoming_webhook/removeCourseEnrollment?courseId=$courseId&empId=$empId");
    var response = await http.get(url);
    print(response.body);
    var body = json.decode(response.body);
    return body;
  }

  Future<String> checkIfRegisteredCourse({
    @required String? courseId,
    @required String? empId,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugCheckIfRegisteredCourse?courseId=$courseId&empId=$empId");
    var response = await http.get(url);
    var body = json.decode(response.body);
    return body;
  }

  Future<List<EnquiryModel>?> getEnquiries({
    @required String? empEmail,
    @required String? companyId,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/getEnquiries?empEmail=$empEmail&companyId=$companyId");
    var response = await http.get(url);
    var body = json.decode(response.body);


    if (body != '[]' && response.statusCode == 200) {
      List responseList = body;

      print (responseList);
      Iterable<EnquiryModel> enquiries = responseList.map((e) {
        return EnquiryModel().fromJson(e);
      });
      return enquiries.toList();
    }
    return null;
  }

  Future<String> putAttachment({
    @required String? companyId,
    @required String? requestId,
    @required String? fileName,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/hudurapp/incoming_webhook/putAttachment?companyId=$companyId&requestId=$requestId&fileName=$fileName");
    var response = await http.put(url);
    var body = json.decode(response.body);
    if (body == 'updated') {
      return 'updated';
    } else {
      return 'failed';
    }
  }

  Future<List<EmployeeLeaveRequestsModel>?> getLeavesCount(
      {@required String? title,
      @required String? verify,
      @required String? companyid,
      @required String? refid,
      String? financial_month}) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/hudurapp/incoming_webhook/getLeaveCounts?verify=$verify&companyid=$companyid&refid=$refid&title=$title");
    var response = await http.get(url);
    print(url);
    var body = json.decode(response.body);
    if (body != '[]' && response.statusCode == 200) {
      List responseList = body;

      Iterable<EmployeeLeaveRequestsModel> adminLeaves = responseList.map((e) {
        return EmployeeLeaveRequestsModel().fromJson(e);
      });

      return adminLeaves.toList();
    } else {
      return null;
    }
  }

  Future<List<AttendanceReportModel>> getAttendenceCounts({
    @required String? empname,
    @required String? companyid,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/hudurapp/incoming_webhook/getAttendenceCounts?companyid=$companyid&empname=$empname");

    var response = await http.get(url);

    print(url);

    var body = json.decode(response.body);

    if (body != '[]' && response.statusCode == 200) {
      List responseList = body;

      print(body);

      Iterable<AttendanceReportModel> adminLeaves = responseList.map((e) {
        return AttendanceReportModel().fromJson(e);
      });

      return adminLeaves.toList();
    } else {
      return [];
    }
  }

  Future<List<EmployeeLeaveRequestsModel>> getHomeLeavesCount({
    @required String? verify,
    @required String? companyid,
    @required String? refid,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/hudurapp/incoming_webhook/getCountofLeaves?verify=$verify&companyid=$companyid&refid=$refid");
    var response = await http.get(url);
    print(url);
    var body = json.decode(response.body);
    if (body != '[]' && response.statusCode == 200) {
      List responseList = body;

      Iterable<EmployeeLeaveRequestsModel> adminLeaves = responseList.map((e) {
        return EmployeeLeaveRequestsModel().fromJson(e);
      });

      return adminLeaves.toList();
    } else {
      return [];
    }
  }

  Future<Map> getCompanyDetails({
    @required String? companyid,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/hudurapp/incoming_webhook/getCompanyDetails?companyid=$companyid");
    var response = await http.get(url);
    print(url);
    var body = json.decode(response.body);

    return body;
  }

  Future<List<ServiceDynamicModel>?> getDynamicServices({
    @required String? companyId,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/hudurapp/incoming_webhook/getDynamicServices?companyid=$companyId");
    var response = await http.get(url);
    var body = json.decode(response.body);
    if (body != '[]' && response.statusCode == 200) {
      List responseList = body;
      Iterable<ServiceDynamicModel> dynamicServices = responseList.map((e) {
        return ServiceDynamicModel().fromJson(e);
      });
      return dynamicServices.toList();
    } else {
      return null;
    }
  }

  Future<String> postDynamicServices({
    @required String? refId,
    @required String? date,
    @required String? verify,
    @required String? companyId,
    @required String? empName,
    @required String? hrRefId,
    @required String? managerRefId,
    @required String? serviceDynamicId,
  }) async {
    var serviceId = 'SERVICE' + DateTime.now().microsecond.toString();
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/hudurapp/incoming_webhook/postDynamicService");

    var response = await http.post(
      url,
      body: {
        'refid': refId,
        'date': date,
        'verify': verify,
        'companyid': companyId,
        'empname': empName,
        'serviceid': serviceId,
        'hr_refid': hrRefId,
        'manager_refid': managerRefId,
        'serdynid': serviceDynamicId,
      },
    );
    var body = json.decode(response.body);
    return body;
  }

  Future<List<DynamicServiceRequestModel>?> getDynamicServiceRequest({
    @required String? refId,
    @required String? companyId,
    @required String? verify,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/hudurapp/incoming_webhook/getDynamicServiceRequestEmployee?refid=$refId&companyid=$companyId&verify=$verify");
    var response = await http.get(url);
    var body = json.decode(response.body);
    if (body != '[]' && response.statusCode == 200) {
      List responseList = body;
      Iterable<DynamicServiceRequestModel> dynamicServices =
          responseList.map((e) {
        return DynamicServiceRequestModel().fromJson(e);
      });
      return dynamicServices.toList();
    } else {
      return null;
    }
  }

  Future<String> approveService({
    @required String? refId,
    @required String? certificateName,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugApproveService?refId=$refId&certificateName=$certificateName");
    var response = await http.put(url);
    var body = json.decode(response.body);
    if (body == 'approved') {
      return 'approved';
    } else {
      return 'failed';
    }
  }

  Future<String> rejectService({
    @required String? refId,
    @required String? certificateName,
    @required String? reason,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugRejectService?refId=$refId&certificateName=$certificateName&reason=$reason");
    var response = await http.put(url);
    var body = json.decode(response.body);
    if (body == 'rejected') {
      return 'rejected';
    } else {
      return 'failed';
    }
  }


  Future<List<ReportModel>?> getDelayReportList({
    @required String? companyid,
    @required String ?employeeName,
    @required String? fromDate,
    @required String? toDate,
    @required String? status,
  }) async {
    var getUserUrl =
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/getDelayReports?companyId=$companyid&empname=$employeeName&status=$status";

    var response = await http.get(Uri.parse(getUserUrl));

    if (response.statusCode == 200) {
      List preResponseList = json.decode(response.body);

      var requestList = preResponseList.where((element) {
        return DateFormat("yyyy-MM-dd").parse(element['date']).isAfter(
          DateFormat("yyyy-MM-dd").parse(fromDate!).subtract(
            const Duration(days: 1),
          ),
        ) &&
            DateFormat("yyyy-MM-dd").parse(element['date']).isBefore(
              DateFormat("yyyy-MM-dd").parse(toDate!).add(
                const Duration(days: 1),
              ),
            );
      });
      Iterable<ReportModel> requests = requestList.map((e) {
        return ReportModel().fromJson(e);
      });
      return requests.toList();
    } else {
      return null;
    }
  }

  Future<List<OutGeoReportModel>?> getOutGeoReport({
    @required String? fromDate,
    @required String? toDate,
    @required String? companyId,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/getOutGeoReport?companyid=$companyId");
    var response = await http.get(url);
    var body = json.decode(response.body);
    if (body != '[]' && response.statusCode == 200) {
      List preResponseList = body;

      var responseList = preResponseList.where(
            (element) {
          return DateFormat("dd-MM-yyyy")
              .parse(element['date'])
              .isAfter(DateFormat("dd-MM-yyyy").parse(fromDate!)) ||
              DateFormat("dd-MM-yyyy")
                  .parse(element['date'])
                  .isBefore(DateFormat("dd-MM-yyyy").parse(toDate!));
        },
      );

      Iterable<OutGeoReportModel> reportList = responseList.map((e) {
        return OutGeoReportModel().fromJson(e);
      });
      return reportList.toList();
    } else {
      return null;
    }
  }

  Future<List<AdminLeavesModel>?> getAdminLeavesReport({
    @required String? companyId,
    @required String? fromDate,
    @required String? toDate,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/getAdminLeaveReport?companyid=$companyId");

    var response = await http.get(url);
    var body = json.decode(response.body);
    if (body != '[]' && response.statusCode == 200) {
      List preResponseList = body;
      var responseList = preResponseList.where(
            (element) {
          return DateFormat("dd-MM-yyyy")
              .parse(element['date'])
              .isAfter(DateFormat("dd-MM-yyyy").parse(fromDate!)) ||
              DateFormat("dd-MM-yyyy")
                  .parse(element['date'])
                  .isBefore(DateFormat("dd-MM-yyyy").parse(toDate!));
        },
      );

      Iterable<AdminLeavesModel> reportList = responseList.map((e) {
        return AdminLeavesModel().fromJson(e);
      });
      return reportList.toList();
    } else {
      return null;
    }
  }

  Future<List<ServicesModel>?> getServicesReport({
    @required String? companyId,
    @required String? fromDate,
    @required String? toDate,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/getServiceReport?companyId=$companyId");
    var response = await http.get(url);
    var body = json.decode(response.body);
    if (body != '[]' && response.statusCode == 200) {
      List preResponseList = body;

      var responseList = preResponseList.where(
            (element) {
          return DateFormat("yyyy-MM-dd")
              .parse(element['date'])
              .isAfter(DateFormat("yyyy-MM-dd").parse(fromDate!)) ||
              DateFormat("yyyy-MM-dd")
                  .parse(element['date'])
                  .isBefore(DateFormat("yyyy-MM-dd").parse(toDate!));
        },
      );

      Iterable<ServicesModel> reportList = responseList.map((e) {
        return ServicesModel().fromJson(e);
      });
      return reportList.toList();
    } else {
      return null;
    }
  }

  Future<List<ReportModel>?> getDailyReport(
      String? companyid, String? date, String? status) async {
    var getUserUrl =
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/getDailyReports?companyid=$companyid";

    var response = await http.get(Uri.parse(getUserUrl));

    if (response.statusCode == 200) {
      List prelist = json.decode(response.body);

      var requestList = prelist.where((element) {
        return DateFormat("yyyy-MM-dd").parse(element['date']) ==
            DateFormat("yyyy-MM-dd").parse(date!);
      });

      Iterable<ReportModel> requests = requestList.map((e) {
        return ReportModel().fromJson(e);
      });
      return requests.toList();
    } else {
      return null;
    }
  }

  Future<String> approveBenchList({@required String? benchId}) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugApproveBenchList?benchId=$benchId");
    var response = await http.put(url);
    var body = json.decode(response.body);
    if (body == 'approved') {
      return 'approved';
    } else {
      return 'failed';
    }
  }

  Future<String> rejectBenchList(
      {@required String? benchId, @required String? reason}) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugRejectBenchList?benchId=$benchId&reason=$reason");
    var response = await http.put(url);
    var body = json.decode(response.body);
    if (body == 'rejected') {
      return 'rejected';
    } else {
      return 'failed';
    }
  }

  Future<List<BenchListModel>?> getBenchList({
    @required String? verify,
    @required String? companyId,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugGetBenchListManager?verify=$verify&companyId=$companyId");
    var response = await http.get(url);
    var body = json.decode(response.body);
    if (response.statusCode == 200 && body != '[]') {
      List requestList = body;
      Iterable<BenchListModel> benchList = requestList.map((e) {
        return BenchListModel().fromJson(e);
      });
      return benchList.toList();
    } else {
      return null;
    }
  }

  Future<UserModel?> getUserByName({@required String? name}) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/hudurapp/incoming_webhook/getUserByName?name=$name");
    var response = await http.get(url);
    var body = json.decode(response.body);

    if (body != "null" && response.statusCode == 200) {
      Map<String, dynamic> responseModel = body;
      var userModel = UserModel().fromJson(responseModel);
      return userModel;
    } else {
      return null;
    }
  }

  Future<String> approveAdminLeave({
    @required String? refId,
    @required String? companyId,
    @required String? employeeName,
    @required String? empId,
    @required String ?days,
    @required String? from,
    @required String? to,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugApproveAdminLeave");
    var response = await http.post(url, body: {
      'refid': refId,
      'companyid': companyId,
      'Name': employeeName,
      'empid': empId,
      'days': days,
      'verify': '1',
      'from': from,
      'to': to,
      'date': DateFormat('dd-MM-yyyy').format(DateTime.now()),
    });
    var body = json.decode(response.body);
    if (body == 'approved') {
      return 'approved';
    } else {
      return 'failed';
    }
  }

  Future<String> incrementAdminLeave({
    @required String? refId,
    @required String? companyId,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugIncrementAdminLeave?refId=$refId&companyId=$companyId");
    var response = await http.put(url);
    var body = json.decode(response.body);
    if (body == 'approved') {
      return 'approved';
    } else {
      return 'failed';
    }
  }

  Future<String> approveLeaveRequest({
    @required String? requestId,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/hudurapp/incoming_webhook/approveLeaveRequest?requestId=$requestId");
    var response = await http.put(url);
    var body = json.decode(response.body);
    if (body == 'approved') {
      return 'approved';
    } else {
      return 'failed';
    }
  }

  Future<String> rejectLeaveReuest({
    @required String? requestId,
    @required String? reason,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/hudurapp/incoming_webhook/rejectLeaveRequest?requestId=$requestId&reason=$reason");
    var response = await http.put(url);
    var body = json.decode(response.body);
    if (body == 'rejected') {
      return 'rejected';
    } else {
      return 'failed';
    }
  }


  Future<void> deleteAnnouncement(
      {required String companyid, required String announcementId}) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/hudurapp/incoming_webhook/deleteAnnouncement?companyid=$companyid&announcementid=$announcementId");

    var response = await http.delete(url);

    if (response.statusCode != 200) {
      Fluttertoast.showToast(
        msg: response.reasonPhrase!,
      );
    }
  }

  Future<void> postAddAnnounce({
    required String name,
    required String text,
    required String companyid,
    required String imageName,
  }) async {
    var announcementId = 'ANNOUNCE' + DateTime.now().microsecond.toString();
    var postAddAnnounceUrl = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugPostAddAnnouncements");

    var response = await http.post(postAddAnnounceUrl, body: {
      'name': name,
      'text': text,
      'timestamp': DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.now()),
      'companyid': companyid,
      'announcementid': announcementId,
      'image': imageName,
    });
    if (response.statusCode == 200) {
      return;
    } else {
      Fluttertoast.showToast(msg: response.body);
    }
  }

  Future<String> setImage(File file) async {
    var url = Uri.parse("http://faizeetech.com/pdf-upload.php");

    String value1 = "";

    var request = http.MultipartRequest('POST', url);
    request.files.add(http.MultipartFile(
        'file', file.readAsBytes().asStream(), file.lengthSync(),
        filename: file.path));
    await request.send().then((response) async {
      if (response.statusCode == 200) {
        response.stream
            .transform(utf8.decoder)
            .listen((value) {})
            .onData((data) {
          value1 = data;
        });
        return value1;
      } else {
        value1 = "Error";
        return value1;
      }
    });
    return value1;
  }



  Future<void> editAnnouncement({
    required String name,
    required String text,
    required String companyid,
    required String imageName,
    required String announcementId,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/hudurapp/incoming_webhook/editAnnouncement?announcementid=$announcementId&companyid=$companyid");

    var response = await http.put(url, body: {
      'name': name,
      'text': text,
      'image': imageName,
    });
    Fluttertoast.showToast(msg: response.body);
  }

  Future<List<EnquiryModel>?> getAllEnquiries({
    required String hrId,
    required String companyId,
  }) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/hudur/incoming_webhook/getAllEnquiries?hrId=$hrId&companyId=$companyId");
    var response = await http.get(url);
    var body = json.decode(response.body);
    print('hrenquiry = ${body} ${response.statusCode}');
    if (body != '[]' && response.statusCode == 200) {
      List responseList = body;
      Iterable<EnquiryModel> enquiries = responseList.map((e) {
        return EnquiryModel().fromJson(e);
      });
      return enquiries.toList();
    } else {
      return null;
    }
  }

  Future<UserModel?> getUserByRefId({required String refId}) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/getUserByRefId?refId=$refId");
    var response = await http.get(url);
    var body = json.decode(response.body);

    if (body != "null" && response.statusCode == 200) {
      Map<String, dynamic> responseModel = body;
      var userModel = UserModel().fromJson(responseModel);
      return userModel;
    } else {
      return null;
    }
  }

  Future<String> putCertificateName(
      {required String companyId,
        required String refId,
        required String fileName,
        String? date,
        String? certificatename}) async {
    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugPutCertificateName?companyId=$companyId&refId=$refId&fileName=$fileName&certificatename=$certificatename&date=$date");
    var response = await http.put(url);
    var body = json.decode(response.body);
    if (body == 'updated') {
      return 'updated';
    } else {
      return 'failed';
    }
  }

  Future<List<CoursesModel>?> getHRCourses({
    required String companyid,
    required String hrId,
  }) async {
    var getAnnounceUrl = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugGetCoursesHr?companyid=$companyid&hrid=$hrId");

    var response = await http.get(getAnnounceUrl);
    if (response.statusCode == 200) {
      List announceList = json.decode(response.body);
      Iterable<CoursesModel> announce = announceList.map((e) {
        return CoursesModel().fromJson(e);
      });
      return announce.toList();
    } else {
      return null;
    }
  }

  Future<List<CoursesModel>?> getCoursesDetails({
    required String companyid,
    required String courseId,
  }) async {
    var getAnnounceUrl = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/getCourseDetail?companyid=$companyid&courseid=$courseId");
    var response = await http.get(getAnnounceUrl);

    if (response.statusCode == 200) {
      List announceList = json.decode(response.body);
      print('coarselist  = $announceList');
      Iterable<CoursesModel> announce = announceList.map((e) {
        return CoursesModel().fromJson(e);
      });
      return announce.toList();
    } else {
      return null;
    }
  }

  Future postCourses({
    required CoursesModel coursesModel,
    required String hrName,
  }) async {
    var courseId = 'COURSE' + DateTime.now().microsecond.toString();

    var url = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugPostAddHrCourses");

    var response = await http.post(url, body: {
      "title": coursesModel.title,
      "date": coursesModel.date,
      "companyid": coursesModel.companyId,
      "venue": coursesModel.venue,
      "hrid": coursesModel.hrId,
      'courseid': courseId,
      'hrname': hrName,
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future deleteCourses(String companyid, String name) async {
    var getAnnounceUrl = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/deleteCourses?companyid=$companyid&title=$name");

    var response = await http.get(getAnnounceUrl);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future updateCheckinCourses(CoursesModel coursesModel) async {
    var getAnnounceUrl = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugPresentHrCourses");

    var a={
      "companyid": coursesModel.companyId,
    "empid": coursesModel.empid,
    'courseid': coursesModel.courseId,
    "checkin": coursesModel.checkin,
    };

    print('update rmp = $a');

    var response = await http.put(getAnnounceUrl, body: {
      "companyid": coursesModel.companyId,
      "empid": coursesModel.empid,
      'courseid': coursesModel.courseId,
      "checkin": coursesModel.checkin,
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }


  Future updateCheckoutCourses(CoursesModel coursesModel) async {
    var getAnnounceUrl = Uri.parse(
        "https://us-east-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/application-0-ffegf/service/getuser/incoming_webhook/debugPresentHrCourses");

    var response = await http.put(getAnnounceUrl, body: {
      "companyid": coursesModel.companyId,
      "empid": coursesModel.empid,
      'courseid': coursesModel.courseId,
      "checkout": coursesModel.checkout,
    });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<String?> sendMacRequest(UserModel userModel) async {
    var getAnnounceUrl = Uri.parse(
        "https://us-east-1.aws.data.mongodb-api.com/app/application-0-ffegf/endpoint/hudurapp/sendMacRequest");

    var response = await http.post(getAnnounceUrl,
    body: {
      "refid":userModel.refId,
      "companyid":userModel.companyId,
      "empname":userModel.name,
      "hr_refid":userModel.hrId ?? userModel.managerid,
      "verify":"0",
      "manager_refid":userModel.managerid,
      "requestid":DateTime.now().millisecondsSinceEpoch.toString(),
      "date":DateFormat('yyyy-MM-dd').format(DateTime.now()),
    }
    );

    if (response.statusCode == 200) {

      var newResponse = jsonDecode(response.body);

      return newResponse;
    } else {
      return null;
    }
  }

}
