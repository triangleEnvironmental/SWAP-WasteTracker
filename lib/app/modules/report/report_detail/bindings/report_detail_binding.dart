import 'package:get/get.dart';
import 'package:waste_tracker/app/modules/report/report_detail/controllers/report_detail_controller.dart';

class ReportDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportDetailController>(
      () => ReportDetailController(),
      tag: "${Get.arguments?['id']}",
    );
  }
}
