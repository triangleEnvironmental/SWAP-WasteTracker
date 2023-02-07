
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/utils/helpers.dart';

class OtpInputField extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String code)? onComplete;

  const OtpInputField({
    Key? key,
    this.controller,
    this.onComplete,
  }) : super(key: key);

  @override
  State<OtpInputField> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<OtpInputField> {
  final int digits = 6;
  late TextEditingController _controller;
  late List<String> otpValues;
  int currentCursor = 0;
  final FocusNode focusNode = FocusNode();

  _setCursorToLast() {
    _controller.selection = TextSelection.fromPosition(
      TextPosition(
        offset: _controller.text.length,
      ),
    );
  }

  _onInputChanged() {
    if (_controller.text.contains(RegExp(r"[^0-9]"))) {
      _controller.text = _controller.text.replaceAll(RegExp(r"[^0-9]"), '');
      _setCursorToLast();
    }

    setState(() {
      currentCursor = _controller.text.length;
      for (int i = 0; i < digits; i++) {
        if (i < _controller.text.length) {
          otpValues[i] = _controller.text[i];
        } else {
          otpValues[i] = '';
        }
      }
    });

    if (_controller.text.length == digits) {
      if (widget.onComplete != null) {
        widget.onComplete!(_controller.text);
      }
      closeKeyboard();
    }
  }

  @override
  void initState() {
    otpValues = List.generate(digits, (index) => '');
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onInputChanged);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onInputChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(
          child: Opacity(
            opacity: 0,
            child: TextField(
              focusNode: focusNode,
              keyboardType: const TextInputType.numberWithOptions(),
              controller: _controller,
            ),
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < digits; i++)
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(focusNode);
                    if (otpValues[i].isNotEmpty) {
                      _controller.text = _controller.text.substring(0, i);
                      _setCursorToLast();
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.5),
                      border: currentCursor == i
                          ? Border.all(
                              width: 3,
                              color: AppColors.primaryColor,
                            )
                          : null,
                      borderRadius: AppDimens.borderRadiusSm,
                    ),
                    child: Center(
                      child: Text(
                        otpValues[i],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ).paddingSymmetric(
                  horizontal: 5,
                ),
              ),
          ],
        ).marginSymmetric(
          horizontal: 40,
        ),
      ],
    );
  }
}