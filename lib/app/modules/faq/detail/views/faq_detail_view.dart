import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/models/index.dart';
import 'package:waste_tracker/app/utils/index.dart';
import 'package:waste_tracker/app/widgets/index.dart';
import 'package:waste_tracker/locales/index.dart';

import '../controllers/faq_detail_controller.dart';

class FaqDetailView extends GetView<FaqDetailController> {
  const FaqDetailView({Key? key}) : super(key: key);

  @override
  String? get tag => "${Get.arguments?['id']}";

  _modifyHtml(String question, String? html) {
    html ??= '<div style="padding: 3em; text-align: center;">There is no answer</div>';

    return '''
    <h2 style="border-left: 3px solid #${AppColors.toHex(AppColors.primaryColor)}; padding: 0.2em 0 0.2em 0.3em;">
      $question
    </h2>
    $html
    ''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title_clean_city_tips),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: Obx(
          () => FutureBuilder<Faq>(
            future: controller.faqFuture.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final Faq faq = snapshot.data!;

                return HtmlRenderer(
                  key: ValueKey(_modifyHtml(faq.question, faq.answer)),
                  html: _modifyHtml(faq.question, faq.answer),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: LoadingWidget(),
                );
              } else {
                String errorMessage = LocaleKeys.phrase_not_your_mistake;

                errorMessage = getErrorMessage(snapshot.error);

                return ErrorView(
                  image: Image.asset(
                    AppStrings.errorImage,
                    width: Get.width * 0.8,
                  ),
                  title: LocaleKeys.label_something_went_wrong,
                  description: errorMessage,
                  bottom: FilledButton(
                    onPressed: controller.refreshData,
                    icon: const Icon(AppIcons.refresh),
                    child: Text(LocaleKeys.button_try_again),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
