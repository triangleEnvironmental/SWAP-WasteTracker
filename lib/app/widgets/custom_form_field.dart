import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormField<T> extends StatelessWidget {
  final Widget child;
  final FormFieldValidator<T>? validator;

  const CustomFormField({
    Key? key,
    required this.child,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      validator: validator,
      builder: (FormFieldState<T> state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            child,
            if (state.hasError)
              Text(
                state.errorText!,
                style: Get.textTheme.caption?.copyWith(
                  color: const Color(0xffd92727),
                ),
              ).marginOnly(top: 8),
          ],
        );
      },
    );
  }
}
