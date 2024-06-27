import 'package:flutter/material.dart';
import 'package:priority_soft/features/home/ui/widgets/home_display_widget.dart';

class HomeDisplayScreen extends StatefulWidget {
  const HomeDisplayScreen({super.key});

  @override
  State<HomeDisplayScreen> createState() => _HomeDisplayScreenState();
}

class _HomeDisplayScreenState extends State<HomeDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => Builder(builder: (context) {
          return const HomeDisplayWidget();
        }),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 17,
          childAspectRatio: 0.65,
        ),
      ),
    );
  }
}
