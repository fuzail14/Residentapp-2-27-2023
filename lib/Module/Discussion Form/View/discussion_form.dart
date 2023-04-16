import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/Empty List/empty_list.dart';
import '../../../Widgets/Loader/loader.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../Controller/discussion_form_controller.dart';

class DiscussionForm extends GetView {
  @override
  Widget build(BuildContext context) {
    print('build');

    return GetBuilder<DiscussionFormController>(
        init: DiscussionFormController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              body: Column(

                children: [
                  MyBackButton(
                      text: 'Discussion Form',
                  ),


                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child:FutureBuilder(
                          future: controller.allDiscussionChatsApi(token: controller.user!.bearerToken!,discussionroomid: controller.discussionRoomModel!.data!.first.id),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {



                              if (snapshot.data .data!= null && snapshot.data.data!.length != 0) {

                                return
                                  
                                  ListView.builder(
                                  reverse: true,
                                  itemCount: snapshot.data.data.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment:
                                      snapshot.data.data[index].residentid==
                                          controller.user.userid
                                          ? MainAxisAlignment.end
                                          : MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 12, vertical: 16),
                                                decoration: BoxDecoration(
                                                  color: snapshot.data.data[index].residentid ==
                                                      controller
                                                          .user.userid
                                                      ? primaryColor
                                                      : Colors.black,
                                                  borderRadius:
                                                  BorderRadius.circular(4),
                                                ),
                                                child:snapshot.data.data[index].residentid ==
                                    controller
                                        .user.userid?   Text(


                                                      snapshot.data.data[index].message
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ):
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(


                                                      snapshot.data.data[index].user.first.firstname
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: primaryColor),
                                                    ),
                                                    Text(


                                                      snapshot.data.data[index].message
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),

                                                  ],
                                                )),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );}
                              else { return  EmptyList(name: "Join the discussion Forum 😊 \n and share your thoughts with the community."); }
                            } else if (snapshot.hasError) {
                              return Icon(Icons.error_outline);
                            } else {
                              return Loader();
                            }
                          }),
                    ),
                  ),
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
                              controller.discussionchatsApi(
                                  token: controller.user.bearerToken!,
                                  residentid: controller.resident.residentid!,
                                  message: controller.msg.text,
                                  discussionroomid: controller.discussionRoomModel?.data?.first.id);
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
          );
        });
  }
}
