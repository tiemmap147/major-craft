import 'package:flutter/material.dart';
import 'package:major_craft_application/core/enum/app_enum.dart';

class InkWellWithFeedback extends StatefulWidget {
  const InkWellWithFeedback({
    Key? key,
    this.child,
    required this.onTap,
    this.childColor,
    this.inkWellFeedBackFor = 0,
  }) : super(key: key);
  final Widget? child;
  final VoidCallback onTap;
  final Color? childColor;
  final int inkWellFeedBackFor;

  @override
  State<InkWellWithFeedback> createState() => _InkWellWithFeedbackState();
}

class _InkWellWithFeedbackState extends State<InkWellWithFeedback> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => {
        setState(() {
          _isTapped = true;
        }),
      },
      onTapCancel: () => {
        setState(() {
          _isTapped = false;
        }),
      },
      onTapUp: (details) => {
        setState(() {
          _isTapped = false;
        }),
        widget.onTap(),
      },
      child: widget.inkWellFeedBackFor == InkWellFeedBackFor.icon.index
          ? AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              child: ColorFiltered(
                colorFilter:
                    ColorFilter.mode(_isTapped ? Colors.grey : widget.childColor ?? Colors.white, BlendMode.srcIn),
                child: widget.child,
              ),
            )
          : AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              color: _isTapped ? Colors.grey.withOpacity(0.3) : widget.childColor ?? Colors.transparent,
              child: widget.child,
            ),
    );
  }
}
