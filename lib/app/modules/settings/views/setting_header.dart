import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/utils/index.dart';
import 'package:waste_tracker/app/widgets/index.dart';

final _headerHeight = Get.mediaQuery.padding.top + 100 + kToolbarHeight;
const _imageHeight = 140.0;
const _imageWidth = _imageHeight / 1.4;

class SettingHeader extends StatelessWidget {
  final String? imageUrl;
  final Widget profile;
  final String? fullName;

  const SettingHeader({
    Key? key,
    required this.imageUrl,
    required this.profile,
    this.fullName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            if (imageUrl != null)
              Positioned(
                left: AppDimens.marginHorizontal / 2,
                child: Material(
                  borderRadius: AppDimens.borderRadiusLg,
                  shadowColor: AppColors.moreShadowColor,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: GestureDetector(
                      onTap: () {
                        if (imageUrl != null) {
                          viewPhoto(
                            images: [NetworkImage(imageUrl!)],
                          );
                        }
                      },
                      child: Hero(
                        tag: 'user_avatar',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            AppDimens.radiusLg.x - 4,
                          ),
                          child: SizedBox(
                            height: _imageHeight,
                            width: _imageWidth,
                            child: UserAvatar(
                              imageUrl,
                              name: fullName,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: imageUrl != null ? _imageHeight : 0.0,
                  ),
                  child: Material(
                    shadowColor: AppColors.shadowColor,
                    elevation: 10,
                    color: AppColors.backgroundContrastColor(context),
                    borderRadius: AppDimens.borderRadiusLg,
                    child: profile.paddingOnly(
                      left: (imageUrl != null ? _imageWidth : 0) + 16,
                      right: 16,
                      top: 16,
                      bottom: 16,
                    ),
                  ),
                ).paddingSymmetric(
                  horizontal: AppDimens.marginHorizontal,
                ),
              ],
            ).marginOnly(top: imageUrl != null ? 20 : 0),
          ].reversed.toList(),
        ),
      ],
    );
  }
}