import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:priority_soft/gen/assets.gen.dart';
import 'package:priority_soft/utils/colors/app_colors.dart';
import 'package:priority_soft/utils/font_utils/app_text_style.dart';

class HomeDisplayWidget extends StatefulWidget {
  const HomeDisplayWidget({super.key});

  @override
  State<HomeDisplayWidget> createState() => _HomeDisplayWidgetState();
}

class _HomeDisplayWidgetState extends State<HomeDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset("assets/images/shoe1.png"),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Text(
            "Jordan 1 Retro High Tie Dye",
            style: AppTextStyle.bodyText100.copyWith(
                color: AppColors.primary500, fontWeight: FontWeight.w300),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            SvgPicture.asset(Assets.images.star, width: 15, height: 15),
            const SizedBox(
              width: 5,
            ),
            Text(
              "4.5",
              style: AppTextStyle.bodyText100
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Text(" (1045 Reviews)",
                  style: AppTextStyle.bodyText100.copyWith(
                    color: AppColors.primary300,
                  )),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Text(
            "\$235,00",
            style:
                AppTextStyle.heading300.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
