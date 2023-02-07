import 'package:flutter/material.dart';
import 'package:waste_tracker/app/constants/index.dart';

class SmallIconButton extends StatelessWidget {
  final Color? color;
  final VoidCallback? onPressed;
  final IconData icon;

  const SmallIconButton({
    Key? key,
    required this.icon,
    this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 40,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(4),
          minimumSize: const Size(10, 10),
          primary: color ?? AppColors.primaryColor,
        ),
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
