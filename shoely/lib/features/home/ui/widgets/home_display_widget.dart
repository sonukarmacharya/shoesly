import 'package:flutter/material.dart';
import 'package:priority_soft/features/home/ui/screens/home_detail_screen.dart';
import 'package:priority_soft/utils/colors/app_colors.dart';
import 'package:priority_soft/utils/font_utils/app_text_style.dart';
import 'package:priority_soft/utils/widgets/desc_text_component.dart';

class HomeDisplayWidget extends StatefulWidget {
  const HomeDisplayWidget({super.key});

  @override
  State<HomeDisplayWidget> createState() => _HomeDisplayWidgetState();
}

class _HomeDisplayWidgetState extends State<HomeDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomeDetailScreen(),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/images/shoe1.png"),
          const SizedBox(
            height: 10,
          ),
           DescTextComponent(
              productName: "Jordan 1 Retro High Tie Dye",
              productRating: "4.5",
              productReview: "1045",
              productNameTextWidth: MediaQuery.of(context).size.width * 0.4,
              productRatingTextWidth:MediaQuery.of(context).size.width * 0.3,
              productNameTextStyle: AppTextStyle.bodyText100.copyWith(
                  color: AppColors.primary500, fontWeight: FontWeight.w300)),
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
      ),
    );
  }
}
