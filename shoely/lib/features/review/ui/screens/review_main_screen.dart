import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:priority_soft/features/review/ui/screens/review_display_list_screen.dart';
import 'package:priority_soft/gen/assets.gen.dart';
import 'package:priority_soft/utils/colors/app_colors.dart';
import 'package:priority_soft/utils/font_utils/app_text_style.dart';
import 'package:priority_soft/utils/widgets/app_header_component.dart';

class ReviewMainScreen extends StatefulWidget {
  const ReviewMainScreen({super.key});

  @override
  State<ReviewMainScreen> createState() => _ReviewMainScreenState();
}

class _ReviewMainScreenState extends State<ReviewMainScreen>
    with TickerProviderStateMixin {
  TabController? tabController;
  List<String> tabs = ['All', '5 Star', '4 Star', '3 Star', '2 Star'];

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
            AppHeaderComponent(
              title: 'Review(1045)',
              child: Row(
                children: [
                  SvgPicture.asset(Assets.images.star, width: 15, height: 15),
                  const Text('4.5')
                ],
              ),
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
            const SizedBox(
              height: 30,
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
                      ReeviewDisplayListScreen(),
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
    );
  }
}
