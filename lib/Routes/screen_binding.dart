import 'package:get/get.dart';
import 'package:userapp/Module/Discussion%20Form/View/discussion_form.dart';
import 'package:userapp/Module/Events/View/events_screen.dart';
import 'package:userapp/Module/Events/View/view_event_images_screen.dart';
import 'package:userapp/Module/Family%20Member/Add%20Family%20Member/View/add_family_member.dart';
import 'package:userapp/Module/Family%20Member/View%20Family%20Member/View/view_family_member.dart';
import 'package:userapp/Module/GuestHistory/View/guests_history_screen.dart';
import 'package:userapp/Module/Monthly%20Bills/View/monthly_bills.dart';
import 'package:userapp/Module/Report%20to%20Sub%20Admin/View/Admin%20Reports/admin_reports.dart';
import 'package:userapp/Module/Splash/View/splash_screen.dart';
import 'package:userapp/Widgets/image_show.dart';
import '../Module/Add PreApprove Entry/View/add_pre_aprove_entry.dart';
import '../Module/Chat Availbility/View/chat_availbility_screen.dart';
import '../Module/Chat Screens/Neighbour Chat Screen/View/neighbour_chat_screen.dart';
import '../Module/HomeScreen/View/home_screen.dart';
import '../Module/Login/View/login_screen.dart';
import '../Module/NoticeBoard/View/notice_board_screen.dart';
import '../Module/Pre Approve Entry/View/pre_approve_entry_screen.dart';
import '../Module/Report to Sub Admin/View/Report to Admin/report_to_admin.dart';
import '../Module/ReportsHistory/View/admin_reports_history_screen.dart';
import '../Module/Signup/Resident Address Detail/View/resident_address_detail.dart';
import '../Module/Signup/Resident Personal Detail/View/resident_personal_detail.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreen());
    Get.lazyPut(() => Login());
    Get.lazyPut(() => HomeScreen());
    Get.lazyPut(() => EventsScreen());
    Get.lazyPut(() => NeighbourChatScreen());
    Get.lazyPut(() => ChatAvailbilityScreen());
    Get.lazyPut(() => ReportToAdmin());
    Get.lazyPut(() => AdminReports());
    Get.lazyPut(() => GatekeeperReports());
    Get.lazyPut(() => AddPreApproveEntry());
    Get.lazyPut(() => ReportsHistoryScreen());
    Get.lazyPut(() => GuestsHistoryScreen());
    Get.lazyPut(() => ViewEventImages());
    Get.lazyPut(() => ViewImage());
    Get.lazyPut(() => NoticeBoardScreen());
    Get.lazyPut(() => GatekeeperReports());
    Get.lazyPut(() => ResidentPersonalDetail());
    Get.lazyPut(() => ResidentAddressDetail());
    Get.lazyPut(() => AddFamilyMember());
    Get.lazyPut(() => ViewFamilyMember());
    Get.lazyPut(() => DiscussionForm());
    Get.lazyPut(() => MonthlyBills());
  }
}
