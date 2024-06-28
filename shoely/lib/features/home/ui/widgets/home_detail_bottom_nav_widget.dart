import 'package:flutter/material.dart';
import 'package:priority_soft/utils/colors/app_colors.dart';
import 'package:priority_soft/utils/font_utils/app_text_style.dart';
import 'package:priority_soft/utils/widgets/app_button_component.dart';

class HomeDetailBottomNav extends StatefulWidget {
  final String priceTitle;
  final String priceValue;
  final String buttonName;
  final Function() onTap;

  const HomeDetailBottomNav(
      {super.key,
      required this.priceTitle,
      required this.priceValue,
      required this.buttonName,
      required this.onTap});

  @override
  State<HomeDetailBottomNav> createState() => _HomeDetailBottomNavState();
}

class _HomeDetailBottomNavState extends State<HomeDetailBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: AppColors.primary0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(widget.priceTitle,
                      style: AppTextStyle.bodyText100
                          .copyWith(color: AppColors.primary300)),
                  Text(widget.priceValue,
                      style: AppTextStyle.heading600
                          .copyWith(color: AppColors.primary500)),
                ],
              ),
              AppButtonComponent(
                title: widget.buttonName,
                onTap: () {
                  widget.onTap();
                },
              ),
            ],
          ),
        ));
  }
}
