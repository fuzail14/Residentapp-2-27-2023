import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initFlutterNotification(RemoteMessage messages) async {
    var androidInitialization =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    var initializeSetting =
        InitializationSettings(android: androidInitialization);

    await flutterLocalNotificationsPlugin.initialize(initializeSetting,
        onDidReceiveNotificationResponse: (message) async {
      if (messages.data['type'] == 'Event') {



      } else if (messages.data['type'] == 'Noticeboard') {

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
        AndroidNotificationChannel(
            "pushnotificationapp",
            "pushnotificationapp",
            importance: Importance.max,


        );
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
      "pushnotificationapp",
      "pushnotificationapp",
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
    RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      if (message.data['type'] == 'Event') {

      } else if (message.data['type'] == 'Noticeboard') {



      }
/* when app is running in foreground */
      FirebaseMessaging.onMessageOpenedApp.listen((message) async {
        print(message.data);
        if (message.data['type'] == 'Event') {

        } else if (message.data['type'] == 'Noticeboard') {



        }
      });
    }
  }

  // static Future<List<Residents>> loginResidentDetails(
  //     {required int userid, required String token}) async {
  //   print("${userid.toString()}");
  //   print(token);
  //
  //   final response = await Http.get(
  //     Uri.parse(Api.loginresidentdetails + "/" + userid.toString()),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Authorization': "Bearer $token"
  //     },
  //   );
  //   print(response.body);
  //   var data = jsonDecode(response.body.toString());
  //
  //   var mydata = data['data'];
  //
  //   final List<Residents> residents = (mydata as List)
  //       .map((e) => Residents(
  //           id: e['id'],
  //           residentid: e['residentid'],
  //           subadminid: e['subadminid'],
  //           country: e["country"],
  //           state: e["state"],
  //           city: e["city"],
  //
  //           houseaddress: e["houseaddress"],
  //           vechileno: e["vechileno"],
  //           residenttype: e["residenttype"],
  //           propertytype: e["propertytype"],
  //           committeemember: e["committeemember"],
  //           status: e["status"],
  //           createdAt: e["createdAt"],
  //           updatedAt: e["updatedAt"]))
  //       .toList();
  //
  //   if (response.statusCode == 200) {
  //     return residents;
  //   }
  //
  //   return residents;
  // }
}
