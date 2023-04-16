import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as Http;
import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:userapp/Routes/set_routes.dart';

import '../../Constants/api_routes.dart';
import '../../Module/HomeScreen/Model/residents.dart';
import '../../Module/Login/Model/User.dart';
import '../Shared Preferences/MySharedPreferences.dart';

class NotificationServices {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidNotificationChannel callAndroidNotificationChannel =
  AndroidNotificationChannel('call', 'call',
      importance: Importance.max);
  initFlutterNotification(RemoteMessage messages) async {
    var androidInitialization =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    var initializeSetting =
        InitializationSettings(android: androidInitialization);

    await flutterLocalNotificationsPlugin.initialize(initializeSetting,
        onDidReceiveNotificationResponse: (message) async {
      if (messages.data['type'] == 'Event') {
        final User user = await MySharedPreferences.getUserData();
        final List<Residents> residents = await loginResidentDetails(
            token: user.bearerToken!, userid: user.userid!);
        Get.toNamed(eventsscreen, arguments: [user, residents[0]]);
      } else if (messages.data['type'] == 'Noticeboard') {
        final User user = await MySharedPreferences.getUserData();
        final List<Residents> residents = await loginResidentDetails(
            token: user.bearerToken!, userid: user.userid!);
        Get.toNamed(notificationsscreen, arguments: [user, residents[0]]);
      }
    });
  }

  fireBaseInit() {
    FirebaseMessaging.onMessage.listen((message) {
      initFlutterNotification(message);
      showNotificationFlutter(message);
    });
  }

  Future<void> showNotificationFlutter(RemoteMessage message) async {
    AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(Random.secure().nextInt(1000000).toString(),
            'High Importance Notification',
            importance: Importance.max);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);
    await firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      androidNotificationChannel.id,
      androidNotificationChannel.name,
      channelDescription: 'High Importance Notification',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      ticker: 'ticker',
    );
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails);
  }

  requestNotification() async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        sound: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('permission granted');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('permission denied');
      AppSettings.openNotificationSettings();
    }
  }

  Future<String?> getDeviceToken() async {
    String? deviceToken = await firebaseMessaging.getToken();

    return deviceToken;
  }

  refreshDeviceToken() async {
    firebaseMessaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }

  Future<void> setupInteractMessage() async {
/* when app is terminated */
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      if (message.data['type'] == 'Event') {
        final User user = await MySharedPreferences.getUserData();
        final List<Residents> residents = await loginResidentDetails(
            token: user.bearerToken!, userid: user.userid!);
        Get.toNamed(eventsscreen, arguments: [user, residents[0]]);
      } else if (message.data['type'] == 'Noticeboard') {
        final User user = await MySharedPreferences.getUserData();
        final List<Residents> residents = await loginResidentDetails(
            token: user.bearerToken!, userid: user.userid!);
        Get.toNamed(notificationsscreen, arguments: [user, residents[0]]);
      }
/* when app is running in foreground */
      FirebaseMessaging.onMessageOpenedApp.listen((message) async {
        print(message.data);
        if (message.data['type'] == 'Event') {
          final User user = await MySharedPreferences.getUserData();
          final List<Residents> residents = await loginResidentDetails(
              token: user.bearerToken!, userid: user.userid!);
          Get.toNamed(eventsscreen, arguments: [user, residents[0]]);
        } else if (message.data['type'] == 'Noticeboard') {
          final User user = await MySharedPreferences.getUserData();
          final List<Residents> residents = await loginResidentDetails(
              token: user.bearerToken!, userid: user.userid!);
          Get.toNamed(notificationsscreen, arguments: [user, residents[0]]);
        }
      });
    }
  }

  static Future<List<Residents>> loginResidentDetails(
      {required int userid, required String token}) async {
    print("${userid.toString()}");
    print(token);

    final response = await Http.get(
      Uri.parse(Api.loginresidentdetails + "/" + userid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    var mydata = data['data'];

    final List<Residents> residents = (mydata as List)
        .map((e) => Residents(
            id: e['id'],
            residentid: e['residentid'],
            subadminid: e['subadminid'],
            country: e["country"],
            state: e["state"],
            city: e["city"],

            houseaddress: e["houseaddress"],
            vechileno: e["vechileno"],
            residenttype: e["residenttype"],
            propertytype: e["propertytype"],
            committeemember: e["committeemember"],
            status: e["status"],
            createdAt: e["createdAt"],
            updatedAt: e["updatedAt"]))
        .toList();

    if (response.statusCode == 200) {
      return residents;
    }

    return residents;
  }
}
