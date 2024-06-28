import 'package:flutter/material.dart';
import 'package:priority_soft/features/home/ui/widgets/home_detail_bottom_nav_widget.dart';
import 'package:priority_soft/utils/colors/app_colors.dart';
import 'package:priority_soft/utils/font_utils/app_text_style.dart';
import 'package:priority_soft/utils/widgets/app_header_component.dart';

class OrderListMainScreen extends StatelessWidget {
  const OrderListMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeaderComponent(
              title: "Order Summary",
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Information",
                  style: AppTextStyle.heading500,
                ),
                const SizedBox(
                  height: 20,
                ),
                infoCard(
                  "Payment Method",
                  "Credit Card",
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: AppColors.primary100,
                ),
                const SizedBox(
                  height: 20,
                ),
                infoCard(
                  "Location",
                  "Semarang, Indonesia",
                ),
                const SizedBox(
                  height: 30,
                ),
                //order
                const Text(
                  "Order Details",
                  style: AppTextStyle.heading500,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Jordan 1 Retro High Tie Dye',
                  style: AppTextStyle.heading400
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      ' Nike . Red Grey . 40 . Qty 1',
                      style: AppTextStyle.bodyText200,
                    ),
                    Text(
                      "\$232",
                      style: AppTextStyle.heading300
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                //payment
                const SizedBox(
                  height: 30,
                ),
                //order
                const Text(
                  "Payment Detail",
                  style: AppTextStyle.heading500,
                ),

                paymentContainer(
                  "Sub Total",
                  "\$34",
                ),
                paymentContainer(
                  "Shipping",
                  "\$34",
                ),
                const Divider(),
                paymentContainer(
                  " Total Order",
                  "\$34",
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: HomeDetailBottomNav(
        priceTitle: "Grand Total",
        priceValue: "\$199.99",
        buttonName: "PAYMENT",
        onTap: () {},
      ),
    );
  }

  paymentContainer(String title, String price) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                AppTextStyle.bodyText200.copyWith(color: AppColors.primary300),
          ),
          Text(
            price,
            style: AppTextStyle.heading400,
          )
        ],
      ),
    );
  }

  Row infoCard(
    String title,
    String desc,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  AppTextStyle.heading300.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(desc, style: AppTextStyle.bodyText200),
          ],
        ),
        const Icon(
          size: 18,
          Icons.arrow_forward_ios,
          color: AppColors.primary300,
        )
      ],
    );
  }
}
