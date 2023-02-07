import 'package:get/get.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/repositories/index.dart';

class AboutController extends GetxController {
  final pageRepository = PageRepository();
  late Rx<Future<HtmlPage>> future;

  Future<HtmlPage> fetchDetail() async {
    return await pageRepository.aboutPage();
  }

  Future onRefresh() async {
    future.value = fetchDetail();
    await future.value;
  }

  @override
  void onInit() {
    future = fetchDetail().obs;
    super.onInit();
  }
}
