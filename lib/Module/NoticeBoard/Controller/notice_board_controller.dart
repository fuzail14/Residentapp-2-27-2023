import 'dart:convert';

import 'package:get/get.dart';

import '../../../Constants/api_routes.dart';
import '../../HomeScreen/Model/residents.dart';
import '../../Login/Model/User.dart';

import 'package:http/http.dart' as Http;

import '../Model/notice_board_model.dart';

class NoticeBoardController extends GetxController {
  var data = Get.arguments;

  late final User userdata;
  late final Residents resident;
  List<NoticeBoardModel> noticeBoardList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userdata = data[0];
    resident = data[1];
  }

  Future<List<NoticeBoardModel>> viewNoticeBoardApi(
      int subadminid, String token) async {
    

    final response = await Http.get(
      Uri.parse(Api.viewAllNotices + "/" + subadminid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      

      noticeBoardList = (data["data"] as List)
          .map((e) => NoticeBoardModel(
                id: e['id'],
                noticetitle: e['noticetitle'],
                noticedetail: e['noticedetail'],
                startdate: e['startdate'],
                enddate: e['enddate'],
                starttime: e['starttime'],
                endtime: e['endtime'],
                status: e['status'],
                subadminid: e['subadminid'],
              ))
          .toList();

      return noticeBoardList;
      
    }
    return noticeBoardList;
  }


}
