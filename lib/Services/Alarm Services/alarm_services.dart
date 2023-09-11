import 'package:alarm/alarm.dart';

class AlarmServices {
  triggerAlarm(DateTime time, String? notificationTitle,
      String? notificationBody) async {
    final alarmSettings = AlarmSettings(
      id: 42,
      dateTime: time,
      stopOnNotificationOpen: true,
      assetAudioPath: 'assets/emergency.mp3',
      loopAudio: true,
      vibrate: true,
      fadeDuration: 3.0,
      notificationTitle: notificationTitle,
      notificationBody: notificationBody,
      enableNotificationOnKill: true,
    );

    return alarmSettings;
  }

  static setAlarm({required alarmSettings}) async {
    await Alarm.set(alarmSettings: alarmSettings);
  }

  static stopAlarm({required id}) async {
    await Alarm.stop(id);
  }

  static initAlarm() async {
    await Alarm.init();
  }
}
