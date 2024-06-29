import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:priority_soft/utils/colors/app_colors.dart';

class HomeDetailImageWidget extends StatefulWidget {
  const HomeDetailImageWidget({super.key});

  @override
  State<HomeDetailImageWidget> createState() => _HomeDetailImageWidgetState();
}

class _HomeDetailImageWidgetState extends State<HomeDetailImageWidget> {
  final int _current = 0;

  List<Color> colors = [
    AppColors.primary200,
    AppColors.primary500,
    AppColors.primary800,
    AppColors.information500,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    color: AppColors.primary500.withOpacity(0.05),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [1, 2, 3].map((entry) {
                    return GestureDetector(
                      child: Container(
                        width: 10,
                        height: 10.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              (Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white
                                      : AppColors.primary700)
                                  .withOpacity(_current == entry ? 0.9 : 0.4),
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
                        ...List.generate(colors.length, (index) {
                          return Container(
                            width: 20,
                            height: 20,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
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
    );
  }
}
