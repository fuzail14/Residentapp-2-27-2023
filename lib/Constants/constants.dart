import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

final Color primaryColor = HexColor("#FF9900");
const String assetsBaseUrl = "assets/";
const String logo = '${assetsBaseUrl}mia.png';
var whiteColor = HexColor("FAFFFD");

//
// getFile() async {
//   var file;
//   // String? base64Image;
//   //
//
//
//   FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//   if (result != null) {
//     file = File(result.files.single.path!);
//
//     print(file);
//     // isFile = true;
//     //  List<int> imageBytes = _file!.readAsBytesSync();
//     //
//     //  print(imageBytes);
//     // base64Image = base64Encode(imageBytes);
//     //  print(base64Image);
//
//     return file;
//   } else {
//     // View Users canceled the picker
//   }
// }

Future<String> getDate(BuildContext context) async {
  DateTime date = new DateTime(2022, 12, 24);
  String? myDate;

  DateTime? newDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: primaryColor, // <-- SEE HERE
              // <-- SEE HERE
              // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));
  if (newDate == null) {
    return "";
  }

  date = newDate;
  print(date);

  date.month;
  date.year;
  date.day;
  myDate = date.day.toString() +
      "/" +
      date.month.toString() +
      "/" +
      date.year.toString();

  return myDate;
}

/* Validations */

String? emptyStringValidator(String? val) {
  String string = val!.trim();

  if (string.isEmpty) {
    return "This field is required";
  } else {
    return null;
  }
}

String? passwordValidator(String? v) {
  RegExp smallAlphabets = RegExp("(?=.*?[a-z])");
  RegExp capitalAlphabets = RegExp("(?=.*?[A-Z])");
  RegExp specialCharacter = RegExp("(?=.*?[#?!@\$%^&*-])");
  String string = v!.trim();
  if (string.isEmpty) {
    return 'Please enter the password';
  } else if (string.length < 6 || string.length > 25) {
    return 'Password length should be in between 6 and 25';
  } else if (!smallAlphabets.hasMatch(string)) {
    return 'Password must includes at least one lower case English letter. ';
  } else if (!capitalAlphabets.hasMatch(string)) {
    return 'Password must includes at least one upper case English letter.';
  } else if (!specialCharacter.hasMatch(string)) {
    return 'Password must includes at least one special character.';
  } else {
    return null;
  }
}

String? emailValidator(String? v) {
  String string = v!.trim();
  bool _emailValid = RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(string);

  if (string.isEmpty) {
    return 'Please enter your email';
  } else if (!_emailValid) {
    return 'Please enter a valid email';
  } else {
    return null;
  }
}

String? cnicValidator(String? v) {
  String string = v!.trim();
  bool _cnicValid = RegExp("^[0-9]{5}-[0-9]{7}-[0-9]\$").hasMatch(string);

  if (string.isEmpty) {
    return 'Please enter your CNIC';
  } else if (!_cnicValid) {
    return 'Please enter a valid CNIC  XXXXX-XXXXXXX-X  ';
  } else {
    return null;
  }
}

String formatDate(String date) {
  DateFormat formatter = DateFormat('yyyy-MM-dd');

  DateTime myDate = DateTime.parse(date);
  formatter.format(myDate);
  var formattedDate = myDate.toString().split(' ')[0];

  return formattedDate;
}

String getFormattedTime({required String time}) {
  int hour = int.parse(time.split(':')[0].toString());
  String hourZero = '';

  String minute = '00';

  String isAmOrPm = 'AM';

  if (hour > 12) {
    hour = hour - 12;
    isAmOrPm = 'PM';
  } else if (hour == 00) {
    hour = 12;
  } else if (hour == 12) {
    isAmOrPm = 'PM';
  }

  if (minute == '0') {
    minute = '00';
  }

  if (hour < 10) {
    hourZero = '0';
  }

  return '${hourZero.toString()}${hour.toString()}:${minute.toString()} $isAmOrPm';
}

String getFormattedTime2({required String time}) {
  int hour = int.parse(time.split(':')[0].toString());
  String hourZero = '';

  String minute = time.split(':')[1].toString();

  String isAmOrPm = 'AM';

  if (hour > 12) {
    hour = hour - 12;
    isAmOrPm = 'PM';
  } else if (hour == 00) {
    hour = 12;
  } else if (hour == 12) {
    isAmOrPm = 'PM';
  }

  if (minute == '0') {
    minute = '00';
  }

  if (hour < 10) {
    hourZero = '0';
  }

  return '${hourZero.toString()}${hour.toString()}:${minute.toString()}:00 $isAmOrPm';
}

extension MySizedBox on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}

Future<bool?> myToast(
    {required msg,
    Color? backgroundColor,
    bool isNegative = false,
    ToastGravity? gravity}) async {
  bool? toast = await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: isNegative ? Colors.red : Colors.black,
      textColor: Colors.white,
      fontSize: 16.0.sp);
  return toast;
}

String convertDateFormat(String originalDate) {
  DateTime dateTime = DateTime.parse(originalDate).add(Duration(hours: 5));
  DateFormat dateFormat = DateFormat.yMMMMd('en_US');
  return dateFormat.format(dateTime);
}

String convertTo12HourFormatFromTimeStamp(String timestamp) {
  DateTime dateTime = DateTime.parse(timestamp).add(Duration(hours: 5));
  String formattedTime = DateFormat('h:mm a').format(dateTime);

  return formattedTime;
}

String convert24HourFormatTo12HourTime(String time) {
  DateTime parsedTime = DateFormat("HH:mm:ss").parse(time);
  String formattedTime = DateFormat("hh:mm:ss a").format(parsedTime);
  return formattedTime;
}

String convertServerTimestampToLocalTime(int serverTimestampInSeconds) {
  DateTime serverDateTime =
      DateTime.fromMillisecondsSinceEpoch(serverTimestampInSeconds * 1000);
  DateTime localDateTime = serverDateTime.toLocal();
  String formattedTime = DateFormat('h:mm a').format(localDateTime);
  return formattedTime;
}

String convertTimestampDayMonth(String timestamp) {
  DateTime dateTime = DateTime.parse(timestamp);
  DateFormat formatter = DateFormat('d MMM');
  return formatter.format(dateTime);
}

String? validateMobileNumber(String? value) {
// Check if the value is empty
  if (value!.isEmpty) {
    return 'Mobile number is required';
  }

// Remove any whitespace or special characters from the value
  value = value.replaceAll(RegExp(r'\s|\D'), '');

// Check if the value contains only digits
  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return 'Invalid mobile number';
  }

// Check the length of the value
  if (value.length < 11 || value.length > 12) {
    return 'Mobile number must be between 10 and 12 digits';
  }

// If all checks pass, return null (no error)
  return null;
}

String? validatePhoneNumber(String? phoneNumber) {
  // Remove any non-digit characters from the phone number
  String cleanedPhoneNumber = phoneNumber!.replaceAll(RegExp(r'\D'), '');

  // Check if the phone number has a valid length
  int phoneNumberLength = cleanedPhoneNumber.length;
  if (phoneNumberLength == 0) {
    return 'Please Enter Phone Number';
  } else if (phoneNumberLength != 10 && phoneNumberLength != 11) {
    return 'Invalid Phone Number !';
  }

  return null; // Return null if the phone number is valid
}

String? otpValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please enter the OTP';
  }

// Create a regular expression pattern for exactly 6 digits
  RegExp regex = RegExp(r'^[0-9]{6}$');

  if (!regex.hasMatch(value)) {
    return 'Please enter a valid 6-digit OTP';
  }

  return null; // Return null if the value is valid
}

String laravelDateToFormattedDate(String laravelDate) {
  // Parse the Laravel date string to a DateTime object
  DateTime date = DateTime.parse(laravelDate);

  // Define the date format you want
  String formattedDate = DateFormat('d MMM y').format(date);

  return formattedDate;
}

String convertLaravelDateFormatToDayMonthYearDateFormat(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);
  String formattedDate = DateFormat('d MMM y').format(dateTime);
  return formattedDate;
}

String convertDateFormatToDayMonthYearDateFormat(String inputDate) {
  DateTime parsedDate = DateTime.parse(inputDate);
  String formattedDate = DateFormat("MMM, d, yyyy").format(parsedDate);
  return formattedDate;
}
