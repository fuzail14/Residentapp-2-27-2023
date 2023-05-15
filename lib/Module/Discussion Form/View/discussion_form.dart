import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/Widgets/Loader/loader.dart';

import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/Empty List/empty_list.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../Controller/discussion_form_controller.dart';

class DiscussionForm extends GetView {
  @override
  Widget build(BuildContext context) {
    print('build');

    return GetBuilder<DiscussionFormController>(
        init: DiscussionFormController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              await Get.offAllNamed(homescreen, arguments: controller.user);
              return true;
            },
            child: SafeArea(
              child: Scaffold(
                body: Column(
                  children: [
                    MyBackButton(
                      text: 'Discussion Form',
                      onTap: () {
                        Get.offAllNamed(homescreen, arguments: controller.user);
                      },
                    ),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('discussionchats')
                                    .where('discussionroomid',
                                        isEqualTo: controller
                                            .discussionRoomModel.data?.first.id)
                                    .orderBy('timestamp', descending: true)
                                    .snapshots(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasData) {
                                    var data = snapshot.data!.docs;

                                    if (data.length == 0) {
                                      return EmptyList(
                                          name:
                                              "Join the discussion Forum 😊 \n and share your thoughts with the community.");
                                    }
                                    return ListView.builder(
                                      reverse: true,
                                      itemCount: data.length,
                                      itemBuilder: (context, index) {
                                        print(data[index]['residentid']);

                                        return Row(
                                          mainAxisAlignment: data[index]
                                                      ['residentid'] ==
                                                  controller.user.userId
                                              ? MainAxisAlignment.end
                                              : MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                            vertical: 16),
                                                    decoration: BoxDecoration(
                                                      color: data[index][
                                                                  'residentid'] ==
                                                              controller
                                                                  .user.userId
                                                          ? primaryColor
                                                          : Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    child: data![index][
                                                                'residentid'] ==
                                                            controller
                                                                .user.userId
                                                        ? Text(
                                                            data![index]
                                                                    ['message']
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )
                                                        : Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                data![index][
                                                                            'user']
                                                                        [
                                                                        'firstname']
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color:
                                                                        primaryColor),
                                                              ),
                                                              Text(
                                                                data[index][
                                                                        'message']
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ],
                                                          )),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.active) {
                                    return Loader();
                                  } else {
                                    return Loader();
                                  }
                                }))),
                    Container(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: TextField(
                              maxLines: null,
                              controller: controller.msg,
                              decoration: InputDecoration(
                                  hintText: "Write message...",
                                  hintStyle: TextStyle(color: Colors.black54),
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                              onTap: () {
                                try {
                                  // Get a reference to the Firestore collection
                                  CollectionReference chats = FirebaseFirestore
                                      .instance
                                      .collection('discussionchats');

                                  var user = {
                                    'firstname': controller.user.firstName,
                                    'lastname': controller.user.lastName,
                                    'address': controller.user.address,
                                    'rolename': controller.user.roleName,
                                    'roleid': controller.user.roleId,
                                  };
                                  // Add a new document with a generated ID
                                  chats.add({
                                    'residentid':
                                        controller.resident.residentid!,
                                    'message': controller.msg.text,
                                    'discussionroomid': controller
                                        .discussionRoomModel?.data?.first.id,
                                    'timestamp': FieldValue.serverTimestamp(),
                                    'user': user
                                  });

                                  controller.msg.clear();
                                  print('Data added successfully');
                                } catch (error) {
                                  print('Error adding data: $error');
                                }
                              },
                              child: Icon(Icons.send)),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
