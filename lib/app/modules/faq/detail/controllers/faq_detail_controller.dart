import 'package:get/get.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/repositories/faq_repository.dart';

class FaqDetailController extends GetxController {
  final faqRepository = FaqRepository();
  final id = Get.arguments?['id'] ?? 0;
  late Rx<Future<Faq>> faqFuture;

  Future<Faq> fetchDetail() async {
    return await faqRepository.detail(id);
  }

  Future refreshData() async {
    faqFuture.value = fetchDetail();
    await faqFuture.value;
  }

  @override
  void onInit() {
    faqFuture = fetchDetail().obs;
    super.onInit();
  }
}
