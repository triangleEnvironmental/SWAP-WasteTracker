import 'package:get/get.dart';
import 'package:waste_tracker/app/modules/write_comment/controllers/write_comment_controller.dart';

class WriteCommentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WriteCommentController>(() => WriteCommentController());
  }
}
