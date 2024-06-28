import 'package:flutter/material.dart';
import 'package:priority_soft/utils/widgets/review_display_component.dart';

class ReeviewDisplayListScreen extends StatelessWidget {
  const ReeviewDisplayListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
              10,
              (index) => const Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: ReviewDisplayComponent(),
                  ))
        ],
      ),
    );
  }
}
