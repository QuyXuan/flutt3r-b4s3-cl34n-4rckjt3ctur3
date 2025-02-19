import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  final Widget contentWidget;
  final double? width;
  final double? height;
  final Widget? titleWidget;
  final bool? hasCloseButton;
  final bool? hasOKButton;
  final String? closeButtonText;
  final String? okButtonText;
  final Color? okButtonColor;
  final VoidCallback? onCloseButtonPressed;
  final VoidCallback? onOKButtonPressed;

  const CustomAlertDialog({
    super.key,
    required this.contentWidget,
    this.titleWidget,
    this.hasCloseButton,
    this.hasOKButton,
    this.closeButtonText,
    this.okButtonText,
    this.okButtonColor,
    this.onCloseButtonPressed,
    this.onOKButtonPressed,
    this.width,
    this.height,
  });

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xffe6e7e9),
      shadowColor: Theme.of(context).primaryColor,
      surfaceTintColor: const Color(0xffe6e7e9),
      insetPadding: const EdgeInsets.symmetric(horizontal: 0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      title: widget.titleWidget,
      content: Container(
        color: const Color(0xffe6e7e9),
        width: widget.width ?? MediaQuery.of(context).size.width * 0.8,
        height: widget.height,
        child: widget.contentWidget,
      ),
      actions: [
        (widget.hasCloseButton ?? false)
            ? GestureDetector(
                onTap: widget.onCloseButtonPressed ??
                    () {
                      Navigator.of(context).pop();
                    },
                child: Container(
                  width: (MediaQuery.of(context).size.width * 0.8 - 40) / 2,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xffe6e7e9),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 2),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Center(
                    child: Text(
                      widget.closeButtonText ?? 'Close',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        (widget.hasOKButton ?? false)
            ? GestureDetector(
                onTap: widget.onOKButtonPressed ?? () {},
                child: Container(
                  height: 45,
                  width: (MediaQuery.of(context).size.width * 0.8 - 20) / 2,
                  decoration: BoxDecoration(
                    color: widget.okButtonColor ?? Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Center(
                    child: Text(
                      widget.okButtonText ?? 'OK',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
