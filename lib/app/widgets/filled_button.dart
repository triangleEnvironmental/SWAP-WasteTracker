import 'package:flutter/material.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/extensions/index.dart';

class FilledButton extends StatelessWidget {
  final Widget child;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final Function()? onPressed;
  final Color? color;

  const FilledButton({
    Key? key,
    required this.child,
    this.icon,
    required this.onPressed,
    this.padding, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: padding ?? const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        minimumSize: const Size(40, 40),
        backgroundColor: onPressed == null ? AppColors.disabledButton : (color ?? AppColors.primaryColor),
        primary: Colors.white,
      ),
      onPressed: onPressed,
      child: Builder(
        builder: (context) {
          if (icon != null) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon!,
                8.x,
                child,
              ],
            );
          }
          return child;
        },
      ),
    );
  }
}
