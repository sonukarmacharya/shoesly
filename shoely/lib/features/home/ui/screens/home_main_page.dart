import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:priority_soft/features/home/ui/screens/home_display_screen.dart';
import 'package:priority_soft/gen/assets.gen.dart';
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
  List<String> tabs = ['All', 'Nike', 'Jordan', 'Adidas', 'Reebok'];

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  getTabs() {
    return tabs
        .map(
          (e) => Tab(
            child: Text(
              e,
              style: AppTextStyle.heading600,
            ),
          ),
        )
        .toList();
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
            SizedBox(
              child: TabBar(
                  dividerColor: Colors.transparent,
                  controller: tabController,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  automaticIndicatorColorAdjustment: true,
                  unselectedLabelColor: AppColors.primary300,
                  indicatorSize: TabBarIndicatorSize.tab,
                  padding: EdgeInsetsDirectional.zero,
                  onTap: (value) {},
                  labelColor: AppColors.primary500,
                  tabs: getTabs()),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: TabBarView(
                    controller: tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      HomeDisplayScreen(),
                      Text("data"),
                      Text("data"),
                      Text("data"),
                      Text("data"),
                    ],
                  ),
                ),
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
