import 'package:get/get.dart';
import 'package:waste_tracker/app/modules/report/report_map/controllers/report_map_controller.dart';

class ReportMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportMapController>(() => ReportMapController());
  }
}
