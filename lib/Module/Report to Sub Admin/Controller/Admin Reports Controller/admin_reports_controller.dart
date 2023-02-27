import 'dart:convert';
import 'package:get/get.dart';
import 'package:userapp/Constants/constants.dart';
import 'package:userapp/Module/Report%20to%20Sub%20Admin/Model/Reports.dart';
import '../../../../Constants/api_routes.dart';
import '../../../HomeScreen/Model/residents.dart';
import '../../../Login/Model/User.dart';
import 'package:http/http.dart' as Http;

class AdminReportsController extends GetxController {
  var data = Get.arguments;
   Residents? resident;
  late final User user;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    user = data[0];
    resident=data[1];

  }

  adminReportsApi(int userid, String token) async {
    print("token $token");

    final response = await Http.get(
      Uri.parse(Api.admin_reports + "/" + userid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return Reports.fromJson(data);
    }
    return Reports.fromJson(data);
    ;
  }

  ProblemSolvedButtonApi(int reportid, int userid, String token) async {
    print('id $reportid');
    print('userid $userid');

    print('token $token');

    final uri = Uri.parse(Api.updatereportstatus);
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token"
    };
    Map<String, dynamic> body = {
      "id": reportid,
      "userid": userid,
      "status": 4,
      "statusdescription": 'completed',
    };
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    Http.Response response = await Http.post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      Get.snackbar('Message:', 'Report Completed',
          snackPosition: SnackPosition.BOTTOM,
          showProgressIndicator: true,
          progressIndicatorBackgroundColor: primaryColor);

      adminReportsApi(user.userid!, user.bearerToken!);

      update();
    }
  }
}
