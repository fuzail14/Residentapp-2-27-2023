import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Module/HomeScreen/Controller/home_screen_controller.dart';

import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/Loader/loader.dart';
import '../Model/DiscussionRoomModel.dart';
// import 'package:jazzcash_flutter/jazzcash_flutter.dart';

class HomeScreen extends GetView {
  final HomeScreenController _homeScreenController =
      Get.put(HomeScreenController());
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      HexColor('#FB7712'),
                      HexColor('#FF9900'),
                    ])),
                    child: Stack(
                      children: [
                        Text(
                          "Resident App",
                          style: GoogleFonts.ubuntu(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                              fontSize: 15),
                        ),
                      ],
                    )),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: primaryColor,
                  ),
                  title: Text("Logout"),
                  onTap: () {
                    _homeScreenController.logoutApi(
                        token: _homeScreenController.user.bearerToken!);
                  },
                ),
              ],
            ),
          ),
          body:
              // GridView.builder(
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2, // Number of columns in the grid
              //       childAspectRatio: 2.4,
              //       crossAxisSpacing: 12,
              //       mainAxisSpacing: 12
              //
              //       // Ensures a square grid item
              //       ),
              //   itemCount: _homeScreenController
              //       .servicesLi.length, // Total number of grid items
              //   itemBuilder: (BuildContext context, int index) {
              //     return HomeScreenCard(
              //         heading:
              //             _homeScreenController.servicesLi[index].heading.toString(),
              //         description: _homeScreenController.servicesLi[index].description,
              //         iconPath: _homeScreenController.servicesLi[index].iconPath,
              //         type: _homeScreenController.servicesLi[index].type);
              //   },
              // ),

              SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * 0.038,
                        top: MediaQuery.of(context).size.width * 0.078),
                    child: Row(
                      children: [
                        IconButton(
                            icon: SvgPicture.asset(
                              'assets/drawer.svg',
                            ),
                            onPressed: () {
                              _scaffoldKey.currentState!.openDrawer();
                            }),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.022,
                              right: MediaQuery.of(context).size.width * 0.022),
                          child: Text(
                            'Home',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder(
                      future:
                          //Family member Check
                          _homeScreenController.user.roleId == 5
                              ? _homeScreenController.loginResidentDetails(
                                  userid:
                                      _homeScreenController.user.residentid!,
                                  token:
                                      _homeScreenController.user.bearerToken!)
                              : // Login user Resident
                              _homeScreenController.loginResidentDetails(
                                  userid: _homeScreenController.user.userId!,
                                  token:
                                      _homeScreenController.user.bearerToken!),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data.status == 0
                              ? SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                      ),
                                      Center(
                                          child: SvgPicture.asset(
                                        'assets/verification.svg',
                                        width: 300,
                                      )),
                                      Text(
                                        "please be patient !",
                                        style: GoogleFonts.ubuntu(
                                            color: HexColor('#A5AAB7'),
                                            fontSize: 38,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "You are under Verification Process!",
                                        style: GoogleFonts.ubuntu(
                                            color: HexColor('#A5AAB7'),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          35, 30, 27, 23),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 259,
                                                  height: 99,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          HexColor('#FEFBF2')),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          8, 10, 137, 23),
                                                  child: Text(
                                                    "For any sevice support",
                                                    style: GoogleFonts.ubuntu(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 10,
                                                        color: HexColor(
                                                            '#B5B3B6')),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          8, 20, 137, 23),
                                                  child: Text(
                                                    "call us on xxx-xxxxxx",
                                                    style: GoogleFonts.ubuntu(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                        color: HexColor(
                                                            '#CF6058')),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          8, 42, 237, 42),
                                                  child: Text(
                                                    "Or",
                                                    style: GoogleFonts.inter(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                        color: HexColor(
                                                            '#000000')),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          131, 20, 0, 0),
                                                  child: SvgPicture.asset(
                                                    "assets/home_vector.svg",
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          8, 63, 163, 10),
                                                  child: Text(
                                                    "Email usAbc@gmail.com",
                                                    style: GoogleFonts.ubuntu(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                        color: HexColor(
                                                            '#CF6058')),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    HomeHeading(text: 'Services'),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          35, 8, 21, 0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 140,
                                            height: 65,
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.offNamed(adminreports,
                                                    arguments: [
                                                      _homeScreenController
                                                          .user,
                                                      snapshot.data
                                                    ]);
                                              },
                                              child: Card(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 1, 0, 0),
                                                      child: Image.asset(
                                                          'assets/report_icon.png',
                                                          height: 25,
                                                          width: 25),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 4, 0, 4),
                                                      child: Text(
                                                        'Complaint',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 10,
                                                                color: HexColor(
                                                                    '#585353')),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 0, 0, 0),
                                                      child: Text(
                                                        'Complaint for your Apartments',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 7,
                                                                color: HexColor(
                                                                    '#8A8A8A')),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                elevation: 1.6,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 21,
                                          ),
                                          SizedBox(
                                            width: 140,
                                            height: 65,
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.offNamed(
                                                    preapproveentryscreen,
                                                    arguments: [
                                                      _homeScreenController
                                                          .user,
                                                      snapshot.data
                                                    ]);
                                              },
                                              child: Card(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 1, 0, 0),
                                                      child: Image.asset(
                                                          'assets/team 1.png',
                                                          height: 25,
                                                          width: 25),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 4, 0, 4),
                                                      child: Text(
                                                        'Pre Approve Entry',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 10,
                                                                color: HexColor(
                                                                    '#585353')),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 0, 10, 0),
                                                      child: Text(
                                                        'You can Pre approve your visitor',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 7,
                                                                color: HexColor(
                                                                    '#8A8A8A')),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                elevation: 1.6,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    _homeScreenController.user.roleId == 5
                                        ? Container()
                                        : Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                35, 8, 21, 0),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 140,
                                                  height: 65,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.offNamed(
                                                          viewfamilymember,
                                                          arguments: [
                                                            _homeScreenController
                                                                .user,
                                                            snapshot.data
                                                          ]);
                                                    },
                                                    child: Card(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    13,
                                                                    1,
                                                                    0,
                                                                    0),
                                                            child: Image.asset(
                                                                'assets/report_icon.png',
                                                                height: 25,
                                                                width: 25),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    13,
                                                                    4,
                                                                    0,
                                                                    4),
                                                            child: Text(
                                                              'Family Members',
                                                              style: GoogleFonts.ubuntu(
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 10,
                                                                  color: HexColor(
                                                                      '#585353')),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    13,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            child: Text(
                                                              'Add your family member',
                                                              style: GoogleFonts.ubuntu(
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 7,
                                                                  color: HexColor(
                                                                      '#8A8A8A')),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      elevation: 1.6,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 21,
                                                ),
                                              ],
                                            ),
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          35, 23, 0, 8),
                                      child: Text(
                                        "Events",
                                        style: GoogleFonts.ubuntu(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: HexColor('#585353')),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          35, 8, 21, 0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 140,
                                            height: 65,
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.offNamed(eventsscreen,
                                                    arguments: [
                                                      _homeScreenController
                                                          .user,
                                                      snapshot.data
                                                    ]);
                                              },
                                              child: Card(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 1, 0, 0),
                                                      child: Image.asset(
                                                          'assets/event 1.png',
                                                          height: 25,
                                                          width: 25),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 4, 0, 4),
                                                      child: Text(
                                                        'Society Events',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 10,
                                                                color: HexColor(
                                                                    '#585353')),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 0, 0, 0),
                                                      child: Text(
                                                        'You can view events',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 7,
                                                                color: HexColor(
                                                                    '#8A8A8A')),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                elevation: 1.6,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 21,
                                          ),
                                          SizedBox(
                                            width: 140,
                                            height: 65,
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.offNamed(noticeboardscreen,
                                                    arguments: [
                                                      _homeScreenController
                                                          .user,
                                                      snapshot.data
                                                    ]);
                                              },
                                              child: Card(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 1, 0, 0),
                                                      child: Image.asset(
                                                          'assets/post-it 1.png',
                                                          height: 25,
                                                          width: 25),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 4, 0, 4),
                                                      child: Text(
                                                        'Notice Board',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 10,
                                                                color: HexColor(
                                                                    '#585353')),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 0, 10, 0),
                                                      child: Text(
                                                        'Announcement from Admin',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 7,
                                                                color: HexColor(
                                                                    '#8A8A8A')),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                elevation: 1.6,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          35, 23, 0, 8),
                                      child: Text(
                                        "Conversations",
                                        style: GoogleFonts.ubuntu(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: HexColor('#585353')),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          35, 8, 21, 0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 140,
                                            height: 65,
                                            child: GestureDetector(
                                              onTap: () {
                                                print(
                                                    snapshot.data.runtimeType);

                                                Get.offNamed(
                                                    chatavailbilityscreen,
                                                    arguments: [
                                                      _homeScreenController
                                                          .user,
                                                      snapshot.data
                                                    ]);
                                              },
                                              child: Card(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 1, 0, 0),
                                                      child: SvgPicture.asset(
                                                          'assets/undraw_share_opinion_re_4qk7.svg',
                                                          height: 25,
                                                          width: 25),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 4, 0, 4),
                                                      child: Text(
                                                        'Chats',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 10,
                                                                color: HexColor(
                                                                    '#585353')),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 0, 0, 0),
                                                      child: Text(
                                                        'Chat with Neighbours/Gatekeepers',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 7,
                                                                color: HexColor(
                                                                    '#8A8A8A')),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                elevation: 1.6,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 21,
                                          ),
                                          SizedBox(
                                            width: 140,
                                            height: 65,
                                            child: GestureDetector(
                                              onTap: () async {
                                                DiscussionRoomModel discussionRoomModel =
                                                    await _homeScreenController
                                                        .createChatRoomApi(
                                                            token:
                                                                _homeScreenController
                                                                    .user
                                                                    .bearerToken!,
                                                            subadminid: snapshot
                                                                .data
                                                                .subadminid);
                                                Get.offNamed(discussion_form,
                                                    arguments: [
                                                      _homeScreenController
                                                          .user,
                                                      snapshot.data,
                                                      discussionRoomModel
                                                    ]);
                                              },
                                              child: Card(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 1, 0, 0),
                                                      child: SvgPicture.asset(
                                                          'assets/undraw_connected_re_lmq2.svg',
                                                          height: 25,
                                                          width: 25),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 4, 0, 4),
                                                      child: Text(
                                                        'Discussion Form',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 10,
                                                                color: HexColor(
                                                                    '#585353')),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 0, 10, 0),
                                                      child: Text(
                                                        'Share your opinions here',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 7,
                                                                color: HexColor(
                                                                    '#8A8A8A')),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                elevation: 1.6,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          35, 23, 0, 8),
                                      child: Text(
                                        "History",
                                        style: GoogleFonts.ubuntu(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: HexColor('#585353')),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          35, 8, 21, 0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 140,
                                            height: 65,
                                            child: GestureDetector(
                                              onTap: () {
                                                // _homeScreenController.payment();
                                                print(_homeScreenController
                                                    .user.userId!);
                                                print(_homeScreenController
                                                    .user.firstName!);
                                                print(snapshot.data.residentid);
                                                Get.offNamed(
                                                    reportshistoryscreen,
                                                    arguments: [
                                                      _homeScreenController
                                                          .user,
                                                      snapshot.data
                                                    ]);
                                              },
                                              child: Card(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 1, 0, 0),
                                                      child: Image.asset(
                                                          'assets/file 3.png',
                                                          height: 25,
                                                          width: 25),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 4, 0, 4),
                                                      child: Text(
                                                        'Complain History',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 10,
                                                                color: HexColor(
                                                                    '#585353')),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 0, 0, 0),
                                                      child: Text(
                                                        'Your Complaint History',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 7,
                                                                color: HexColor(
                                                                    '#8A8A8A')),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                elevation: 1.6,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 21,
                                          ),
                                          SizedBox(
                                            width: 140,
                                            height: 65,
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.offNamed(
                                                    guestshistoryscreen,
                                                    arguments:
                                                        _homeScreenController
                                                            .user);
                                              },
                                              child: Card(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 1, 0, 0),
                                                      child: Image.asset(
                                                          'assets/file 3.png',
                                                          height: 25,
                                                          width: 25),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 4, 0, 4),
                                                      child: Text(
                                                        'Guest History',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 10,
                                                                color: HexColor(
                                                                    '#585353')),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 0, 10, 0),
                                                      child: Text(
                                                        'Your Guest History',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 7,
                                                                color: HexColor(
                                                                    '#8A8A8A')),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                elevation: 1.6,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(
                                      height: 20,
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          35, 23, 0, 8),
                                      child: Text(
                                        "Bills",
                                        style: GoogleFonts.ubuntu(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: HexColor('#585353')),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          35, 8, 21, 0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 140,
                                            height: 65,
                                            child: GestureDetector(
                                              onTap: () {
                                                // _homeScreenController.payment();
                                                print(_homeScreenController
                                                    .user.userId!);
                                                print(_homeScreenController
                                                    .user.firstName!);
                                                print(snapshot.data.residentid);
                                                Get.offNamed(monthly_bill,
                                                    arguments: [
                                                      _homeScreenController
                                                          .user,
                                                      snapshot.data
                                                    ]);
                                              },
                                              child: Card(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 1, 0, 0),
                                                      child: Image.asset(
                                                          'assets/file 3.png',
                                                          height: 25,
                                                          width: 25),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 4, 0, 4),
                                                      child: Text(
                                                        'Monthly Bill ',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 10,
                                                                color: HexColor(
                                                                    '#585353')),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 0, 0, 0),
                                                      child: Text(
                                                        'Easy Pay your Monthly Bills',
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 7,
                                                                color: HexColor(
                                                                    '#8A8A8A')),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                elevation: 1.6,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 21,
                                          ),
                                        ],
                                      ),
                                    ),
                                    // MyButton(
                                    //   name: 'Pay',
                                    //   onPressed: () {
                                    //     _payViaJazzCash(context);
                                    //   },
                                    // )
                                  ],
                                );
                        } else if (snapshot.hasError) {
                          return Icon(Icons.error_outline);
                        } else {
                          return Loader();
                        }
                      })
                ],
              ),
            ),
          )),
    );
  }

// Future _payViaJazzCash(BuildContext context) async {
//   try {
//     JazzCashFlutter jazzCashFlutter = JazzCashFlutter(
//       merchantId: "MC52072",
//       merchantPassword: "1zu282w8e3",
//       integritySalt: "s8v30w3y0x",
//       isSandbox: true,
//     );
//
//     DateTime date = DateTime.now();
//
//     JazzCashPaymentDataModelV1 paymentDataModelV1 =
//         JazzCashPaymentDataModelV1(
//       ppAmount: '10',
//       ppBillReference:
//           'refbill${date.year}${date.month}${date.day}${date.hour}${date.millisecond}',
//       ppDescription: 'Product details ',
//       ppMerchantID: jazzCashFlutter.merchantId,
//       ppPassword: jazzCashFlutter.merchantPassword,
//       ppReturnURL:
//           "https://sandbox.jazzcash.com.pk/ApplicationAPI/API/Payment/DoTransaction",
//     );
//
//     jazzCashFlutter
//         .startPayment(
//             paymentDataModelV1: paymentDataModelV1, context: context)
//         .then((_response) {
//       print(jsonDecode(_response));
//     });
//   } catch (err) {
//     print("Error in payment $err");
//
//     return false;
//   }
// }
}

class HomeHeading extends StatelessWidget {
  final String? text;

  const HomeHeading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 23, 0, 8),
      child: Text(
        text!,
        style: GoogleFonts.ubuntu(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: HexColor('#585353')),
      ),
    );
  }
}

class HomeScreenCard extends StatelessWidget {
  final String? heading;
  final String? description;
  final String? iconPath;
  final String? type;
  final void Function()? onTap;

  const HomeScreenCard(
      {super.key,
      required this.heading,
      required this.description,
      required this.iconPath,
      required this.type,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                // Customize the shadow color
                offset: Offset(0, 2),
                // Specify the offset of the shadow
                blurRadius: 4.r,
                // Adjust the blur radius to control the intensity of the shadow
                spreadRadius: 0.3
                    .r, // Adjust the spread radius to control the size of the shadow
              ),
            ],
            borderRadius: BorderRadius.circular(8.r)), // Example color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            6.h.ph,
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  6.w.pw,
                  Image.asset(iconPath!, width: 30.w),
                  6.w.pw,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Text(
                      heading!,
                      style: GoogleFonts.ubuntu(
                          color: HexColor('#222741'),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    ),
                  )
                ],
              ),
            ),
            6.h.ph,
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Text(
                description!,
                style: GoogleFonts.ubuntu(
                    color: HexColor('#8A8A8A'),
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
