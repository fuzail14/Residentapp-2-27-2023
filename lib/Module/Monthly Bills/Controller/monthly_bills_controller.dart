import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';
import '../../HomeScreen/Model/residents.dart';
import '../../Login/Model/User.dart';
import '../Model/BillModel.dart';

class MonthlyBillsController extends GetxController {
  late DateTime dueDate;
  var isBillLate = false;

  var data = Get.arguments;
  late final User userdata;
  late final Residents resident;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userdata = data[0];
    resident = data[1];
  }

  @override
  void dispose() {
    super.dispose();
  }

  isBillLateStatus({required isBillLates}) {
    isBillLate = isBillLates;
    update();
  }

  apiHits({required userid, required token}) async {
    await monthlyBillsApi(userid: userid, token: token);
    update();
  }

  Future<BillModel> monthlyBillsApi(
      {required int userid, required String token}) async {
    final response = await Http.get(
      Uri.parse(Api.monthlyBills + "/" + userid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return BillModel.fromJson(data);
    } else {
      throw Exception("Failed to load Bill");
    }
  }

  payBillApi({required int id, required String token}) async {
    print("${id.toString()}");
    print(token);

    final response = await Http.get(
      Uri.parse(Api.payBill + "/" + id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      Get.snackbar('Success', data['message']);
      update();
    } else if (response.statusCode == 500) {
      Get.snackbar('Warning', 'Something went Wrong');
      update();
    }
  }

  toDateFormat({required dateString}) {
    DateTime date = DateTime.parse(dateString.toString());

    return date;
  }

  Future monthlyBillUpdateOverDueDateStatusApi(
      {required String token, required id}) async {
    final response = await Http.post(
      Uri.parse(Api.monthlyBillUpdateOverDueDateStatus),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "id": id,
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      print(response.statusCode);

      // await monthlyBillsApi(
      //     userid: resident.residentid!, token: userdata.bearerToken!);
      // update();
    } else {
      Get.snackbar("Failed to Update Bill", "");
    }
  }
}
