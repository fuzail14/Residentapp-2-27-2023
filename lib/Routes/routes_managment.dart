import 'package:get/get.dart';
import 'package:userapp/Module/Discussion%20Form/View/discussion_form.dart';
import 'package:userapp/Module/Events/View/events_screen.dart';
import 'package:userapp/Module/Family%20Member/Add%20Family%20Member/View/add_family_member.dart';
import 'package:userapp/Module/Family%20Member/View%20Family%20Member/View/view_family_member.dart';
import 'package:userapp/Module/Monthly%20Bills/View/monthly_bills.dart';
import 'package:userapp/Module/Splash/View/splash_screen.dart';
import 'package:userapp/Routes/screen_binding.dart';
import 'package:userapp/Routes/set_routes.dart';
import 'package:userapp/Widgets/image_show.dart';
import '../Module/Add PreApprove Entry/View/add_pre_aprove_entry.dart';
import '../Module/Chat Availbility/View/chat_availbility_screen.dart';
import '../Module/Chat Screens/Neighbour Chat Screen/View/neighbour_chat_screen.dart';
import '../Module/Guest History/View/guests_history_screen.dart';
import '../Module/HomeScreen/View/home_screen.dart';
import '../Module/Login/View/login_screen.dart';
import '../Module/NoticeBoard/View/notice_board_screen.dart';
import '../Module/Pre Approve Entry/View/pre_approve_entry_screen.dart';
import '../Module/Report to Sub Admin/View/Admin Reports/admin_reports.dart';
import '../Module/Report to Sub Admin/View/Report to Admin/report_to_admin.dart';
import '../Module/ReportsHistory/View/admin_reports_history_screen.dart';
import '../Module/Signup/Resident Address Detail/View/resident_address_detail.dart';
import '../Module/Signup/Resident Personal Detail/View/resident_personal_detail.dart';

class RouteManagement {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: splashscreen,
        page: () => SplashScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: loginscreen,
        page: () => Login(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: homescreen,
        page: () => HomeScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: eventsscreen,
        page: () => EventsScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: neighbourchatscreen,
        page: () => NeighbourChatScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: chatavailbilityscreen,
        page: () => ChatAvailbilityScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: reporttoadmin,
        page: () => ReportToAdmin(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: adminreports,
        page: () => AdminReports(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: preapproveentryscreen,
        page: () => GatekeeperReports(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: addpreapproveentryscreen,
        page: () => AddPreApproveEntry(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: reportshistoryscreen,
        page: () => ReportsHistoryScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: guestshistoryscreen,
        page: () => GuestsHistoryScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: viewimage,
        page: () => ViewImage(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: noticeboardscreen,
        page: () => NoticeBoardScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: gatekeeperreports,
        page: () => GatekeeperReports(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: residentpersonaldetail,
        page: () => ResidentPersonalDetail(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: residentaddressdetail,
        page: () => ResidentAddressDetail(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: addfamilymember,
        page: () => AddFamilyMember(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: viewfamilymember,
        page: () => ViewFamilyMember(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: discussion_form,
        page: () => DiscussionForm(),
        binding: ScreenBindings(),

      ),
      GetPage(
        name: monthly_bill,
        page: () => MonthlyBills(),
        binding: ScreenBindings(),

      ),

    ];
  }
}
