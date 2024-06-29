import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:priority_soft/features/home/ui/screens/home_display_screen.dart';
import 'package:priority_soft/gen/assets.gen.dart';
import 'package:priority_soft/service/database.dart';
import 'package:priority_soft/utils/colors/app_colors.dart';
import 'package:priority_soft/utils/font_utils/app_text_style.dart';

class HomeMainPage extends StatefulWidget {
  const HomeMainPage({super.key});

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage>
    with TickerProviderStateMixin {
  TabController? tabController;
  Stream<QuerySnapshot>? _usersStream;
  int totalBrandLength = 0;
  ValueNotifier<String> selestedBrandName = ValueNotifier<String>('all');

  @override
  void initState() {
    super.initState();
    _usersStream = DatabaseMethods().getBrands();
  }

  @override
  void dispose() {
    tabController?.dispose();
    selestedBrandName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 70),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Discover',
                  style: AppTextStyle.heading700,
                ),
                SvgPicture.asset(Assets.images.cart)
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: _usersStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  totalBrandLength = snapshot.data!.docs.length;
                  if (tabController == null ||
                      tabController!.length != totalBrandLength) {
                    tabController =
                        TabController(length: totalBrandLength, vsync: this);
                    selestedBrandName.value = snapshot.data!.docs[0]['name'];
                  }

                  return SizedBox(
                    child: TabBar(
                      dividerColor: Colors.transparent,
                      controller: tabController,
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      automaticIndicatorColorAdjustment: true,
                      unselectedLabelColor: AppColors.primary300,
                      indicatorSize: TabBarIndicatorSize.tab,
                      padding: EdgeInsetsDirectional.zero,
                      onTap: (value) {
                        setState(() {
                          selestedBrandName.value =
                              snapshot.data!.docs[value]['name'];
                        });
                      },
                      labelColor: AppColors.primary500,
                      tabs: snapshot.data!.docs
                          .map(
                            (e) => Tab(
                              child: Text(
                                e['name'],
                                style: AppTextStyle.heading600,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            Expanded(
              child: ValueListenableBuilder<String>(
                valueListenable: selestedBrandName,
                builder: (context, notifierValue, child) {
                  if (tabController == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return TabBarView(
                      controller: tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ...List.generate(
                          totalBrandLength,
                          (index) => HomeDisplayScreen(
                            selestedBrandName: notifierValue,
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        extendedPadding: const EdgeInsets.all(32),
        label: Text(
          'FILTER',
          style: AppTextStyle.heading500.copyWith(color: AppColors.primary0),
        ),
        icon: SvgPicture.asset(Assets.images.filter, width: 25, height: 25),
        backgroundColor: AppColors.primary500,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
