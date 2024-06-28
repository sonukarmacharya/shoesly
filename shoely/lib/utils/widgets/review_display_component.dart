import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:priority_soft/utils/colors/app_colors.dart';
import 'package:priority_soft/utils/font_utils/app_text_style.dart';

class ReviewDisplayComponent extends StatelessWidget {
  const ReviewDisplayComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: ClipOval(
              child: Image.asset(
            "assets/images/Product.png",
            fit: BoxFit.cover,
          )),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Nolan Carder", style: AppTextStyle.heading300),
                  Text("Today", style: AppTextStyle.bodyText100),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: StarRating(
                rating: 4.5,
                size: 18,
                allowHalfRating: false,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Perfect for keeping your feet dry and warm in damp conditions. ',
                style: AppTextStyle.bodyText100
                    .copyWith(color: AppColors.primary500),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
