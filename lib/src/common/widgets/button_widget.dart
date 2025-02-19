import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/colors.gen.dart';
import '../constants/ui_constants.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    super.key,
    required this.title,
    required this.onTextButtonPressed,
    this.foregroundColor = Colors.white,
    this.backgroundColor = ColorName.primary,
    this.borderSideColor = Colors.transparent,
  });

  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderSideColor;
  final String title;
  final VoidCallback? onTextButtonPressed;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.w),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            ElevatedButton(
              onPressed: widget.onTextButtonPressed,
              style: ElevatedButton.styleFrom(
                foregroundColor: widget.foregroundColor,
                backgroundColor: widget.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(UIConstants.kRadius),
                  side: BorderSide(
                    color: widget.borderSideColor,
                    width: 1.w,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: ColorName.black,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
