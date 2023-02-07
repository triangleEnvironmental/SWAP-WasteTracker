import 'package:get/get.dart';
import 'package:waste_tracker/app/modules/report/create_report/controllers/create_report_controller.dart';

class ReportCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportCreateController>(() => ReportCreateController());
  }
}
