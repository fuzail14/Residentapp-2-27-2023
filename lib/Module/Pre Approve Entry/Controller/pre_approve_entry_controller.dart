import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';
import '../../HomeScreen/Model/residents.dart';
import '../../Login/Model/User.dart';
import '../Model/PreApproveEntry.dart';

class PreApproveEntryController extends GetxController {
  late final User userdata;
  late final Residents resident;
  var data = Get.arguments;
  late Future<PreApproveEntry> apiData;
  TextEditingController searchController = TextEditingController();
  String? query;
  Timer? debouncer;
  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    debouncer?.cancel();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userdata = data[0];
    resident = data[1];
    refreshApi(userId: userdata.userId!, token: userdata.bearerToken!);
  }

  Future<PreApproveEntry> viewPreApproveEntryReportsApi(
      int userid, String token) async {
    print("token $token");

    final response = await Http.get(
      Uri.parse(Api.viewPreApproveEntryReports + "/" + userid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      return PreApproveEntry.fromJson(data);
    }
    return PreApproveEntry.fromJson(data);
    ;
  }

  Future<PreApproveEntry> searchPreApproveEntry(
      {required String? query, required String token, required userId}) async {
    final response = await Http.post(
      Uri.parse(Api.searchPreapproveEntry),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body:
          jsonEncode(<String, dynamic>{"userid": userId, "searchquery": query}),
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return PreApproveEntry.fromJson(jsonDecode(response.body.toString()));
    } else {
      throw Exception("Failed to Search");
    }
  }

  searchData({required userId, required token, required query}) {
    apiData = searchPreApproveEntry(token: token, userId: userId, query: query);
    update();
  }

  refreshApi({
    required userId,
    required token,
  }) {
    apiData = viewPreApproveEntryReportsApi(userId, token);
    update();
  }
}
