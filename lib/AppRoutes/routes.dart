import 'package:fyp/View/all_doctors/all_doctors.dart';
import 'package:fyp/View/events_detail/events_detail.dart';
import 'package:fyp/View/login/login.dart';
import 'package:fyp/View/navigation_bar/navigation_bar.dart';
import 'package:fyp/View/register/register.dart';
import 'package:fyp/View/splash/splash.dart';
import 'package:fyp/admin/admin_board.dart';
import 'package:fyp/admin/doctor_upload.dart';
import 'package:fyp/admin/event_upload,.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static const String baseball = "/baseball";
  static const String squash = "/squash";
  static const String americanfootball = "/americanfootball";
  static const String register = "/register";
  static const String splash = "/splash";
  static const String login = "/login";
  static const String navbar = "/navbar";
  static const String eventdetail = "/eventdetail";
  static const String eventUpload = "/eventUpload";
  static const String doctorUpload = "/doctorUpload";
  static const String adminBoard = "/adminBoard";
  static const String allDoctor = "/allDoctor";

  static List<GetPage> appRoutes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: register, page: () => const Register()),
    GetPage(name: login, page: () => const Login()),
    GetPage(name: navbar, page: () => const NavigationBarr()),
    GetPage(name: eventdetail, page: () => EventsDetail()),
    GetPage(name: doctorUpload, page: () => const DoctorUpload()),
    GetPage(name: eventUpload, page: () => const EventUpload()),
    GetPage(name: adminBoard, page: () => const AdminBoard()),
    GetPage(name: allDoctor, page: () => const AllDoctors()),
  ];
}
