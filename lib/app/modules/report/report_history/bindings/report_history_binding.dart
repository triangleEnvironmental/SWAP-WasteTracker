import 'package:get/get.dart';
import 'package:waste_tracker/app/modules/report/report_history/controllers/report_history_controller.dart';

class ReportHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportHistoryController>(() => ReportHistoryController());
  }
}
