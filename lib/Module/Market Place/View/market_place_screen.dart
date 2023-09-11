import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:userapp/Constants/constants.dart';
import 'package:userapp/Widgets/Empty%20List/empty_list.dart';

import '../../../Constants/api_routes.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/Loader/loader.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../Chat Availbility/Model/ChatNeighbours.dart';
import '../../Chat Availbility/Model/ChatRoomModel.dart';
import '../../Chat Screens/Neighbour Chat Screen/Controller/neighbour_chat_screen_controller.dart';
import '../Controller/market_place_controller.dart';
import '../Model/MarketPlace.dart' as marketplace;

class MarketPlaceScreen extends GetView {
  final MarketPlaceController controller = Get.put(MarketPlaceController());

  @override
  Widget build(BuildContext context) {
    print("build");
    return DefaultTabController(
      length: 2,
      child: SafeArea(
          child: WillPopScope(
        onWillPop: () async {
          await Get.offNamed(homescreen, arguments: controller.userdata);
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              MyBackButton(
                text: 'Market Place',
                onTap: () {
                  Get.offNamed(homescreen, arguments: controller.userdata);
                },
              ),
              62.h.ph,
              TabBar(
                controller: controller.tabController,
                padding: EdgeInsets.symmetric(horizontal: 90),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: ShapeDecoration(
                  color: primaryColor,
                  shape: RoundedRectangleBorder(
                      // side: BorderSide(color: HexColor('#E1E3E6'), width: 0),
                      borderRadius: BorderRadius.circular(16.r)),
                ),
                tabs: [
                  Obx(() {
                    return buildBuySellTab(
                        imageUrl: 'assets/market_place_buy_icon.svg',
                        textColor: () {
                          if (controller.tabController.index == 0) {
                            return Colors.white;
                          } else if (controller.tabController.index == 1) {
                            return Colors.black;
                          } else {
                            return primaryColor;
                          }
                        }(),
                        heading: 'Buy',
                        imageColor: () {
                          if (controller.selectedIndex == 1) {
                            return primaryColor;
                          } else if (controller.selectedIndex == 0) {
                            return Colors.white;
                          } else {
                            return primaryColor;
                          }
                        }());
                  }),
                  Obx(() {
                    return buildBuySellTab(
                      imageUrl: 'assets/market_place_sell_icon.svg',
                      textColor: () {
                        if (controller.selectedIndex == 1) {
                          return Colors.white;
                        } else if (controller.selectedIndex == 0) {
                          return Colors.black;
                        } else {
                          return primaryColor;
                        }
                      }(),
                      heading: 'Sell',
                      imageColor: () {
                        if (controller.selectedIndex == 1) {
                          return Colors.white;
                        } else if (controller.selectedIndex == 0) {
                          return primaryColor;
                        } else {
                          return primaryColor;
                        }
                      }(),
                    );
                  })
                ],
              ),
              26.h.ph,
              Expanded(
                  child: TabBarView(
                controller: controller.tabController,
                children: [
                  FutureBuilder(
                      future: controller.viewProductFutureData,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if ((snapshot.data as List).isNotEmpty) {
                            return Obx(() {
                              return ListView.builder(
                                itemCount: controller.list.value.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return MarketPlaceCard(
                                      list: controller.list.value[index]);
                                },
                              );
                            });
                          } else {
                            return EmptyList(
                              name: 'No Items Found',
                            );
                          }
                        } else if (snapshot.hasError) {
                          return Icon(Icons.error_outline);
                        } else {
                          return Loader();
                        }
                      }),
                  FutureBuilder(
                      future: controller.sellProductFutureData,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if ((snapshot.data as List).isNotEmpty) {
                            return Column(
                              children: [
                                Expanded(
                                  child: Obx(() {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.list2.value.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return MarketPlaceCard(
                                            list:
                                                controller.list2.value[index]);
                                      },
                                    );
                                  }),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 40.w,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Get.offNamed(sellProductsScreen,
                                            arguments: [
                                              controller.userdata,
                                              controller.resident
                                            ]);
                                      },
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 36.w,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.r))),
                                    ),
                                  ),
                                ),
                                10.h.ph,
                              ],
                            );
                          } else {
                            return Column(
                              children: [
                                Spacer(),
                                Center(
                                  child: EmptyList(
                                    name: 'No Items Found',
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 40.w,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Get.offNamed(sellProductsScreen,
                                            arguments: [
                                              controller.userdata,
                                              controller.resident
                                            ]);
                                      },
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 36.w,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.r))),
                                    ),
                                  ),
                                ),
                                20.h.ph,
                              ],
                            );
                          }
                        } else if (snapshot.hasError) {
                          return Icon(Icons.error_outline);
                        } else {
                          return Loader();
                        }
                      }),
                ],
              ))
            ],
          ),
        ),
      )),
    );
  }

  Widget MarketPlaceCard({required marketplace.Data list}) {
    return Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: SizedBox(
            width: 375.w,
            height: 220.w,
            child: Card(
                elevation: 0,
                color: HexColor('#F3F4F5'),
                child: Column(
                  children: [
                    22.h.ph,
                    GestureDetector(
                      onTap: () async {
                        Get.toNamed(marketPlaceProductDetails, arguments: [
                          controller.userdata,
                          controller.resident,
                          list
                        ]);
                      },
                      child: buildProductCard(
                          controller: controller,
                          residentId: list.residentid,
                          id: list.id,
                          image: list.images!.first.images.toString(),
                          price: list.productprice.toString(),
                          name: list.productname.toString(),
                          description: list.description.toString(),
                          date: list.createdAt.toString()),
                    ),
                    16.h.ph,
                    if (controller.userdata.userId != list.residentid)
                      buildProfileCard(
                        onChatTap: () async {
                          ChatNeighbours userInfo =
                              await controller.productSellerInfoApi(
                                  residentid: list.residentid!,
                                  token: controller.userdata.bearerToken!);
                          final ChatRoomModel chatRoomModel =
                              await controller.createChatRoomApi(
                                  token: controller.userdata.bearerToken!,
                                  userid: controller.userdata.userId!,
                                  chatuserid: list.residentid!);

                          Get.offNamed(neighbourchatscreen, arguments: [
                            controller.userdata, //Login User
                            controller.resident, // Resident Details
                            userInfo.data!.first,
                            chatRoomModel.data!.first.id,
                            ChatTypes.MarketPlaceChat.toString()
                                .split('.')
                                .last, // Chat User
                          ]);
                        },
                        onCallTap: () async {
                          controller.uri = Uri.parse("tel://${list.contact}");

                          try {
                            await launchUrl(controller.uri!);
                            controller.uri = null;
                          } catch (e) {
                            myToast(msg: e.toString(), isNegative: true);
                          }
                        },
                        image: list.users!.image.toString(),
                        residentType: list.residents!.residenttype.toString(),
                        name: list.users!.firstname.toString() +
                            " " +
                            list.users!.lastname.toString(),
                      )
                    else
                      Container()
                  ],
                ))));
  }

  Widget buildBuySellTab({
    required String imageUrl,
    required String heading,
    required Color textColor,
    required Color imageColor,
  }) {
    return SizedBox(
      width: 73.w,
      height: 71.w,
      child: Tab(
        child: Container(
          child: Column(
            children: [
              12.h.ph,
              SvgPicture.asset(imageUrl, color: imageColor),
              8.h.ph,
              Text(
                heading,
                style: GoogleFonts.quicksand(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: textColor),
              )
            ],
          ),
          width: 73.w,
          height: 71.w,
          decoration: BoxDecoration(
            border: Border.all(color: HexColor('#E1E3E6')),
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ),
    );
  }
}

class buildProductCard extends GetView {
  final String? image;
  final String? price;
  final String? name;
  final String? description;
  final String? date;
  final int? id;
  final int? residentId;
  final MarketPlaceController controller;

  const buildProductCard(
      {super.key,
      required this.image,
      required this.residentId,
      required this.id,
      required this.price,
      required this.name,
      required this.description,
      required this.date,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328.w,
      height: 125.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: HexColor('#FFFFFF')),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: 114.w,
                height: 145.w,
                child: FittedBox(
                  child: CachedNetworkImage(
                    width: 114.w,
                    fit: BoxFit.fitHeight,
                    imageUrl: Api.imageBaseUrl + image!,
                    placeholder: (context, url) => Column(
                      children: [
                        CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      ],
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                decoration: BoxDecoration(
                    color: HexColor('#F3F4F5'),
                    borderRadius: BorderRadius.circular(10.r)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            price ?? "",
                            style: GoogleFonts.quicksand(
                                color: HexColor('#0D0B0C'),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (controller.userdata.userId == residentId)
                          Obx(() {
                            return PopupMenuButton(
                                initialValue: controller.status.value,
                                onOpened: () {},
                                onSelected: (val) {
                                  controller.status.value = val.toString();

                                  print(id.toString());
                                  print(controller.status.value.toString());

                                  controller.productStatus(
                                      token: controller.userdata.bearerToken!,
                                      id: id!,
                                      status:
                                          controller.status.value.toString());
                                },
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                        value: 'sold',
                                        child: Text('Marked as Sold')),
                                    PopupMenuItem(
                                        value: 'forsale',
                                        child: Text('Marked as For Sale')),
                                    PopupMenuItem(
                                      value: 'unavailable',
                                      child: Text('Marked as Unavailable'),
                                      onTap: () {},
                                    ),
                                  ];
                                });
                          })
                        else
                          Container()
                      ],
                    ),
                    12.h.ph,
                    Expanded(
                      child: Text(
                        name ?? "",
                        style: GoogleFonts.quicksand(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#0D0B0C')),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ),
                    // Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            description ?? "",
                            style: GoogleFonts.quicksand(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: HexColor('#0D0B0C')),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          convertTimestampDayMonth(date!) ?? "",
                          style: GoogleFonts.quicksand(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#6A7380')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            10.w.pw,
          ],
        ),
      ),
    );
  }
}

class buildProfileCard extends GetView {
  final String? image;
  final String? name;
  final String? residentType;
  final void Function()? onChatTap;
  final void Function()? onCallTap;

  const buildProfileCard(
      {super.key,
      required this.image,
      required this.name,
      required this.residentType,
      required this.onChatTap,
      required this.onCallTap});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.only(left: 24.w),
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            width: 32.w,
            height: 32.w,
            child: CachedNetworkImage(
              width: 114.w,
              fit: BoxFit.fitHeight,
              imageUrl: Api.imageBaseUrl + image.toString(),
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
          8.w.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? "",
                  style: GoogleFonts.quicksand(
                      color: HexColor('#0D0B0C'),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  residentType ?? "",
                  style: GoogleFonts.quicksand(
                      color: HexColor('#6A7380'),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onChatTap,
            child: Image.asset(
              'assets/market_place_chat.png',
              width: 30.w,
              height: 30.w,
            ),
          ),
          13.w.pw,
          GestureDetector(
            onTap: onCallTap,
            child: Image.asset(
              'assets/market_place_call.png',
              width: 25.w,
              height: 25.w,
            ),
          ),
          38.w.pw
        ]),
      ),
    );
  }
}
