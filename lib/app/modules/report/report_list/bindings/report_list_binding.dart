import 'package:get/get.dart';
import 'package:waste_tracker/app/modules/report/report_list/controllers/report_list_controller.dart';

class ReportListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportListController>(() => ReportListController());
  }
}
