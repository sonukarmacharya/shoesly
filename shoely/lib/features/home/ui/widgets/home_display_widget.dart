import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:priority_soft/utils/colors/app_colors.dart';
import 'package:priority_soft/utils/font_utils/app_text_style.dart';
import 'package:priority_soft/utils/widgets/desc_text_component.dart';

class HomeDisplayWidget extends StatefulWidget {
  String productName;
  String price;
  String rate;
  String review;
  String? id;

  HomeDisplayWidget(
      {super.key,
      required this.productName,
      required this.price,
      required this.rate,
      required this.review,
      required this.id});

  @override
  State<HomeDisplayWidget> createState() => _HomeDisplayWidgetState();
}

class _HomeDisplayWidgetState extends State<HomeDisplayWidget> {
  Stream<QuerySnapshot>? _productDetailStream;

  @override
  void initState() {
    print("widget.id");
    print(widget.id);
    //_productDetailStream = DatabaseMethods().getProdductDetails(widget.id!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/images/shoe1.png"),
          const SizedBox(
            height: 10,
          ),
          DescTextComponent(
              productName: widget.productName,
              productRating: widget.rate,
              productReview: widget.review,
              productNameTextWidth: MediaQuery.of(context).size.width * 0.4,
              productRatingTextWidth: MediaQuery.of(context).size.width * 0.3,
              productNameTextStyle: AppTextStyle.bodyText100.copyWith(
                  color: AppColors.primary500, fontWeight: FontWeight.w300)),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              widget.price,
              style:
                  AppTextStyle.heading300.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
