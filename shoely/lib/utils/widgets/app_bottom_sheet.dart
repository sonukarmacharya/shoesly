import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:priority_soft/utils/colors/app_colors.dart';

Future<T?> showAppBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  Color? backgroundColor,
  double elevation = 0.0,
  bool showBlurBackground = false,
  bool isDismissible = false,
  double? minimumHeight,
}) async {
  return await showModalBottomSheet(
    useRootNavigator: true,
    context: context,
    builder: (_) => showBlurBackground
        ? BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 12,
              sigmaY: 12,
            ),
            child: _AppBottomSheet(
              minHeight: minimumHeight,
              child: child,
            ),
          )
        : _AppBottomSheet(
            minHeight: minimumHeight,
            child: child,
          ),
    backgroundColor: backgroundColor ?? Colors.transparent,
    barrierColor: Colors.black.withOpacity(0.3),
    elevation: elevation,
    isDismissible: isDismissible,
    isScrollControlled: true,
    enableDrag: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(15),
        topLeft: Radius.circular(15),
      ),
    ),
  );
}

class _AppBottomSheet extends StatelessWidget {
  final Widget child;
  final double? minHeight;
  final bool isFloatingCross;

  const _AppBottomSheet({
    super.key,
    required this.child,
    this.minHeight,
    this.isFloatingCross = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: AppBar().preferredSize.height),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              clipBehavior: Clip.antiAlias,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: minHeight ?? 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          height: 4,
                          width: 44,
                          color: AppColors.primary200,
                        ),
                      ),
                      child,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBottomSheet extends StatelessWidget {
  final Widget? bodyWidget;

  const AppBottomSheet({
    super.key,
    this.bodyWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(padding: const EdgeInsets.all(16), child: bodyWidget),
    );
  }
}
