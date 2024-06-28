import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_svg/svg.dart';
import 'package:priority_soft/gen/assets.gen.dart';
import 'package:priority_soft/utils/colors/app_colors.dart';
import 'package:priority_soft/utils/font_utils/app_text_style.dart';

class DescTextComponent extends StatelessWidget {
  final String productName;
  final String productRating;
  final String productReview;
  final double productNameTextWidth;
  final double productRatingTextWidth;
  final TextStyle productNameTextStyle;
  final bool isNeedStar;
  const DescTextComponent(
      {super.key,
      required this.productName,
      required this.productRating,
      required this.productReview,
      required this.productNameTextWidth,
      required this.productRatingTextWidth,
      required this.productNameTextStyle,
      this.isNeedStar = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: productNameTextWidth,
          child: Text(productName, style: productNameTextStyle),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            isNeedStar
                ? SvgPicture.asset(Assets.images.star, width: 15, height: 15)
                : StarRating(
                    rating: 4.5,
                    size: 18,
                    allowHalfRating: false,
                  ),
            const SizedBox(
              width: 5,
            ),
            Text(
              productRating,
              style: AppTextStyle.bodyText100
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: productRatingTextWidth,
              child: Text(" ($productReview Reviews)",
                  style: AppTextStyle.bodyText100.copyWith(
                    color: AppColors.primary300,
                  )),
            )
          ],
        ),
      ],
    );
  }
}
