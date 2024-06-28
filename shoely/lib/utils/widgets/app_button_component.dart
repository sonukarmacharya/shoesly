import 'package:flutter/material.dart';
import 'package:priority_soft/utils/colors/app_colors.dart';
import 'package:priority_soft/utils/font_utils/app_text_style.dart';

enum ButtonType {
  primary,
  secondary,
}

class AppButtonComponent extends StatelessWidget {
  Function() onTap;
  String title;
  ButtonType type;

  AppButtonComponent(
      {super.key,
      required this.title,
      required this.onTap,
      this.type = ButtonType.primary});

  @override
  Widget build(BuildContext context) {
    return type == ButtonType.primary
        ? GestureDetector(
            onTap: () => onTap(),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.primary500),
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    title,
                    style: AppTextStyle.heading300
                        .copyWith(color: AppColors.primary0),
                  ),
                )),
          )
        : GestureDetector(
            onTap: () => onTap(),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(color: AppColors.primary200, width: 2),
              ),
              alignment: Alignment.center,
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(title,
                      style: AppTextStyle.heading300
                          .copyWith(color: AppColors.primary500))),
            ),
          );
  }
}
