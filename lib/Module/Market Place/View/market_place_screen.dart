import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Constants/api_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Floating Action Button/my_floating_action_button.dart';
import '../Controller/market_place_controller.dart';

class MarketPlaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MarketPlaceController>(
          init: MarketPlaceController(),
          builder: (controller) {
            return DefaultTabController(
              length: 2,
              child: Scaffold(
                body: Column(
                  children: [
                    MyBackButton(
                      text: 'Market Place',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: primaryColor,
                      tabs: [
                        Tab(
                          child: Text('Buy',
                              style: TextStyle(color: primaryColor)),
                        ),
                        Tab(
                          child: Text('Sell',
                              style: TextStyle(color: primaryColor)),
                        ),
                      ],
                      labelColor: Colors.white,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          //Buy
                          FutureBuilder(
                              future: controller.viewProducts(
                                  societyid: controller.resident.societyid!,
                                  token: controller.userdata.bearerToken!),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshot.data.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      controller.snapshotData =
                                          snapshot.data.data[index];

                                      return Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            14, 13, 18, 0),
                                        child: SizedBox(
                                          height: 100,
                                          width: 343,
                                          child: Card(
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: Container(
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Image(
                                                      image: NetworkImage(
                                                          Api.imageBaseUrl +
                                                              controller
                                                                  .snapshotData
                                                                  .images
                                                                  .toString()),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 13, top: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          controller
                                                              .snapshotData
                                                              .productname
                                                              .toString(),
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#606470'),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        SizedBox(
                                                          height: 6,
                                                        ),
                                                        Text(
                                                          controller
                                                              .snapshotData
                                                              .description
                                                              .toString(),
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#A5AAB7'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 15, top: 52),
                                                    child: Row(
                                                      children: [
                                                        Text('price'),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          controller
                                                              .snapshotData
                                                              .productprice
                                                              .toString(),
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#A5AAB7'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 15, top: 72),
                                                    child: SizedBox(
                                                      width: 150,
                                                      child: ListView.builder(
                                                        shrinkWrap: true,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemCount: controller
                                                            .snapshotData
                                                            .resident
                                                            .length,
                                                        itemBuilder: (context,
                                                            resIndex) {
                                                          controller
                                                                  .residentData =
                                                              controller
                                                                      .snapshotData
                                                                      .resident[
                                                                  resIndex];
                                                          return Row(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  controller.makeACall(
                                                                      controller
                                                                          .residentData
                                                                          .mobileno);
                                                                },
                                                                child: Icon(
                                                                  Icons.phone,
                                                                  size: 16,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 5),
                                                              Text(
                                                                controller
                                                                    .residentData
                                                                    .mobileno,
                                                                style: GoogleFonts.ubuntu(
                                                                    color: HexColor(
                                                                        '#A5AAB7'),
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Icon(Icons.error_outline);
                                } else {
                                  return CircularProgressIndicator();
                                }
                              }),

                          //Sell

                          ListView(
                            children: [
                              Container(
                                height: 630,
                                child: FutureBuilder(
                                    future: controller.viewSellProductsResidnet(
                                        residentid:
                                            controller.resident.residentid!,
                                        token:
                                            controller.userdata.bearerToken!),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.builder(
                                          itemCount: snapshot.data.data.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      14, 13, 18, 0),
                                              child: SizedBox(
                                                height: 84,
                                                width: 343,
                                                child: Card(
                                                  elevation: 2,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  child: Container(
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Image(
                                                            image: NetworkImage(Api
                                                                    .imageBaseUrl +
                                                                snapshot
                                                                    .data
                                                                    .data[index]
                                                                    .images
                                                                    .toString()),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 13,
                                                                  top: 10),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                snapshot
                                                                    .data
                                                                    .data[index]
                                                                    .productname
                                                                    .toString(),
                                                                style: GoogleFonts.ubuntu(
                                                                    color: HexColor(
                                                                        '#606470'),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              SizedBox(
                                                                height: 6,
                                                              ),
                                                              Text(
                                                                snapshot
                                                                    .data
                                                                    .data[index]
                                                                    .description
                                                                    .toString(),
                                                                style: GoogleFonts.ubuntu(
                                                                    color: HexColor(
                                                                        '#A5AAB7'),
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  top: 52),
                                                          child: Row(
                                                            children: [
                                                              Text('price'),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                snapshot
                                                                    .data
                                                                    .data[index]
                                                                    .productprice
                                                                    .toString(),
                                                                style: GoogleFonts.ubuntu(
                                                                    color: HexColor(
                                                                        '#A5AAB7'),
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      } else if (snapshot.hasError) {
                                        return Icon(Icons.error_outline);
                                      } else {
                                        return CircularProgressIndicator();
                                      }
                                    }),
                              ),
                              MyFloatingActionButton(onPressed: () {
                                Get.offNamed(sellProductsScreen, arguments: [
                                  controller.userdata,
                                  controller.resident
                                ]);
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
