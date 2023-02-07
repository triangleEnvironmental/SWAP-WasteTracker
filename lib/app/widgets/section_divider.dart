import 'package:flutter/material.dart';
import 'package:waste_tracker/app/constants/index.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      color: AppColors.darkBackground,
    );
  }
}
