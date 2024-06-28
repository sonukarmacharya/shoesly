import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:priority_soft/features/home/ui/widgets/add_to_cart_container_widget.dart';
import 'package:priority_soft/features/home/ui/widgets/home_detail_bottom_nav_widget.dart';
import 'package:priority_soft/features/review/ui/screens/review_main_screen.dart';
import 'package:priority_soft/gen/assets.gen.dart';
import 'package:priority_soft/utils/colors/app_colors.dart';
import 'package:priority_soft/utils/font_utils/app_text_style.dart';
import 'package:priority_soft/utils/widgets/app_bottom_sheet.dart';
import 'package:priority_soft/utils/widgets/app_button_component.dart';
import 'package:priority_soft/utils/widgets/app_header_component.dart';
import 'package:priority_soft/utils/widgets/desc_text_component.dart';
import 'package:priority_soft/utils/widgets/review_display_component.dart';

class HomeDetailScreen extends StatefulWidget {
  const HomeDetailScreen({super.key});

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  final int _current = 0;
  List<Color> colors = [
    AppColors.primary200,
    AppColors.primary500,
    AppColors.primary800,
    AppColors.information500,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppHeaderComponent(
                child: SvgPicture.asset(Assets.images.cart),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // product image
                      Stack(
                        children: [
                          CarouselSlider.builder(
                            itemCount: 3,
                            options: CarouselOptions(
                              autoPlay: true,
                              viewportFraction: 1,
                              enlargeCenterPage: false,
                              initialPage: 0,
                              autoPlayCurve: Curves.easeIn,
                              height: 315,
                              padEnds: false,
                              onPageChanged: (index, reason) {},
                            ),
                            itemBuilder: (context, index, realIndex) => InkWell(
                              onTap: () => {},
                              child: Stack(
                                children: [
                                  Center(
                                    child: SizedBox(
                                      // height: MediaQuery.of(context).size.h,
                                      width: 250,
                                      //alignment: Alignment.center,
                                      child: Image.asset(
                                        "assets/images/Product.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.primary500
                                          .withOpacity(0.05),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 16,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.78,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [1, 2, 3].map((entry) {
                                      return GestureDetector(
                                        child: Container(
                                          width: 10,
                                          height: 10.0,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: (Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : AppColors.primary700)
                                                .withOpacity(_current == entry
                                                    ? 0.9
                                                    : 0.4),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          ...List.generate(colors.length,
                                              (index) {
                                            return Container(
                                              width: 20,
                                              height: 20,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: colors[index],
                                              ),
                                            );
                                          })
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //product name and rating
                      DescTextComponent(
                        productName: "Jordan 1 Retro High Tie Dye",
                        productRating: "4.5",
                        productReview: "1045",
                        productNameTextWidth:
                            MediaQuery.of(context).size.width * 0.8,
                        productRatingTextWidth:
                            MediaQuery.of(context).size.width * 0.3,
                        productNameTextStyle: AppTextStyle.heading600,
                        isNeedStar: false,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //product size
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Size",
                            style: AppTextStyle.heading400
                                .copyWith(color: AppColors.primary500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              ...List.generate(
                                  4,
                                  (index) => Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            border: Border.all(
                                                color: AppColors.primary200,
                                                width: 2),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "39",
                                              style: AppTextStyle.heading300
                                                  .copyWith(
                                                      color:
                                                          AppColors.primary400),
                                            ),
                                          ),
                                        ),
                                      ))
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //product description
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: AppTextStyle.heading400
                                .copyWith(color: AppColors.primary500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
                            style: AppTextStyle.bodyText200
                                .copyWith(color: AppColors.primary400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //product review
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Review (1045)",
                            style: AppTextStyle.heading400
                                .copyWith(color: AppColors.primary500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ...List.generate(
                              3,
                              (index) => const Padding(
                                  padding: EdgeInsets.only(bottom: 30.0),
                                  child: ReviewDisplayComponent())),
                          const SizedBox(
                            height: 30,
                          ),
                          AppButtonComponent(
                            title: "SEE ALL REVIEWS",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ReviewMainScreen(),
                              ));
                            },
                            type: ButtonType.secondary,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:  HomeDetailBottomNav(
          priceTitle:  "Price",
          priceValue: "\$199.99",
          buttonName: "ADD TO CART",
          onTap: () {
            showAppBottomSheet(
                      context: context,
                      showBlurBackground: false,
                      isDismissible: false,
                      child: const AddToCartContainerWidget());
          },
        ));
  }
}
