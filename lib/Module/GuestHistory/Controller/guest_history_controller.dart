import 'dart:convert';
import 'dart:ui';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as Http;
import 'package:get/get.dart';
import 'package:userapp/Module/GuestHistory/Model/PreApproveEntry.dart';
import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';
class GuestHistoryController extends GetxController
{
  List<Color> pinkcard =[
    HexColor('#FF6188'),
    HexColor('#FFB199'),
  ];

  List<Color> bluecard =[
    HexColor('#4481EB'),
    HexColor('#04BEFE'),
  ];

  List<Color> greencard =[
    HexColor('#D6FF94'),
    HexColor('#3DC24B'),
  ];

  var user = Get.arguments;
  late final User userdata;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userdata = user;
    print(userdata);
  }


  Future<PreApproveEntry> preapproveEntryHistoriesApi(
      {required int userid,required String token}) async {
    print("${userid.toString()}");
    print(token);

    final response = await Http.get(
      Uri.parse(Api.preapproveentryhistories + "/" + userid.toString() ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    ;

    if (response.statusCode == 200) {
      return PreApproveEntry.fromJson(data);
    }

    return PreApproveEntry.fromJson(data);
  }






}


enum CardColors {
  pinkcard,
  bluecard,
  greencard

}