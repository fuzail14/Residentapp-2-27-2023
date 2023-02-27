import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Module/Family%20Member/View%20Family%20Member/Controller/view_family_member_controller.dart';
import 'package:userapp/Routes/set_routes.dart';
import '../../../../Constants/api_routes.dart';
import '../../../../Constants/constants.dart';
import '../../../../Widgets/My Back Button/my_back_button.dart';

class ViewFamilyMember extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewFamilyMemberController>(
      init: ViewFamilyMemberController(),
      builder: (controller) => SafeArea(
        child: WillPopScope(
          onWillPop: () async{

          await  Get.offAndToNamed(homescreen, arguments: controller.userdata);

            return false;
          },
          child: Scaffold(
            backgroundColor: HexColor('#F5F5F5'),
            body:    Column(
              children: [
                MyBackButton(text: 'Family Members',onTap: (){

                  Get.offAndToNamed(homescreen, arguments: controller.userdata);
                },),
                SizedBox(height: 20,),
                Expanded(
                  child: FutureBuilder(
                      future: controller.viewResidentsApi(controller.resident.subadminid!, controller.userdata.userid!, controller.userdata.bearerToken!),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data.data != null && snapshot.data.data!.length != 0) {
                            return SizedBox(height: 630  ,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {


                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          24,16,24,0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/cardbackground.jpeg',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(17),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  189, 224, 224, 223),
                                              spreadRadius: 5,

                                              blurRadius: 9,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: HexColor('#FFFFFF'),
                                        ),
                                        height: 120,
                                        child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 14, left: 8),
                                                    child: Container(
                                                      width: 70.4,
                                                      height: 64,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  imageBaseUrl+    snapshot
                                                                      .data!.data[
                                                                  index]
                                                                      .image
                                                                      .toString()),
                                                              fit: BoxFit
                                                                  .cover),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              7)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 18),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text(
                                                          snapshot.data.data[index].firstname+" "+
                                                              snapshot.data.data[index].lastname,
                                                          style: TextStyle(
                                                              fontStyle:
                                                              FontStyle
                                                                  .normal,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              fontSize: 16,
                                                              color: HexColor(
                                                                  '#404345')),
                                                        ),
                                                        Text(
                                                          snapshot.data.data[index].firstname+" "+    snapshot.data.data[index].lastname,
                                                          style: TextStyle(
                                                            fontStyle:
                                                            FontStyle
                                                                .normal,
                                                            fontWeight:
                                                            FontWeight
                                                                .w200,
                                                            fontSize: 16,
                                                          ),
                                                          overflow:
                                                          TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),

                                            ]),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: snapshot.data.data.length
                              ),
                            );
                          } else {
                            return Center(
                                child: Text(
                                  'No Family Member',
                                  style: GoogleFonts.ubuntu(
                                      color: HexColor('#404345'),
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: 0.0015,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ));
                          }
                        } else if (snapshot.hasError) {
                          return Icon(Icons.error_outline);
                        } else {
                          return Center(child: CircularProgressIndicator(color: primaryColor,));
                        }
                      }),
                ),
              ],
            ),
            floatingActionButton: IconButton(
                padding: EdgeInsets.only(top: 85),
                iconSize: MediaQuery.of(context).size.height * 0.065,
                icon: SvgPicture.asset('assets/floatingbutton.svg'),
                onPressed: () {
                  Get.offAndToNamed(addfamilymember,arguments: [controller.userdata,controller.resident]);
                }),   // floatingActionButton: IconButton(

          ),
        ),
      ),
    );;
  }
}
