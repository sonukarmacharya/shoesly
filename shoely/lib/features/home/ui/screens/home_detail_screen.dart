import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:priority_soft/features/home/ui/widgets/add_to_cart_container_widget.dart';
import 'package:priority_soft/features/home/ui/widgets/home_detail_bottom_nav_widget.dart';
import 'package:priority_soft/features/home/ui/widgets/home_detail_image_widget.dart';
import 'package:priority_soft/features/review/ui/screens/review_main_screen.dart';
import 'package:priority_soft/gen/assets.gen.dart';
import 'package:priority_soft/service/database.dart';
import 'package:priority_soft/utils/colors/app_colors.dart';
import 'package:priority_soft/utils/font_utils/app_text_style.dart';
import 'package:priority_soft/utils/widgets/app_bottom_sheet.dart';
import 'package:priority_soft/utils/widgets/app_button_component.dart';
import 'package:priority_soft/utils/widgets/app_header_component.dart';
import 'package:priority_soft/utils/widgets/desc_text_component.dart';
import 'package:priority_soft/utils/widgets/review_display_component.dart';

class HomeDetailScreen extends StatefulWidget {
  final String? id;
  const HomeDetailScreen({super.key, required this.id});

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
  Stream<QuerySnapshot>? _productDetailStream;

  String? selectedSize;

  List<Map<String, dynamic>> sizes = [
    {"value": false, "price": 10},
    {"value": false, "price": 20},
    {"value": false, "price": 30},
    {"value": false, "price": 40},
    {"value": false, "price": 50},
  ];

  @override
  void initState() {
    _productDetailStream = DatabaseMethods().getAllProdducts();

    super.initState();
  }

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
              StreamBuilder<QuerySnapshot>(
                stream: _productDetailStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...List.generate(
                                snapshot.data!.docs.length,
                                (index) => snapshot.data!.docs[index].id ==
                                        widget.id!
                                    ? Column(
                                        children: [
                                          // product image
                                          const HomeDetailImageWidget(),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          //product name and rating
                                          DescTextComponent(
                                            productName:
                                                "Jordan 1 Retro High Tie Dye",
                                            productRating: "4.5",
                                            productReview: "1045",
                                            productNameTextWidth:
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                            productRatingTextWidth:
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                            productNameTextStyle:
                                                AppTextStyle.heading600,
                                            isNeedStar: false,
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          //product size
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Size",
                                                style: AppTextStyle.heading400
                                                    .copyWith(
                                                        color: AppColors
                                                            .primary500),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  ...List.generate(
                                                      sizes.length,
                                                      (index) =>
                                                          GestureDetector(
                                                            onTap: () {
                                                              print(index);
                                                              print(sizes[index]
                                                                  ['value']);
                                                              if (sizes[index][
                                                                      'value'] ==
                                                                  true) {
                                                                setState(() {
                                                                  sizes[index][
                                                                          'value'] =
                                                                      false;
                                                                  selectedSize =
                                                                      sizes[index]
                                                                              [
                                                                              'price']
                                                                          .toString();
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  sizes[index][
                                                                          'value'] =
                                                                      true;
                                                                  selectedSize =
                                                                      null;
                                                                });
                                                              }
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right:
                                                                          15.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: selectedSize !=
                                                                              null &&
                                                                          selectedSize ==
                                                                              sizes[index]['price']
                                                                                  .toString()
                                                                      ? AppColors
                                                                          .primary800
                                                                      : AppColors
                                                                          .primary0,
                                                                  border: Border.all(
                                                                      color: AppColors
                                                                          .primary200,
                                                                      width: 2),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Text(
                                                                    sizes[index]
                                                                            [
                                                                            'price']
                                                                        .toString(),
                                                                    style: AppTextStyle
                                                                        .heading300
                                                                        .copyWith(
                                                                            color: selectedSize != null && selectedSize == sizes[index]['price'].toString()
                                                                                ? AppColors.primary0
                                                                                : AppColors.primary400),
                                                                  ),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Description",
                                                style: AppTextStyle.heading400
                                                    .copyWith(
                                                        color: AppColors
                                                            .primary500),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
                                                style: AppTextStyle.bodyText200
                                                    .copyWith(
                                                        color: AppColors
                                                            .primary400),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          //product review
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Review (1045)",
                                                style: AppTextStyle.heading400
                                                    .copyWith(
                                                        color: AppColors
                                                            .primary500),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              ...List.generate(
                                                  3,
                                                  (index) => const Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 30.0),
                                                      child:
                                                          ReviewDisplayComponent())),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              AppButtonComponent(
                                                title: "SEE ALL REVIEWS",
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ReviewMainScreen(),
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
                                      )
                                    : const SizedBox()),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: HomeDetailBottomNav(
          priceTitle: "Price",
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