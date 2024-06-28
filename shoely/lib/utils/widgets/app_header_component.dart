import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:priority_soft/gen/assets.gen.dart';
import 'package:priority_soft/utils/colors/app_colors.dart';
import 'package:priority_soft/utils/font_utils/app_text_style.dart';

class AppHeaderComponent extends StatelessWidget {
  final String title;
  final Widget? child;
  const AppHeaderComponent({super.key, this.title='',this.child});  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: SvgPicture.asset(Assets.images.arrowLeft)),
        Text(
          title,
          style: AppTextStyle.heading400.copyWith(color: AppColors.primary500),
        ),
        
        child ?? const SizedBox()
      ],
    );
  }
}
