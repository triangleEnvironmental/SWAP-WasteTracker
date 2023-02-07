import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/extensions/index.dart';

class ErrorView extends StatelessWidget {
  final Widget image;
  final String title;
  final String? description;
  final Widget? bottom;
  final Widget? action;

  const ErrorView({
    Key? key,
    required this.image,
    required this.title,
    this.description,
    this.bottom,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        30.y,
        Expanded(
          child: Column(
            children: [
              Text(
                title,
                style: Get.textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Flexible(
                flex: 3,
                child: Center(child: image),
              ),
              if (description != null)
                Flexible(
                  flex: 2,
                  child: Text(
                    description!,
                    textAlign: TextAlign.center,
                  ),
                ),
              20.y,
              if (bottom != null) bottom!,
            ],
          ),
        ),
        if (action != null) action!,
        SizedBox(
          height: Get.mediaQuery.padding.bottom + 10,
        ),
      ],
    ).paddingSymmetric(
      horizontal: AppDimens.marginHorizontal,
    );
  }
}
