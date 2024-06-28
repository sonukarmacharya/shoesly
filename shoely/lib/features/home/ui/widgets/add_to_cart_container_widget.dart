import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:priority_soft/features/cart/ui/screens/cart_list_display_main_screen.dart';
import 'package:priority_soft/gen/assets.gen.dart';
import 'package:priority_soft/utils/colors/app_colors.dart';
import 'package:priority_soft/utils/font_utils/app_text_style.dart';
import 'package:priority_soft/utils/widgets/app_bottom_sheet.dart';
import 'package:priority_soft/utils/widgets/app_button_component.dart';

class AddToCartContainerWidget extends StatefulWidget {
  const AddToCartContainerWidget({super.key});

  @override
  State<AddToCartContainerWidget> createState() =>
      _AddToCartContainerWidgetState();
}

class _AddToCartContainerWidgetState extends State<AddToCartContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Add To Cart",
                style: AppTextStyle.heading600,
              ),
              GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close))
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Quantity",
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
              decoration: InputDecoration(
                  labelText: "Enter Quantity",
                  hintText: "Enter Quantity",
                  labelStyle: AppTextStyle.bodyText100,
                  suffixIcon: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 58,
                    width: 100,
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          SvgPicture.asset(Assets.images.minusCirlce),
                          SvgPicture.asset(Assets.images.addCircle),
                        ],
                      ),
                    ),
                  ))
              //controller: userInput,
              ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Total Price",
                      style: AppTextStyle.bodyText100
                          .copyWith(color: AppColors.primary300)),
                  Text("\$199.99",
                      style: AppTextStyle.heading600
                          .copyWith(color: AppColors.primary500)),
                ],
              ),
              AppButtonComponent(
                title: "ADD TO CART",
                onTap: () {
                  // Navigator.pop(context);
                  showAppBottomSheet(
                      context: context,
                      showBlurBackground: false,
                      isDismissible: false,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            SvgPicture.asset(Assets.images.tickCircle),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Added to cart",
                              style: AppTextStyle.heading700,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "1 Item Total",
                              style: AppTextStyle.bodyText200,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: AppButtonComponent(
                                      title: 'BACK EXPLORE',
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      type: ButtonType.secondary),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: AppButtonComponent(
                                    title: 'TO CART',
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CartDisplayListMainScreen()),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
