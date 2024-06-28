import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:priority_soft/features/home/ui/widgets/home_detail_bottom_nav_widget.dart';
import 'package:priority_soft/features/order/ui/screens/order_list_main_screen.dart';
import 'package:priority_soft/gen/assets.gen.dart';
import 'package:priority_soft/utils/colors/app_colors.dart';
import 'package:priority_soft/utils/font_utils/app_text_style.dart';
import 'package:priority_soft/utils/widgets/app_header_component.dart';

class CartDisplayListMainScreen extends StatefulWidget {
  const CartDisplayListMainScreen({super.key});

  @override
  State<CartDisplayListMainScreen> createState() =>
      _CartDisplayListMainScreenState();
}

class _CartDisplayListMainScreenState extends State<CartDisplayListMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 70),
        child: Column(
          children: [
            const AppHeaderComponent(
              title: "Cart",
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...List.generate(
                        4,
                        (index) => Dismissible(
                              key: Key(index.toString()),
                              background: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.error500,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: SvgPicture.asset(Assets.images.trash,
                                    height: 5, width: 5, fit: BoxFit.scaleDown),
                              ),
                              onDismissed: (direction) {},
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 14),
                                          child: Container(
                                            width: 70,
                                            height: 50,
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              "assets/images/Product.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 88,
                                          height: 88,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: AppColors.primary500
                                                .withOpacity(0.1),
                                          ),
                                          // child: const Text("as"),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.58,
                                            child: Text(
                                              "Jordan 1 Retro High Tie Dye",
                                              style: AppTextStyle.heading400
                                                  .copyWith(
                                                      color:
                                                          AppColors.primary500),
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.58,
                                          child: Text(
                                            'Nike . Red Grey . 40',
                                            style: AppTextStyle.bodyText100
                                                .copyWith(
                                                    color:
                                                        AppColors.primary500),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.58,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                child: Text('\$235,00',
                                                    style: AppTextStyle
                                                        .heading300
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  SvgPicture.asset(Assets
                                                      .images.minusCirlce),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text("1"),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  SvgPicture.asset(
                                                      Assets.images.addCircle),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HomeDetailBottomNav(
        priceTitle: "Grand Total",
        priceValue: "\$199.99",
        buttonName: "CHECKOUT",
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const OrderListMainScreen()),
          );
        },
      ),
    );
  }
}
