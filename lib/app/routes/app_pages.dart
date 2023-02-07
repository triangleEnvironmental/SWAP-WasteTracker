import 'package:get/get.dart';

import 'package:waste_tracker/app/modules/faq/detail/bindings/faq_detail_binding.dart';
import 'package:waste_tracker/app/modules/faq/detail/views/faq_detail_view.dart';
import 'package:waste_tracker/app/modules/faq/list/bindings/faq_list_binding.dart';
import 'package:waste_tracker/app/modules/faq/list/views/faq_list_view.dart';
import 'package:waste_tracker/app/modules/home/bindings/home_binding.dart';
import 'package:waste_tracker/app/modules/home/views/home_view.dart';
import 'package:waste_tracker/app/modules/otp/bindings/otp_binding.dart';
import 'package:waste_tracker/app/modules/otp/views/otp_view.dart';
import 'package:waste_tracker/app/modules/phone_login/bindings/phone_login_binding.dart';
import 'package:waste_tracker/app/modules/phone_login/views/phone_login_view.dart';
import 'package:waste_tracker/app/modules/settings/bindings/settings_binding.dart';
import 'package:waste_tracker/app/modules/settings/views/settings_view.dart';
import 'package:waste_tracker/app/modules/splash/bindings/splash_binding.dart';
import 'package:waste_tracker/app/modules/splash/views/splash_view.dart';
import 'package:waste_tracker/app/modules/register/address/bindings/address_binding.dart';
import 'package:waste_tracker/app/modules/register/address/views/address_view.dart';
import 'package:waste_tracker/app/modules/register/username/bindings/username_binding.dart';
import 'package:waste_tracker/app/modules/register/username/views/username_view.dart';
import 'package:waste_tracker/app/modules/profile/bindings/profile_binding.dart';
import 'package:waste_tracker/app/modules/profile/views/profile_view.dart';
import 'package:waste_tracker/app/modules/report/create_report/bindings/create_report_binding.dart';
import 'package:waste_tracker/app/modules/report/create_report/views/create_report_view.dart';
import 'package:waste_tracker/app/modules/report/report_detail/bindings/report_detail_binding.dart';
import 'package:waste_tracker/app/modules/report/report_detail/views/report_detail_view.dart';
import 'package:waste_tracker/app/modules/report/report_list/bindings/report_list_binding.dart';
import 'package:waste_tracker/app/modules/report/report_list/views/report_list_view.dart';
import 'package:waste_tracker/app/modules/report/report_map/bindings/report_map_binding.dart';
import 'package:waste_tracker/app/modules/report/report_map/views/report_map_view.dart';
import 'package:waste_tracker/app/modules/report/report_history/bindings/report_history_binding.dart';
import 'package:waste_tracker/app/modules/report/report_history/views/report_history_view.dart';
import 'package:waste_tracker/app/modules/notification/notification_list/bindings/notification_list_binding.dart';
import 'package:waste_tracker/app/modules/notification/notification_list/views/notification_list_view.dart';
import 'package:waste_tracker/app/modules/notification/notification_detail/bindings/notification_detail_binding.dart';
import 'package:waste_tracker/app/modules/notification/notification_detail/views/notification_detail_view.dart';
import 'package:waste_tracker/app/modules/about/bindings/about_binding.dart';
import 'package:waste_tracker/app/modules/about/views/about_view.dart';
import 'package:waste_tracker/app/modules/terms/bindings/terms_binding.dart';
import 'package:waste_tracker/app/modules/terms/views/terms_view.dart';
import 'package:waste_tracker/app/modules/policies/bindings/policies_binding.dart';
import 'package:waste_tracker/app/modules/policies/views/policies_view.dart';
import 'package:waste_tracker/app/modules/write_comment/bindings/write_comment_binding.dart';
import 'package:waste_tracker/app/modules/write_comment/views/write_comment_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.routeSplash;

  static final routes = [
    GetPage(
      name: Routes.routeSplash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.routeHome,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.routeSettings,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.routePhoneLogin,
      page: () => const PhoneLoginView(),
      binding: PhoneLoginBinding(),
    ),
    GetPage(
      name: Routes.routeOtp,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: Routes.routeFaqList,
      page: () => const FaqListView(),
      binding: FaqListBinding(),
    ),
    GetPage(
      name: Routes.routeFaqDetail,
      page: () => const FaqDetailView(),
      binding: FaqDetailBinding(),
    ),
    GetPage(
      name: Routes.routeRegisterAddress,
      page: () => const RegisterAddressView(),
      binding: RegisterAddressBinding(),
    ),
    GetPage(
      name: Routes.routeRegisterUsername,
      page: () => const RegisterUsernameView(),
      binding: RegisterUsernameBinding(),
    ),
    GetPage(
      name: Routes.routeProfile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.routeReportCreateReport,
      page: () => const ReportCreateView(),
      binding: ReportCreateBinding(),
    ),
    GetPage(
      name: Routes.routeReportDetail,
      page: () => const ReportDetailView(),
      binding: ReportDetailBinding(),
    ),
    GetPage(
      name: Routes.routeReportList,
      page: () => const ReportListView(),
      binding: ReportListBinding(),
    ),
    GetPage(
      name: Routes.routeReportMap,
      page: () => const ReportMapView(),
      binding: ReportMapBinding(),
    ),
    GetPage(
      name: Routes.routeReportHistory,
      page: () => const ReportHistoryView(),
      binding: ReportHistoryBinding(),
    ),
    GetPage(
      name: Routes.routeNotificationList,
      page: () => const NotificationListView(),
      binding: NotificationListBinding(),
    ),
    GetPage(
      name: Routes.routeNotificationDetail,
      page: () => const NotificationDetailView(),
      binding: NotificationDetailBinding(),
    ),
    GetPage(
      name: Routes.routeAbout,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: Routes.routeTerms,
      page: () => const TermsView(),
      binding: TermsBinding(),
    ),
    GetPage(
      name: Routes.routePolicies,
      page: () => const PoliciesView(),
      binding: PoliciesBinding(),
    ),
    GetPage(
      name: Routes.routeWriteComment,
      page: () => const WriteCommentView(),
      binding: WriteCommentBinding(),
    ),
  ];
}
